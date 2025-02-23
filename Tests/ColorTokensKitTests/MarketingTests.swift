@testable import ColorTokensKit
import XCTest

@MainActor
final class MarketingTests: XCTestCase {
    func testGenerateMarketingAssets() throws {
        // Get the current file's directory
        let currentFile = URL(fileURLWithPath: #file)
        let testsDirectory = currentFile.deletingLastPathComponent()
        
        // Create Exports directory
        let exportsDirectory = testsDirectory.appendingPathComponent("Exports")
        
        // Ensure the directory exists with proper permissions
        try? FileManager.default.createDirectory(
            at: exportsDirectory,
            withIntermediateDirectories: true,
            attributes: [.posixPermissions: 0o777]
        )
        
        print("Exports directory: \(exportsDirectory.path)")
        MarketingAssets.generateAssets(in: exportsDirectory)
    }
}
