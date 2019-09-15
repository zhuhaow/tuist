import Foundation
import TuistCoreTesting
import XCTest

@testable import ProjectDescription

final class BuildTaskTests: XCTestCase {
    
    func test_codable() {
        // Given
        let task = BuildTask.build(name: "Tuist",
                                   scheme: "Tuist",
                                   configuration: "Debug")
        
        // Then
        XCTAssertCodable(task)
    }
    
    func test_equatable() {
        // Given
        let first = BuildTask.build(name: "Tuist",
                                    scheme: "Tuist",
                                    configuration: "Debug")
        let second = BuildTask.build(name: "Tuist",
                                     scheme: "Tuist",
                                     configuration: "Debug")
        
        // Then
        XCTAssertEqual(first, second)
    }
    
}
