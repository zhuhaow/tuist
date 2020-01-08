import Basic
import Foundation
import TuistCore
import TuistGalaxy

final class MockXCFrameworkBuilder: XCFrameworkBuilding {
    var buildProjectArgs: [(projectPath: AbsolutePath, target: Target)] = []
    var buildWorkspaceArgs: [(workspacePath: AbsolutePath, target: Target)] = []
    var buildProjectStub: AbsolutePath?
    var buildWorkspaceStub: AbsolutePath?

    func build(projectPath: AbsolutePath, target: Target) throws -> AbsolutePath {
        buildProjectArgs.append((projectPath: projectPath, target: target))
        if let buildProjectStub = buildProjectStub {
            return buildProjectStub
        } else {
            return AbsolutePath.root
        }
    }

    func build(workspacePath: AbsolutePath, target: Target) throws -> AbsolutePath {
        buildWorkspaceArgs.append((workspacePath: workspacePath, target: target))
        if let buildWorkspaceStub = buildWorkspaceStub {
            return buildWorkspaceStub
        } else {
            return AbsolutePath.root
        }
    }
}
