//
// Color+ProColors.swift
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

public extension Color {
    // MARK: - Pro Colors

    // Pro color getters
    static var proGray: LCHColor { LCHColor.getPrimaryColor(forHue: 0, isGrayscale: true) }
    static var proPink: LCHColor { LCHColor.getPrimaryColor(forHue: 5) }
    static var proRed: LCHColor { LCHColor.getPrimaryColor(forHue: 10) }
    static var proTomato: LCHColor { LCHColor.getPrimaryColor(forHue: 20) }
    static var proOrange: LCHColor { LCHColor.getPrimaryColor(forHue: 35) }
    static var proBrown: LCHColor { LCHColor.getPrimaryColor(forHue: 50) }
    static var proGold: LCHColor { LCHColor.getPrimaryColor(forHue: 70) }
    static var proYellow: LCHColor { LCHColor.getPrimaryColor(forHue: 85) }
    static var proLime: LCHColor { LCHColor.getPrimaryColor(forHue: 100) }
    static var proOlive: LCHColor { LCHColor.getPrimaryColor(forHue: 110) }
    static var proGrass: LCHColor { LCHColor.getPrimaryColor(forHue: 125) }
    static var proGreen: LCHColor { LCHColor.getPrimaryColor(forHue: 140) }
    static var proMint: LCHColor { LCHColor.getPrimaryColor(forHue: 160) }
    static var proCyan: LCHColor { LCHColor.getPrimaryColor(forHue: 175) }
    static var proTeal: LCHColor { LCHColor.getPrimaryColor(forHue: 190) }
    static var proBlue: LCHColor { LCHColor.getPrimaryColor(forHue: 210) }
    static var proSky: LCHColor { LCHColor.getPrimaryColor(forHue: 235) }
    static var proCobalt: LCHColor { LCHColor.getPrimaryColor(forHue: 250) }
    static var proIndigo: LCHColor { LCHColor.getPrimaryColor(forHue: 270) }
    static var proIris: LCHColor { LCHColor.getPrimaryColor(forHue: 292.5) }
    static var proPurple: LCHColor { LCHColor.getPrimaryColor(forHue: 310) }
    static var proViolet: LCHColor { LCHColor.getPrimaryColor(forHue: 325) }
    static var proPlum: LCHColor { LCHColor.getPrimaryColor(forHue: 342.5) }
    static var proRuby: LCHColor { LCHColor.getPrimaryColor(forHue: 355) }

    // Dictionary of all pro colors
    static var allProHues: [String: LCHColor] {
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
