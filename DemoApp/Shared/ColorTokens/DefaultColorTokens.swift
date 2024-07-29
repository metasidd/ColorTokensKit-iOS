//
//  ColorRampUtility.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-09.
//

import Foundation
import ColorTokensKit
import SwiftUI

public extension LCHColor {
    // Foreground colors
    var foregroundPrimary: Color { Color(light: _100, dark: _0_pastel) }
    var foregroundSecondary: Color { Color(light: _80, dark: _20_pastel) }
    var foregroundTertiary: Color { Color(light: _70, dark: _30_pastel) }
    
    // Inverted foreground colors
    var invertedForegroundPrimary: Color { Color(light: _0, dark: _100_pastel) }
    var invertedForegroundSecondary: Color { Color(light: _10, dark: _90_pastel) }
    var invertedForegroundTertiary: Color { Color(light: _20, dark: _80_pastel) }
    
    // Background colors
    var backgroundPrimary: Color { Color(light: _5, dark: _95_pastel) }
    var backgroundSecondary: Color { Color(light: _10, dark: _90_pastel) }
    var backgroundTertiary: Color { Color(light: _20, dark: _80_pastel) }
    
    // Inverted background colors
    var invertedBackgroundPrimary: Color { Color(light: _85, dark: _15_pastel) }
    var invertedBackgroundSecondary: Color { Color(light: _70, dark: _30_pastel) }
    var invertedBackgroundTertiary: Color { Color(light: _60, dark: _40_pastel) }
    
    // Outline colors
    var outlinePrimary: Color { Color(light: _30, dark: _70_pastel) }
    var outlineSecondary: Color { Color(light: _10, dark: _90_pastel) }
    var outlineTertiary: Color { Color(light: _5, dark: _95_pastel) }

}

extension Color {
    // Foreground colors
    public static var foregroundPrimary: Color {
        .gray.foregroundPrimary
    }
    public static var foregroundSecondary: Color {
        .gray.foregroundSecondary
    }
    public static var foregroundTertiary: Color {
        .gray.foregroundTertiary
    }
    
    // Inverted colors
    public static var invertedForeground: Color {
        .gray.invertedForegroundPrimary
    }
    public static var invertedForegroundSecondary: Color {
        .gray.invertedForegroundSecondary
    }
    public static var invertedForegroundTertiary: Color {
        .gray.invertedForegroundTertiary
    }
    
    // Background colors
    public static var backgroundPrimary: Color {
        Color(light: .white, dark: .black) // Pure black and white
    }
    public static var backgroundSecondary: Color {
        .gray.backgroundSecondary
    }
    public static var backgroundTertiary: Color {
        .gray.backgroundTertiary
    }
    
    // Outline colors
    public static var outlinePrimary: Color {
        .gray.outlinePrimary
    }
    public static var outlineSecondary: Color {
        .gray.outlineSecondary
    }
    public static var outlineTertiary: Color {
        .gray.outlineTertiary
    }
}
