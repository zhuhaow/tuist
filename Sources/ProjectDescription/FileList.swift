import Foundation

public struct FileList: Codable, Equatable {
    /// List glob patterns.
    public let globs: [Path]

    /// List glob patterns that will be exluced from the list.
    public let excluding: [Path]

    /// Initializes the files list with the glob patterns.
    ///
    /// - Parameter globs: Glob patterns.
    public init(globs: [Path], excluding: [Path] = []) {
        self.globs = globs
        self.excluding = excluding
    }

    public static func == (lhs: FileList, rhs: FileList) -> Bool {
        lhs.globs == rhs.globs
    }
}

extension FileList: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(globs: [Path(value)])
    }
}

extension FileList: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: String...) {
        self.init(globs: elements.map { Path($0) })
    }
}
