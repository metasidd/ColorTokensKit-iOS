//
// LCHColor+Ramps.swift
// ColorTokensKit
//
// Extends LCHColor to support color ramp generation.
// Provides functionality to generate complete color scales
// based on the LCH color space and predefined ramp definitions.
//
// This extension bridges the gap between the color ramp system
// and the LCH color space implementation.
//

import Foundation

extension LCHColor {
    public static func generateRamp(forHue hue: Double) -> [LCHColor] {
        let interpolator = ColorRampGenerator()
        let dataPoints = interpolator.getColorRamp(forHue: hue)
        
        return dataPoints.map { point in
            LCHColor(l: point.l, c: point.c, h: point.h)
        }
    }
    
    // Ramp getters for all predefined colors
    public static var grayRamp: [LCHColor] { generateRamp(forHue: 0) }
    public static var pinkRamp: [LCHColor] { generateRamp(forHue: 350) }
    public static var redRamp: [LCHColor] { generateRamp(forHue: 0) }
    public static var tomatoRamp: [LCHColor] { generateRamp(forHue: 20) }
    public static var orangeRamp: [LCHColor] { generateRamp(forHue: 35) }
    public static var brownRamp: [LCHColor] { generateRamp(forHue: 50) }
    public static var goldRamp: [LCHColor] { generateRamp(forHue: 70) }
    public static var yellowRamp: [LCHColor] { generateRamp(forHue: 85) }
    public static var limeRamp: [LCHColor] { generateRamp(forHue: 100) }
    public static var oliveRamp: [LCHColor] { generateRamp(forHue: 110) }
    public static var grassRamp: [LCHColor] { generateRamp(forHue: 120) }
    public static var greenRamp: [LCHColor] { generateRamp(forHue: 140) }
    public static var mintRamp: [LCHColor] { generateRamp(forHue: 160) }
    public static var cyanRamp: [LCHColor] { generateRamp(forHue: 180) }
    public static var tealRamp: [LCHColor] { generateRamp(forHue: 190) }
    public static var blueRamp: [LCHColor] { generateRamp(forHue: 210) }
    public static var skyRamp: [LCHColor] { generateRamp(forHue: 235) }
    public static var indigoRamp: [LCHColor] { generateRamp(forHue: 270) }
    public static var irisRamp: [LCHColor] { generateRamp(forHue: 292.5) }
    public static var purpleRamp: [LCHColor] { generateRamp(forHue: 310) }
    public static var violetRamp: [LCHColor] { generateRamp(forHue: 325) }
    public static var plumRamp: [LCHColor] { generateRamp(forHue: 345) }
    public static var rubyRamp: [LCHColor] { generateRamp(forHue: 360) }
}
