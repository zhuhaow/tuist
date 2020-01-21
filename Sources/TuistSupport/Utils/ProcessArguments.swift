//
//  ProcessArguments.swift
//  TuistSupport
//
//  Created by Atkinson, Oliver (Developer) on 21/01/2020.
//

import Foundation

public struct ProcessArguments {
    public let arguments: [String]
    public init(_ args: [String]) {
        arguments = Array(args.dropFirst())
    }
}

extension ProcessArguments: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: String...) { self.init(elements) }
}

extension ProcessArguments {
    
    /// Drops everything upto and including the command name.
    /// e.g. `tuist --verbose generate --path /tmp/a` would become `--path /tmp/a`.
    /// Currently only used when running a hidden command
    ///
    /// - Returns: Command name.
    public func dropCommand(matchingOne: [String]) -> [String] {
        Array(arguments.drop(while: not(isCommand(matchingOne))).dropFirst())
    }
    
    /// Returns the command name.
    /// e.g. `tuist --verbose generate --path /tmp/a` would resolve to `generate`.
    ///
    /// - Returns: Command name
    public func commandName(matchingOne: [String]) -> String? {
        arguments.first(where: isCommand(matchingOne))
    }
    
    /// returns true if the argument is a command
    /// e.g.
    ///     `--verbose` -> false
    ///     `generate`  -> true
    ///     `--path`    -> false
    ///     `/tmp/a`    -> false
    func isCommand(_ matchingOne: [String]) -> (_ argument: String) -> Bool {
        return matchingOne.contains
    }
    
}
