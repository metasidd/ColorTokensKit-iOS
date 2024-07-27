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
    var foregroundPrimary: Color { _100 }
    var foregroundSecondary: Color { _80 }
    var foregroundTertiary: Color { _60 }
    
    // Inverted foreground colors
    var invertedForegroundPrimary: Color { _0 }
    var invertedForegroundSecondary: Color { _15 }
    var invertedForegroundTertiary: Color { _25 }
    
    // Backgroundcolors
    var backgroundPrimary: Color { _5 }
    var backgroundSecondary: Color { _10 }
    var backgroundTertiary: Color { _20 }
    
    // Inverted background colors
    var invertedBackgroundPrimary: Color { _100 }
    var invertedBackgroundSecondary: Color { _75 }
    var invertedBackgroundTertiary: Color { _60 }
    
    // Outline colors
    var outlinePrimary: Color { _30 }
    var outlineSecondary: Color { _10 }
    var outlineTertiary: Color { _5 }
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
