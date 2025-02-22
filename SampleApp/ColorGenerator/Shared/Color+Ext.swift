//
//  Color+Ext.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-07-29.
//

import ColorTokensKit
import Foundation
import SwiftUI

public extension Color {
    // Foreground colors
    static var foregroundPrimary: Color {
        .gray.foregroundPrimary
    }

    static var foregroundSecondary: Color {
        .gray.foregroundSecondary
    }

    static var foregroundTertiary: Color {
        .gray.foregroundTertiary
    }

    // Inverted colors
    static var invertedForeground: Color {
        .gray.invertedForegroundPrimary
    }

    static var invertedForegroundSecondary: Color {
        .gray.invertedForegroundSecondary
    }

    static var invertedForegroundTertiary: Color {
        .gray.invertedForegroundTertiary
    }

    // Background colors
    static var backgroundPrimary: Color {
        Color(light: .white, dark: .black) // Pure black and white
    }

    static var backgroundSecondary: Color {
        .gray.backgroundSecondary
    }

    static var backgroundTertiary: Color {
        .gray.backgroundTertiary
    }

    // Outline colors
    static var outlinePrimary: Color {
        .gray.outlinePrimary
    }

    static var outlineSecondary: Color {
        .gray.outlineSecondary
    }

    static var outlineTertiary: Color {
        .gray.outlineTertiary
    }
}
