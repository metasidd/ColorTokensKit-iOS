//
// ColorRampInterpolator.swift
// ColorTokensKit
//
// Provides interpolation functionality between color ramps.
// This allows smooth transitions between predefined colors while
// maintaining perceptual uniformity and accessibility.
//
// The interpolator considers:
// - Lightness progression
// - Chroma intensity
// - Hue shifts
//
// This enables generation of harmonious color ramps for any hue value.
//

struct ColorRampInterpolator {
    static func interpolateRamp(forHue hue: Double) -> ColorRampDefinition {
        // Normalize hue to 0-360 range
        let normalizedHue = (hue.truncatingRemainder(dividingBy: 360) + 360).truncatingRemainder(dividingBy: 360)
        
        // Find the two closest predefined ramps
        let sortedRamps = ColorRampDefinition.predefinedRamps.sorted { abs($0.baseHue - normalizedHue) < abs($1.baseHue - normalizedHue) }
        let ramp1 = sortedRamps[0]
        let ramp2 = sortedRamps[1]
        
        // Calculate interpolation factor
        let hueDiff = (ramp2.baseHue - ramp1.baseHue + 360).truncatingRemainder(dividingBy: 360)
        let t = (normalizedHue - ramp1.baseHue + 360).truncatingRemainder(dividingBy: 360) / hueDiff
        
        // Interpolate all values
        let interpolatedLightness = zip(ramp1.lightness, ramp2.lightness).map { lerp($0, $1, t) }
        let interpolatedChroma = zip(ramp1.chroma, ramp2.chroma).map { lerp($0, $1, t) }
        let interpolatedHueShift = zip(ramp1.hueShift, ramp2.hueShift).map { lerp($0, $1, t) }
        
        return ColorRampDefinition(
            baseHue: normalizedHue,
            name: "custom",
            lightness: interpolatedLightness,
            chroma: interpolatedChroma,
            hueShift: interpolatedHueShift
        )
    }
    
    private static func lerp(_ a: Double, _ b: Double, _ t: Double) -> Double {
        return a + (b - a) * t
    }
} 