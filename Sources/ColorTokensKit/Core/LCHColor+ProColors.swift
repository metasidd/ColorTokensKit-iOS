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
    private static let interpolator = ColorRampInterpolator()
    
    public static func generateProRamp(forHue hue: Double) -> [LCHColor] {
        let dataPoints = interpolator.getCalculatedColorRamp(forHue: hue)
        return dataPoints.map { point in
            LCHColor(l: point.l, c: point.c, h: point.h)
        }
    }
    
    // Pro color getters
    public static var proGray: LCHColor { generateProRamp(forHue: 0)[5] }
    public static var proPink: LCHColor { generateProRamp(forHue: 350)[5] }
    public static var proRed: LCHColor { generateProRamp(forHue: 0)[5] }
    public static var proTomato: LCHColor { generateProRamp(forHue: 20)[5] }
    public static var proOrange: LCHColor { generateProRamp(forHue: 35)[5] }
    public static var proBrown: LCHColor { generateProRamp(forHue: 50)[5] }
    public static var proGold: LCHColor { generateProRamp(forHue: 70)[5] }
    public static var proYellow: LCHColor { generateProRamp(forHue: 85)[5] }
    public static var proLime: LCHColor { generateProRamp(forHue: 100)[5] }
    public static var proOlive: LCHColor { generateProRamp(forHue: 110)[5] }
    public static var proGrass: LCHColor { generateProRamp(forHue: 120)[5] }
    public static var proGreen: LCHColor { generateProRamp(forHue: 140)[5] }
    public static var proMint: LCHColor { generateProRamp(forHue: 160)[5] }
    public static var proCyan: LCHColor { generateProRamp(forHue: 180)[5] }
    public static var proTeal: LCHColor { generateProRamp(forHue: 190)[5] }
    public static var proBlue: LCHColor { generateProRamp(forHue: 210)[5] }
    public static var proSky: LCHColor { generateProRamp(forHue: 235)[5] }
    public static var proIndigo: LCHColor { generateProRamp(forHue: 270)[5] }
    public static var proIris: LCHColor { generateProRamp(forHue: 292.5)[5] }
    public static var proPurple: LCHColor { generateProRamp(forHue: 310)[5] }
    public static var proViolet: LCHColor { generateProRamp(forHue: 325)[5] }
    public static var proPlum: LCHColor { generateProRamp(forHue: 345)[5] }
    public static var proRuby: LCHColor { generateProRamp(forHue: 360)[5] }
    
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
    
    // Initialize with hue but use interpolation system
    public init(h: Double, variableChroma: Bool = true, variableHue: Bool = true) {
        let dataPoints = LCHColor.interpolator.getCalculatedColorRamp(forHue: h)
        let midPoint = dataPoints[dataPoints.count / 2]
        self.init(
            l: midPoint.l,
            c: midPoint.c,
            h: midPoint.h
        )
    }
    
    // Add a method to get the full ramp for any color
    func getRamp() -> [LCHColor] {
        return LCHColor.generateProRamp(forHue: self.h)
    }
} 
