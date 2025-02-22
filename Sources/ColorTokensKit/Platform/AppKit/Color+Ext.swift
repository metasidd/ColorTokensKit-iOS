//
//  Color+Ext.swift
//  ColorTokensKit
//
//  Created by Siddhant Mehta on 2025-02-22.
//

#if canImport(AppKit)
import AppKit

    /// Extension to `Color` providing support for dynamic colors based on the user interface style (light or dark mode).
    /// Source: https://www.jessesquires.com/blog/2023/07/11/creating-dynamic-colors-in-swiftui/
    public extension Color {
        /**
         Initializes a `Color` with different colors for light and dark modes.

         - Parameters:
           - lightModeColor: The color to use in light mode.
           - darkModeColor: The color to use in dark mode.

         This initializer dynamically provides the appropriate color based on the current user interface style.
         */
        init(
            light lightModeColor: @escaping @autoclosure () -> Color,
            dark darkModeColor: @escaping @autoclosure () -> Color
        ) {
            self.init(
                nsColor: NSColor(
                    name: nil,
                    dynamicProvider: { appearance in
                        switch appearance.name {
                        case .aqua,
                             .vibrantLight,
                             .accessibilityHighContrastAqua,
                             .accessibilityHighContrastVibrantLight:
                            return NSColor(lightModeColor())

                        case .darkAqua,
                             .vibrantDark,
                             .accessibilityHighContrastDarkAqua,
                             .accessibilityHighContrastVibrantDark:
                            return NSColor(darkModeColor())

                        default:
                            assertionFailure("Unknown appearance: \(appearance.name)")
                            return NSColor(lightModeColor())
                        }
                    }
                )
            )
        }
    }
#endif
