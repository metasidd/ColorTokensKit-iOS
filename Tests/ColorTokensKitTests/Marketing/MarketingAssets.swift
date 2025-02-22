import Foundation
import os
import SwiftUI

/// Generates marketing assets for the README and documentation
@MainActor
public struct MarketingAssets {
    private static let logger = Logger(
        subsystem: "com.colortokenskit.marketing",
        category: "AssetGeneration"
    )

    /// Generates all marketing assets
    public static func generateAssets() {
        logger.info("Starting marketing asset generation")

        // Create directory if it doesn't exist
        let directory = createAssetsDirectory()

        // Generate each asset
        generateColorGrid(in: directory)
        generateColorSystemComparison(in: directory)

        logger.info("Completed marketing asset generation")
    }

    private static func createAssetsDirectory() -> URL {
        let fileManager = FileManager.default

        // Get the package directory by going up from the current source file
        let sourceFileURL = URL(fileURLWithPath: #file)
        let packageRoot = sourceFileURL
            .deletingLastPathComponent() // Marketing
            .deletingLastPathComponent() // ColorTokensKitTests
            .deletingLastPathComponent() // Tests
            .deletingLastPathComponent() // Root

        // Create directory in Tests/Artifacts
        let assetsURL = packageRoot
            .appendingPathComponent("Tests")
            .appendingPathComponent("ColorTokensKitTests")
            .appendingPathComponent("Exports", isDirectory: true)

        do {
            try fileManager.createDirectory(
                at: assetsURL,
                withIntermediateDirectories: true
            )
            logger.info("Created or verified assets directory at: \(assetsURL.path)")
        } catch {
            logger.error("Failed to create assets directory: \(error.localizedDescription)")
        }

        return assetsURL
    }

    private static func generateColorGrid(in directory: URL) {
        logger.info("Generating color grid image...")
        let view = ColorGridView()
        saveImage(view, name: "color-grid", size: ImageSize.size, in: directory)
    }

    private static func generateColorSystemComparison(in directory: URL) {
        logger.info("Generating color system comparison image...")
        let view = ColorSystemComparisonView()
        saveImage(view, name: "color-system-comparison", size: ImageSize.size, in: directory)
    }

    private static func saveImage(_ view: some View, name: String, size: CGSize, in directory: URL) {
        #if os(macOS)
            logger.debug("Rendering image: \(name) at size: \(size.width)x\(size.height)")

            let renderer = ImageRenderer(content: view.frame(width: size.width, height: size.height))
            renderer.scale = 2.0

            guard let nsImage = renderer.nsImage else {
                logger.error("Failed to render NSImage for \(name)")
                return
            }

            guard let tiffData = nsImage.tiffRepresentation else {
                logger.error("Failed to create TIFF representation for \(name)")
                return
            }

            guard let bitmapImage = NSBitmapImageRep(data: tiffData) else {
                logger.error("Failed to create bitmap image representation for \(name)")
                return
            }

            guard let pngData = bitmapImage.representation(using: .png, properties: [:]) else {
                logger.error("Failed to create PNG representation for \(name)")
                return
            }

            let fileURL = directory.appendingPathComponent("\(name).png")

            do {
                try pngData.write(to: fileURL)
                logger.info("Successfully saved \(name).png to: \(fileURL.path)")
            } catch {
                logger.error("Failed to save \(name).png: \(error.localizedDescription)")
            }
        #endif
    }
}
