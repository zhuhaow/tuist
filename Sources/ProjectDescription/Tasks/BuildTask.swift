import Foundation

public final class BuildTask: Codable, Equatable {
    /// Task name. (e.g. tuist build {name}).
    private let name: String

    /// Scheme to be built.
    private let scheme: String

    /// Project configuration to be built.
    private let configuration: String

    /// Initializes the build task with its attribute.
    ///
    /// - Parameters:
    ///   - name: Task name. (e.g. tuist build {name})
    ///   - scheme: Scheme to be built.
    ///   - configuration: Project configuration to be built.
    private init(name: String,
                 scheme: String,
                 configuration: String) {
        self.name = name
        self.scheme = scheme
        self.configuration = configuration
    }

    /// Initializes the build task with its attribute.
    ///
    /// - Parameters:
    ///   - name: Task name. (e.g. tuist build {name})
    ///   - scheme: Scheme to be built.
    ///   - configuration: Project configuration to be built.
    /// - Returns: The build task instance.
    public class func build(name: String,
                            scheme: String,
                            configuration: String = "Debug") -> BuildTask {
        return BuildTask(name: name,
                         scheme: scheme,
                         configuration: configuration)
    }

    // MARK: - Equatable

    public static func == (lhs: BuildTask, rhs: BuildTask) -> Bool {
        return lhs.name == rhs.name &&
            lhs.scheme == rhs.scheme &&
            lhs.configuration == rhs.configuration
    }
}
