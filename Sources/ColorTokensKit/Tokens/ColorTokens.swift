//
//  ColorTokens.swift
//
//  Created by Siddhant Mehta on 2022-12-20.
//

import Foundation
import SwiftUI

public class ColorTokens {
    
    public static var foreground: Color {
        Palettes.slate._12
    }
    public static var foreground_secondary: Color {
        Palettes.slate._11
    }
    public static var foreground_tertiary: Color {
        Palettes.slate._10
    }

    public static var invertedForeground: Color {
        Palettes.slate._1
    }
    public static var invertedForeground_secondary: Color {
        Palettes.slate._2
    }
    public static var invertedForeground_tertiary: Color {
        Palettes.slate._3
    }
    
    public static var backgroundPrimary: Color {
        Color(light: .white, dark: .black)
    }
    
    public static var backgroundSecondary: Color {
        Palettes.slate._2
    }
    public static var backgroundTertiary: Color {
        Palettes.slate._3
    }
    
    public static var outline: Color {
        Palettes.slate._7
    }
    public static var outline_secondary: Color {
        Palettes.slate._6
    }
    public static var outline_tertiary: Color {
        Palettes.slate._4
    }
    
    public static var negative: PaletteColor {
        Palettes.ruby()
    }
    public static var positive: PaletteColor {
        Palettes.green()
    }
}

extension ColorTokens {
    public static func setColor(light: Color, dark: Color) -> Color {
        return Color(UIColor {
            if ($0.userInterfaceStyle == .light) {
                return UIColor(light)
            }
            else {
                return UIColor(dark)
            }
        })
    }
}

public extension Color {
    init(hex: String) {
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
}
