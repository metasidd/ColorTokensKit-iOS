//
//  ColorTokens.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-08.
//

import SwiftUI
import ColorTokensKit
import UIKit

public extension Color {
    // Foreground colors
    static var foregroundPrimary: Color {
        Color.proGray.foregroundPrimary
    }

    static var foregroundSecondary: Color {
        Color.proGray.foregroundSecondary
    }

    static var foregroundTertiary: Color {
        Color.proGray.foregroundTertiary
    }

    // Inverted colors
    static var invertedForeground: Color {
        Color.proGray.invertedForegroundPrimary
    }

    static var invertedForegroundSecondary: Color {
        Color.proGray.invertedForegroundSecondary
    }

    static var invertedForegroundTertiary: Color {
        Color.proGray.invertedForegroundTertiary
    }

    // Background colors
    static var backgroundPrimary: Color {
        Color(light: Color.white, dark: Color.black) // Pure black and white
    }

    static var backgroundSecondary: Color {
        Color.proGray.backgroundSecondary
    }

    static var backgroundTertiary: Color {
        Color.proGray.backgroundTertiary
    }
    
    // Surface colors
    var surfacePrimary: Color {
        Color.proGray.surfacePrimary
    }
    var surfaceSecondary: Color {
        Color.proGray.surfaceSecondary
    }
    var surfaceTertiary: Color {
        Color.proGray.surfaceTertiary
    }

    // Inverted surface colors
    var invertedSurfacePrimary: Color {
        Color.proGray.invertedSurfacePrimary
    }
    var invertedSurfaceSecondary: Color {
        Color.proGray.invertedSurfaceSecondary
    }

    // Inverted background colors
    var invertedBackgroundPrimary: Color {
        Color.proGray.invertedBackgroundPrimary
    }
    var invertedBackgroundSecondary: Color {
        Color.proGray.invertedBackgroundSecondary
    }
    var invertedBackgroundTertiary: Color {
        Color.proGray.invertedBackgroundTertiary
    }

    // Outline colors
    static var outlinePrimary: Color {
        Color.proGray.outlinePrimary
    }

    static var outlineSecondary: Color {
        Color.proGray.outlineSecondary
    }

    static var outlineTertiary: Color {
        Color.proGray.outlineTertiary
    }
}

public extension LCHColor {
    // Foreground colors
    var foregroundPrimary: Color {
        Color(light: _1000.toColor(), dark: _50.toColor())
    }
    var foregroundSecondary: Color {
        Color(light: _800.toColor(), dark: _200.toColor())
    }
    var foregroundTertiary: Color {
        Color(light: _700.toColor(), dark: _300.toColor())
    }

    // Inverted foreground colors
    var invertedForegroundPrimary: Color { 
        Color(light: _50.toColor(), dark: _1000.toColor()) 
    }
    var invertedForegroundSecondary: Color { 
        Color(light: _150.toColor(), dark: _800.toColor()) 
    }
    var invertedForegroundTertiary: Color { 
        Color(light: _250.toColor(), dark: _700.toColor()) 
    }

    // Background colors
    var backgroundPrimary: Color { 
        Color(light: _50.toColor(), dark: _1000.toColor()) 
    }
    var backgroundSecondary: Color { 
        Color(light: _100.toColor(), dark: _800.toColor()) 
    }
    var backgroundTertiary: Color { 
        Color(light: _200.toColor(), dark: _700.toColor()) 
    }
    
    // Surface colors
    var surfacePrimary: Color {
        Color(light: _200.toColor(), dark: _700.toColor()).opacity(0.5)
    }
    var surfaceSecondary: Color {
        Color(light: _200.toColor(), dark: _700.toColor()).opacity(0.3)
    }
    var surfaceTertiary: Color {
        Color(light: _200.toColor(), dark: _700.toColor()).opacity(0.1)
    }

    // Inverted surface colors
    var invertedSurfacePrimary: Color {
        Color(light: _400.toColor(), dark: _600.toColor()).opacity(0.4)
    }
    var invertedSurfaceSecondary: Color {
        Color(light: _400.toColor(), dark: _600.toColor()).opacity(0.2)
    }

    // Inverted background colors
    var invertedBackgroundPrimary: Color { 
        Color(light: _900.toColor(), dark: _50.toColor()) 
    }
    var invertedBackgroundSecondary: Color { 
        Color(light: _800.toColor(), dark: _150.toColor()) 
    }
    var invertedBackgroundTertiary: Color { 
        Color(light: _650.toColor(), dark: _250.toColor()) 
    }

    // Outline colors
    var outlinePrimary: Color { 
        Color(light: _300.toColor(), dark: _700.toColor()) 
    }
    var outlineSecondary: Color { 
        Color(light: _200.toColor(), dark: _800.toColor())
    }
    var outlineTertiary: Color { 
        Color(light: _100.toColor(), dark: _900.toColor()) 
    }
}
