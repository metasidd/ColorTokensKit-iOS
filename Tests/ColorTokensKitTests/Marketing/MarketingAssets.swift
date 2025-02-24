import Foundation
import os
import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

/// Generates marketing assets for the README and documentation
@MainActor
public struct MarketingAssets {
    private static let logger = Logger(
        subsystem: "com.colortokenskit.marketing",
        category: "AssetGeneration"
    )

    /// Generates all marketing assets
    public static func generateAssets(in directory: URL) {
        logger.info("Starting marketing asset generation")

        // Generate each asset
        generateColorGrid(in: directory)
        generateColorSystemComparison(in: directory)
        generateCoverImage(in: directory)
        generateSimpleCardViewImage(in: directory)
        generateSimpleCardViewDarkModeImage(in: directory)
        generatePillViewImage(in: directory)

        logger.info("Completed marketing asset generation")
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

    private static func generateCoverImage(in directory: URL) {
        logger.info("Generating cover image...")
        let view = CoverImageView()
        saveImage(view, name: "cover-image", size: ImageSize.size, in: directory)
    }
    
    private static func generateSimpleCardViewImage(in directory: URL) {
        logger.info("Generating simple card view image...")
        let view = ThemedCardView()
        saveImage(view, name: "simple-card-view", size: ImageSize.size, in: directory)
    }
    
    private static func generateSimpleCardViewDarkModeImage(in directory: URL) {
        logger.info("Generating simple card view image...")
        let view = ThemedCardView().preferredColorScheme(.dark)
        saveImage(view, name: "simple-card-dark-mode-view", size: ImageSize.size, in: directory)
    }

    private static func generatePillViewImage(in directory: URL) {
        logger.info("Generating pill view image...")
        let view = PillView()
        saveImage(view, name: "pill-view", size: ImageSize.size, in: directory)
    }
    
    private static func saveImage(_ view: some View, name: String, size: CGSize, in directory: URL) {
        logger.debug("Rendering image: \(name) at size: \(size.width)x\(size.height)")

        #if canImport(UIKit)
        // Create and configure the hosting controller
        let hostingController = UIHostingController(rootView: view)
        hostingController.view.frame = CGRect(origin: .zero, size: size)
        
        // Create a new window for rendering
        let window = UIWindow(frame: CGRect(origin: .zero, size: size))
        window.rootViewController = hostingController
        window.makeKeyAndVisible()
        
        // Force layout and render cycle
        hostingController.view.setNeedsLayout()
        hostingController.view.layoutIfNeeded()
        
        // Create a new graphics context
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        defer { UIGraphicsEndImageContext() }
        
        // Render the view into the graphics context
        if let context = UIGraphicsGetCurrentContext() {
            hostingController.view.layer.render(in: context)
        }
        
        // Get the rendered image
        guard let image = UIGraphicsGetImageFromCurrentImageContext(),
              let pngData = image.pngData() else {
            logger.error("Failed to create PNG representation for \(name)")
            return
        }

        let fileURL = directory.appendingPathComponent("\(name).png")

        do {
            // Create intermediate directories if needed
            try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
            
            // Write the file with file protection none to ensure we can overwrite
            try pngData.write(to: fileURL, options: [.atomic, .completeFileProtection])
            
            // Set liberal permissions on both directory and file
            try FileManager.default.setAttributes([.posixPermissions: 0o777], ofItemAtPath: directory.path)
            try FileManager.default.setAttributes([.posixPermissions: 0o666], ofItemAtPath: fileURL.path)
            
            logger.info("Successfully saved \(name).png to: \(fileURL.path)")
        } catch {
            logger.error("Failed to save \(name).png: \(error.localizedDescription)")
            
            // Try alternate approach if first attempt failed
            do {
                // Try to save to a temporary file first
                let tempURL = FileManager.default.temporaryDirectory.appendingPathComponent("\(name).png")
                try pngData.write(to: tempURL)
                
                // Then move it to the final location
                if FileManager.default.fileExists(atPath: fileURL.path) {
                    try FileManager.default.removeItem(at: fileURL)
                }
                try FileManager.default.moveItem(at: tempURL, to: fileURL)
                
                // Set permissions after moving
                try FileManager.default.setAttributes([.posixPermissions: 0o666], ofItemAtPath: fileURL.path)
                
                logger.info("Successfully saved \(name).png using alternate method")
            } catch {
                logger.error("All attempts to save \(name).png failed: \(error.localizedDescription)")
            }
        }
        #else
        logger.error("Image rendering is not supported on this platform.")
        #endif
    }
}
