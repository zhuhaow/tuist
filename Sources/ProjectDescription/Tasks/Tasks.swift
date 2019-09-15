import Foundation

public class Tasks: Codable, Equatable {
    /// Build tasks
    private let build: [BuildTask]

    /// Initializes the tasks that will be exposed through Tuist's standard CLI.
    ///
    /// - Parameter build: Build tasks.
    public init(build: [BuildTask] = []) {
        self.build = build
        dumpIfNeeded(self)
    }

    // MARK: - Equatable

    public static func == (lhs: Tasks, rhs: Tasks) -> Bool {
        return lhs.build == rhs.build
    }
}
