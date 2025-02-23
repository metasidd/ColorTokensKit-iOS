//
//  ColorTokens.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-08.
//

import SwiftUI
import ColorTokensKit

public extension Color {
    // Foreground colors
    static var foregroundPrimary: Color {
        .proGray.foregroundPrimary
    }

    static var foregroundSecondary: Color {
        .proGray.foregroundSecondary
    }

    static var foregroundTertiary: Color {
        .proGray.foregroundTertiary
    }

    // Inverted colors
    static var invertedForeground: Color {
        .proGray.invertedForegroundPrimary
    }

    static var invertedForegroundSecondary: Color {
        .proGray.invertedForegroundSecondary
    }

    static var invertedForegroundTertiary: Color {
        .proGray.invertedForegroundTertiary
    }

    // Background colors
    static var backgroundPrimary: Color {
        Color(light: .white, dark: .black) // Pure black and white
    }

    static var backgroundSecondary: Color {
        .proGray.backgroundSecondary
    }

    static var backgroundTertiary: Color {
        .proGray.backgroundTertiary
    }

    // Outline colors
    static var outlinePrimary: Color {
        .proGray.outlinePrimary
    }

    static var outlineSecondary: Color {
        .proGray.outlineSecondary
    }

    static var outlineTertiary: Color {
        .proGray.outlineTertiary
    }
}

public extension LCHColor {
    // Foreground colors
    var foregroundPrimary: Color {
        Color(light: _1000, dark:  _50)
    }
    var foregroundSecondary: Color {
        Color(light: _800, dark: _200)
    }
    var foregroundTertiary: Color {
        Color(light: _700, dark: _300) }

    // Inverted foreground colors
    var invertedForegroundPrimary: Color { 
        Color(light: _50, dark: _1000) 
    }
    var invertedForegroundSecondary: Color { 
        Color(light: _150, dark: _800) 
    }
    var invertedForegroundTertiary: Color { 
        Color(light: _250, dark: _700) 
    }

    // Backgroundcolors
    var backgroundPrimary: Color { 
        Color(light: _50, dark: _1000) 
    }
    var backgroundSecondary: Color { 
        Color(light: _100, dark: _800) 
    }
    var backgroundTertiary: Color { 
        Color(light: _200, dark: _700) 
    }
    
    // Surface colors
    var surfacePrimary: Color {
        Color(light: _200, dark: _700).opacity(0.5)
    }
    var surfaceSecondary: Color {
        Color(light: _200, dark: _700).opacity(0.3)
    }
    var surfaceTertiary: Color {
        Color(light: _200, dark: _700).opacity(0.1)
    }

    // Inverted surface colors
    var invertedSurfacePrimary: Color {
        Color(light: _400, dark: _600).opacity(0.4)
    }
    var invertedSurfaceSecondary: Color {
        Color(light: _400, dark: _600).opacity(0.2)
    }

    // Inverted background colors
    var invertedBackgroundPrimary: Color { 
        Color(light: _900, dark: _50) 
    }
    var invertedBackgroundSecondary: Color { 
        Color(light: _800, dark: _150) 
    }
    var invertedBackgroundTertiary: Color { 
        Color(light: _650, dark: _250) 
    }

    // Outline colors
    var outlinePrimary: Color { 
        Color(light: _300, dark: _700) 
    }
    var outlineSecondary: Color { 
        Color(light: _200, dark: _800)
    }
    var outlineTertiary: Color { 
        Color(light: _100, dark: _900) 
    }
}
