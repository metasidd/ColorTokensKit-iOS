//
//  File.swift
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

// Algorithm coming from: https://en.wikipedia.org/wiki/HSL_and_HSV#HSV_to_HSL
extension Color {
    /**
     - Parameter h: Range from 0 to 360.
     - Parameter s: Range from 0 to 1.
     - Parameter l: Range from 0 to 1.
     - Parameter a: Range from 0 to 1.
     */
    public init(h hue: Double, s saturation: Double, l lightness: Double, a opacity: Double = 1) {
        let brightness = lightness + saturation * min(lightness, 1 - lightness)
        let saturation = brightness == 0 ? 0 : 2 * (1 - lightness / brightness)

        // Map to Color initializer.
        self.init(hue: hue / 360, saturation: saturation, brightness: brightness, opacity: opacity)
    }
    
    public init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)

        // Assert to check if the input is a valid hex value
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
    
    // TODO: Make this work with iOS 16
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
}

#if canImport(UIKit)
extension UIColor {
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

extension Color {
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
// Source: https://www.jessesquires.com/blog/2023/07/11/creating-dynamic-colors-in-swiftui/
extension Color {
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
