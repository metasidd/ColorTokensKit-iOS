//
// LCHColor+ProColors.swift
// ColorTokensKit
//
// Defines the professional color set using the LCH color space.
// These colors serve as the foundation for the design system,
// offering a comprehensive palette of harmonious colors.
//
// Each color is carefully tuned to:
// - Maintain perceptual uniformity
// - Ensure accessibility
// - Provide consistent visual weight
//

import Foundation
import SwiftUI

extension Color {
    // MARK: - Pro Colors
    
    // Pro color getters
    public static var proGray: LCHColor { LCHColor.getPrimaryColor(forHue: 0) }
    public static var proPink: LCHColor { LCHColor.getPrimaryColor(forHue: 0) }
    public static var proRed: LCHColor { LCHColor.getPrimaryColor(forHue: 10) }
    public static var proTomato: LCHColor { LCHColor.getPrimaryColor(forHue: 20) }
    public static var proOrange: LCHColor { LCHColor.getPrimaryColor(forHue: 35) }
    public static var proBrown: LCHColor { LCHColor.getPrimaryColor(forHue: 50) }
    public static var proGold: LCHColor { LCHColor.getPrimaryColor(forHue: 70) }
    public static var proYellow: LCHColor { LCHColor.getPrimaryColor(forHue: 85) }
    public static var proLime: LCHColor { LCHColor.getPrimaryColor(forHue: 100) }
    public static var proOlive: LCHColor { LCHColor.getPrimaryColor(forHue: 110) }
    public static var proGrass: LCHColor { LCHColor.getPrimaryColor(forHue: 125) }
    public static var proGreen: LCHColor { LCHColor.getPrimaryColor(forHue: 140) }
    public static var proMint: LCHColor { LCHColor.getPrimaryColor(forHue: 160) }
    public static var proCyan: LCHColor { LCHColor.getPrimaryColor(forHue: 175) }
    public static var proTeal: LCHColor { LCHColor.getPrimaryColor(forHue: 190) }
    public static var proBlue: LCHColor { LCHColor.getPrimaryColor(forHue: 210) }
    public static var proSky: LCHColor { LCHColor.getPrimaryColor(forHue: 235) }
    public static var proCobalt: LCHColor { LCHColor.getPrimaryColor(forHue: 250) }
    public static var proIndigo: LCHColor { LCHColor.getPrimaryColor(forHue: 270) }
    public static var proIris: LCHColor { LCHColor.getPrimaryColor(forHue: 292.5) }
    public static var proPurple: LCHColor { LCHColor.getPrimaryColor(forHue: 310) }
    public static var proViolet: LCHColor { LCHColor.getPrimaryColor(forHue: 325) }
    public static var proPlum: LCHColor { LCHColor.getPrimaryColor(forHue: 345) }
    public static var proRuby: LCHColor { LCHColor.getPrimaryColor(forHue: 360) }
    
    // Dictionary of all pro colors
    public static var allProHues: [String: LCHColor] {
        [
            "Gray": proGray,
            "Pink": proPink,
            "Red": proRed,
            "Tomato": proTomato,
            "Orange": proOrange,
            "Brown": proBrown,
            "Gold": proGold,
            "Yellow": proYellow,
            "Lime": proLime,
            "Olive": proOlive,
            "Grass": proGrass,
            "Green": proGreen,
            "Mint": proMint,
            "Cyan": proCyan,
            "Teal": proTeal,
            "Blue": proBlue,
            "Sky": proSky,
            "Indigo": proIndigo,
            "Iris": proIris,
            "Purple": proPurple,
            "Violet": proViolet,
            "Plum": proPlum,
            "Ruby": proRuby
        ]
    }
}
