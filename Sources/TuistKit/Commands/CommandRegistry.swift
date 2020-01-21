import Basic
import Foundation
import SPMUtility
import TuistSupport

public final class CommandRegistry {
    // MARK: - Attributes

    let parser: ArgumentParser
    var commands: [Command] = []
    var rawCommands: [RawCommand] = []
    var hiddenCommands: [String: HiddenCommand] = [:]
    let verboseArgument: OptionArgument<Bool>
    
    var allCommandNames: [String] {
        commands.map { type(of: $0).command } + rawCommands.map { type(of: $0).command } + Array(hiddenCommands.keys)
    }

    private let errorHandler: ErrorHandling
    private let processArguments: ProcessArguments

    // MARK: - Init

    public convenience init() {
        self.init(errorHandler: ErrorHandler(),
                  processArguments: CommandRegistry.processArguments)
        register(command: InitCommand.self)
        register(command: GenerateCommand.self)
        register(command: DumpCommand.self)
        register(command: VersionCommand.self)
        register(command: CreateIssueCommand.self)
        register(command: FocusCommand.self)
        register(command: UpCommand.self)
        register(command: GraphCommand.self)
        register(command: EditCommand.self)
        register(command: CacheCommand.self)
        register(rawCommand: BuildCommand.self)
    }

    init(errorHandler: ErrorHandling,
         processArguments: ProcessArguments) {
        self.errorHandler = errorHandler
        parser = ArgumentParser(commandName: "tuist",
                                usage: "<command> <options>",
                                overview: "Generate, build and test your Xcode projects.")
        self.processArguments = processArguments

        verboseArgument = parser.add(option: "--verbose",
                                     shortName: "-v",
                                     kind: Bool.self,
                                     usage: "Enable verbose logging of System operations.")
    }

    public static var processArguments: ProcessArguments {
        .init(ProcessInfo.processInfo.arguments)
    }

    // MARK: - Internal

    func register(command: Command.Type) {
        commands.append(command.init(parser: parser))
    }

    func register(hiddenCommand command: HiddenCommand.Type) {
        hiddenCommands[command.command] = command.init()
    }

    func register(rawCommand command: RawCommand.Type) {
        rawCommands.append(command.init())
        parser.add(subparser: command.command, overview: command.overview)
    }

    // MARK: - Public

    public func run() {
        do {
            // Hidden command
            if let hiddenCommand = hiddenCommand() {
                try hiddenCommand.run(arguments: processArguments.dropCommand(matchingOne: allCommandNames))

                // Raw command
            } else if let commandName = processArguments.commandName(matchingOne: allCommandNames),
                let command = rawCommands.first(where: { type(of: $0).command == commandName }) {
                try command.run(arguments: processArguments.dropCommand(matchingOne: allCommandNames))

                // Normal command
            } else {
                let parsedArguments = try parse()

                let verbose = parsedArguments.get(verboseArgument) ?? false

                System.shared.verbose = verbose
                FileHandler.shared.verbose = verbose

                try process(arguments: parsedArguments)
            }
        } catch let error as FatalError {
            errorHandler.fatal(error: error)
        } catch {
            errorHandler.fatal(error: UnhandledError(error: error))
        }
    }

    // MARK: - Fileprivate

    private func parse() throws -> ArgumentParser.Result {
        return try parser.parse(processArguments.arguments)
    }

    private func hiddenCommand() -> HiddenCommand? {
        guard let commandName = processArguments.commandName(matchingOne: allCommandNames) else { return nil }
        return hiddenCommands[commandName]
    }

    private func process(arguments: ArgumentParser.Result) throws {
        guard let subparser = arguments.subparser(parser) else {
            parser.printUsage(on: stdoutStream)
            return
        }
        if let command = commands.first(where: { type(of: $0).command == subparser }) {
            try command.run(with: arguments)
        }
    }
}
