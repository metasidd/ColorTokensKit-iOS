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

extension LCHColor {
    // Base colors
    public static var gray: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "gray" }!.toColor() 
    }
    public static var proPink: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "pink" }!.toColor() 
    }
    public static var proRed: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "red" }!.toColor() 
    }
    public static var proTomato: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "tomato" }!.toColor() 
    }
    public static var proOrange: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "orange" }!.toColor() 
    }
    public static var proBrown: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "brown" }!.toColor() 
    }
    public static var proGold: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "gold" }!.toColor() 
    }
    public static var proYellow: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "yellow" }!.toColor() 
    }
    public static var proLime: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "lime" }!.toColor() 
    }
    public static var proOlive: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "olive" }!.toColor() 
    }
    public static var proGrass: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "grass" }!.toColor() 
    }
    public static var proGreen: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "green" }!.toColor() 
    }
    public static var proMint: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "mint" }!.toColor() 
    }
    public static var proCyan: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "cyan" }!.toColor() 
    }
    public static var proTeal: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "teal" }!.toColor() 
    }
    public static var proBlue: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "blue" }!.toColor() 
    }
    public static var proSky: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "sky" }!.toColor() 
    }
    public static var proIndigo: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "indigo" }!.toColor() 
    }
    public static var proIris: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "iris" }!.toColor() 
    }
    public static var proPurple: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "purple" }!.toColor() 
    }
    public static var proViolet: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "violet" }!.toColor() 
    }
    public static var proPlum: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "plum" }!.toColor() 
    }
    public static var proRuby: LCHColor { 
        ColorRampDefinition.predefinedRamps.first { $0.name == "ruby" }!.toColor() 
    }
    
    // Initialize with hue but use interpolation system
    public init(h: Double, variableChroma: Bool = true, variableHue: Bool = true) {
        let ramp = ColorRampInterpolator.interpolateRamp(forHue: h)
        let midIndex = ramp.lightness.count / 2
        self.init(
            l: ramp.lightness[midIndex],
            c: ramp.chroma[midIndex],
            h: ramp.baseHue + ramp.hueShift[midIndex]
        )
    }
    
    // Add a method to get the full ramp for any color
    func getRamp() -> [LCHColor] {
        return LCHColor.generateRamp(forHue: self.h)
    }
} 