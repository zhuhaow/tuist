import Basic
import Foundation
import SPMUtility
import TuistSupport

public final class CommandRegistry {
    // MARK: - Attributes

    let parser: ArgumentParser
    var commands: [Command] = []
    private let errorHandler: ErrorHandling
    private let processArguments: ProcessArguments
    private let commandRunner: CommandRunning
    private let verboseArgument: OptionArgument<Bool>

    // MARK: - Init

    public convenience init() {
        self.init(processArguments: CommandRegistry.processArguments,
                  commands: [
                      LocalCommand.self,
                      BundleCommand.self,
                      UpdateCommand.self,
                      InstallCommand.self,
                      UninstallCommand.self,
                      VersionCommand.self,
                  ])
    }

    init(processArguments: ProcessArguments,
         errorHandler: ErrorHandling = ErrorHandler(),
         commandRunner: CommandRunning = CommandRunner(),
         commands: [Command.Type] = []) {
        parser = ArgumentParser(commandName: "tuist",
                                usage: "<command> <options>",
                                overview: "Manage the environment tuist versions.")

        verboseArgument = parser.add(option: "--verbose",
                                     shortName: "-v",
                                     kind: Bool.self,
                                     usage: "Enable verbose logging of System operations.")

        self.processArguments = processArguments
        self.errorHandler = errorHandler
        self.commandRunner = commandRunner
        commands.forEach(register)
    }

    // MARK: - Public

    public func run() {
        do {
            if processArguments.arguments.contains("--help-env") {
                parser.printUsage(on: stdoutStream)
            } else if let parsedArguments = parse() {
                let verbose = parsedArguments.get(verboseArgument) ?? false
                System.shared.verbose = verbose
                FileHandler.shared.verbose = verbose

                try process(arguments: parsedArguments)
            } else {
                try commandRunner.run()
            }
        } catch let error as FatalError {
            errorHandler.fatal(error: error)
        } catch {
            errorHandler.fatal(error: UnhandledError(error: error))
        }
    }

    // MARK: - Fileprivate

    private func parse() -> ArgumentParser.Result? {
        return try? parser.parse(processArguments.arguments)
    }

    private func register(command: Command.Type) {
        commands.append(command.init(parser: parser))
    }

    private func process(arguments: ArgumentParser.Result) throws {
        let subparser = arguments.subparser(parser)!
        let command = commands.first(where: { type(of: $0).command == subparser })!
        try command.run(with: arguments)
    }

    // MARK: - Static

    static var processArguments: ProcessArguments {
        .init(ProcessInfo.processInfo.arguments)
    }
}
