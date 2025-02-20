//
// ColorRampDefinition.swift
// ColorTokensKit
//
// Defines the structure for color ramps, including properties for
// lightness, chroma, and hue shifts across the ramp's range.
//
// Each ramp represents a complete color scale from white (L100) to black (L0),
// with carefully tuned values to maintain perceptual uniformity.
//

public struct ColorRampDefinition {
    public let baseHue: Double
    public let name: String
    public let lightness: [Double] // Array of lightness values for each stop
    public let chroma: [Double]    // Array of chroma values for each stop
    public let hueShift: [Double]  // Array of hue shifts for each stop
}

extension ColorRampDefinition {
    // Standard stops in the ramp (L100 to L0)
    public static let stops: [Int] = [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0]
    
    // Helper to create a definition with full ramp values
    public static func create(
        baseHue: Double,
        name: String,
        lightness: [Double],
        chroma: [Double],
        hueShift: [Double]
    ) -> ColorRampDefinition {
        precondition(lightness.count == stops.count, "Lightness array must match number of stops")
        precondition(chroma.count == stops.count, "Chroma array must match number of stops")
        precondition(hueShift.count == stops.count, "Hue shift array must match number of stops")
        return ColorRampDefinition(
            baseHue: baseHue,
            name: name,
            lightness: lightness,
            chroma: chroma,
            hueShift: hueShift
        )
    }
} 