import Foundation
import TuistCoreTesting
import XCTest

@testable import ProjectDescription

final class TasksTests: XCTestCase {
    func test_codable() {
        // Given
        let tasks = Tasks(build: [
            .build(name: "Tuist",
                   scheme: "Tuist",
                   configuration: "Debug"),
        ])

        // Then
        XCTAssertCodable(tasks)
    }

    func test_equatable() {
        // Given
        let first = Tasks(build: [
            .build(name: "Tuist",
                   scheme: "Tuist",
                   configuration: "Debug"),
        ])
        let second = Tasks(build: [
            .build(name: "Tuist",
                   scheme: "Tuist",
                   configuration: "Debug"),
        ])

        // Then
        XCTAssertEqual(first, second)
    }
}
