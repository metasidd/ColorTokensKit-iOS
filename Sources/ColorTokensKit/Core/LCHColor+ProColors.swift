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

extension LCHColor {
    // MARK: - Pro Colors
    
    // Create a shared interpolator instance to avoid creating new ones repeatedly
    private static let interpolator = ColorRampGenerator()
    
    // Pro color getters
    public static var proGray: LCHColor { generatePrimaryColor(forHue: 0) }
    public static var proPink: LCHColor { generatePrimaryColor(forHue: 0) }
    public static var proRed: LCHColor { generatePrimaryColor(forHue: 10) }
    public static var proTomato: LCHColor { generatePrimaryColor(forHue: 20) }
    public static var proOrange: LCHColor { generatePrimaryColor(forHue: 35) }
    public static var proBrown: LCHColor { generatePrimaryColor(forHue: 50) }
    public static var proGold: LCHColor { generatePrimaryColor(forHue: 70) }
    public static var proYellow: LCHColor { generatePrimaryColor(forHue: 85) }
    public static var proLime: LCHColor { generatePrimaryColor(forHue: 100) }
    public static var proOlive: LCHColor { generatePrimaryColor(forHue: 110) }
    public static var proGrass: LCHColor { generatePrimaryColor(forHue: 120) }
    public static var proGreen: LCHColor { generatePrimaryColor(forHue: 140) }
    public static var proMint: LCHColor { generatePrimaryColor(forHue: 160) }
    public static var proCyan: LCHColor { generatePrimaryColor(forHue: 180) }
    public static var proTeal: LCHColor { generatePrimaryColor(forHue: 190) }
    public static var proBlue: LCHColor { generatePrimaryColor(forHue: 210) }
    public static var proSky: LCHColor { generatePrimaryColor(forHue: 235) }
    public static var proIndigo: LCHColor { generatePrimaryColor(forHue: 270) }
    public static var proIris: LCHColor { generatePrimaryColor(forHue: 292.5) }
    public static var proPurple: LCHColor { generatePrimaryColor(forHue: 310) }
    public static var proViolet: LCHColor { generatePrimaryColor(forHue: 325) }
    public static var proPlum: LCHColor { generatePrimaryColor(forHue: 345) }
    public static var proRuby: LCHColor { generatePrimaryColor(forHue: 360) }
    
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
    
    private static func generatePrimaryColor(forHue hue: Double) -> LCHColor {
        let steps = 10
        let dataPoints = interpolator.getColorRamp(forHue: hue, steps: steps)
        let primaryColor = dataPoints[Int(steps/2)]
        return LCHColor(l: primaryColor.l, c: primaryColor.c, h: primaryColor.h)
    }
}
