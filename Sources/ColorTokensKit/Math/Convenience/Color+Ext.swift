//
//  Color+Ext.swift
//
//
//  Created by Siddhant Mehta on 2023-12-18.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// Extension to `Color` providing additional initializers and utilities.
/// More info on how color conversions are happening: https://en.wikipedia.org/wiki/HSL_and_HSV#HSV_to_HSL
extension Color {
    
    /**
     Initializes a `Color` using HSL (Hue, Saturation, Lightness) values.
     
     - Parameters:
       - hue: Hue component, ranging from 0 to 360.
       - saturation: Saturation component, ranging from 0 to 1.
       - lightness: Lightness component, ranging from 0 to 1.
       - opacity: Opacity component, ranging from 0 to 1. Default is 1.
     
     This initializer converts HSL to HSV (Hue, Saturation, Brightness) and initializes a `Color`.
     */
    public init(h hue: Double, s saturation: Double, l lightness: Double, a opacity: Double = 1) {
        let brightness = lightness + saturation * min(lightness, 1 - lightness)
        let saturation = brightness == 0 ? 0 : 2 * (1 - lightness / brightness)

        // Initialize Color using the converted HSV values
        self.init(hue: hue / 360, saturation: saturation, brightness: brightness, opacity: opacity)
    }
    
    /**
     Initializes a `Color` from a hexadecimal string.
     
     - Parameter hex: A hexadecimal string representing a color. It supports 3, 6, or 8 character formats.
     
     The initializer processes the hex string and converts it to RGB (or ARGB) values to initialize a `Color`.
     */
    public init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)

        // Validate the hex code
        assert(hex.count == 3 || hex.count == 6 || hex.count == 8, "Invalid hex code: hex code must be 3, 6, or 8 characters long.")

        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            // Default to a transparent color in case of invalid input
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
    /**
     Converts the `Color` to a hexadecimal string representation.
     
     - Returns: A hexadecimal string representing the color. If the color has an alpha component, it includes the alpha value.
     
     Example:
     ```swift
     let color = Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 1.0)
     let hexValue = color.toHex()
     print(hexValue) // Output: "7F7F7F"
     ```
     */
    public func toHex() -> String {
        let resolvedColor = self.resolve(in: .init())
        
        // Ensure RGB values are within [0, 1]
        let r = Double(max(0, min(resolvedColor.red, 1)))
        let g = Double(max(0, min(resolvedColor.green, 1)))
        let b = Double(max(0, min(resolvedColor.blue, 1)))
        let a = Double(max(0, min(resolvedColor.cgColor.alpha, 1)))
        
        // Convert to hexadecimal
        let hexString: String
        if a != 1.0 {
            hexString = String(format: "%02lX%02lX%02lX%02lX", lround(r * 255), lround(g * 255), lround(b * 255), lround(a * 255))
        } else {
            hexString = String(format: "%02lX%02lX%02lX", lround(r * 255), lround(g * 255), lround(b * 255))
        }
        
        print("red \(r)")
        print("green \(g)")
        print("blue \(b)")
        print("alpha \(a)")
        print("hex: \(hexString)")
        print("-------")
        
        return hexString
    }
    
    /**
     Converts the `Color` to an LCH (Lightness, Chroma, Hue) string representation.
     
     - Returns: A string representing the LCH values of the color.
     
     Example:
     ```swift
     let color = Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 1.0)
     let lchString = color.getLCHString()
     print(lchString) // Output: "L:53 C:0 H:0"
     ```
     */
    public func getLCHString() -> String {
        let lchColor = LCHColor(color: self)
        return "L:\(Int(lchColor.l)) C:\(Int(lchColor.c)) H:\(Int(lchColor.h))"
    }
}

#if canImport(UIKit)

/// Extension to `UIColor` providing support for dynamic colors based on the user interface style (light or dark mode).
extension UIColor {
    
    /**
     Initializes a `UIColor` with different colors for light and dark modes.
     
     - Parameters:
       - lightModeColor: The color to use in light mode.
       - darkModeColor: The color to use in dark mode.
     
     This initializer dynamically provides the appropriate color based on the current user interface style.
     */
    convenience public init(
        light lightModeColor: @escaping @autoclosure () -> UIColor,
        dark darkModeColor: @escaping @autoclosure () -> UIColor
    ) {
        self.init { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .light:
                return lightModeColor()
            case .dark:
                return darkModeColor()
            default:
                return lightModeColor()
            }
        }
    }
}

/// Extension to `Color` providing support for dynamic colors based on the user interface style (light or dark mode).
extension Color {
    
    /**
     Initializes a `Color` with different colors for light and dark modes.
     
     - Parameters:
       - lightModeColor: The color to use in light mode.
       - darkModeColor: The color to use in dark mode.
     
     This initializer dynamically provides the appropriate color based on the current user interface style.
     */
    public init(
        light lightModeColor: @escaping @autoclosure () -> Color,
        dark darkModeColor: @escaping @autoclosure () -> Color
    ) {
        self.init(UIColor(
            light: UIColor(lightModeColor()),
            dark: UIColor(darkModeColor())
        ))
    }
}

#elseif canImport(AppKit)

/// Extension to `Color` providing support for dynamic colors based on the user interface style (light or dark mode).
/// Source: https://www.jessesquires.com/blog/2023/07/11/creating-dynamic-colors-in-swiftui/
extension Color {
    
    /**
     Initializes a `Color` with different colors for light and dark modes.
     
     - Parameters:
       - lightModeColor: The color to use in light mode.
       - darkModeColor: The color to use in dark mode.
     
     This initializer dynamically provides the appropriate color based on the current user interface style.
     */
    public init(
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
