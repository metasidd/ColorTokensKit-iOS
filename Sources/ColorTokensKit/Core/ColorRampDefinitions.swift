//
// ColorRampDefinitions.swift
// ColorTokensKit
//
// This file contains the predefined color ramps that serve as "anchor points" for the color system.
// Each ramp defines how a color's properties (lightness, chroma, hue) should vary across its range.
//
// Structure:
// - Each ramp has 21 stops from 100 (white) to 0 (black)
// - Lightness values follow a linear progression
// - Chroma values follow a bell curve, peaking in the middle
// - Hue shifts are used to maintain perceptual consistency across the ramp
//
// Color Properties:
// - baseHue: The primary hue value (0-360)
// - lightness: How bright the color is (0-100)
// - chroma: Color intensity/saturation
// - hueShift: How much the hue should shift at each stop
//
// Usage:
// These ramps are used by the interpolation system to generate smooth transitions
// between colors while maintaining perceptual uniformity and accessibility.
//

extension ColorRampDefinition {
    // These are our "anchor" colors with manually tuned values
    public static let predefinedRamps: [ColorRampDefinition] = [
        // Gray (Hue 0) - Neutral base with no chroma or hue shift
        .create(
            baseHue: 0.0,
            name: "gray",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Pink (Hue 0.0)
        .create(
            baseHue: 0.0,
            name: "pink",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Red (Hue 10.0)
        .create(
            baseHue: 10.0,
            name: "red",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Tomato (Hue 20.0)
        .create(
            baseHue: 20.0,
            name: "tomato",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Orange (Hue 35.0)
        .create(
            baseHue: 35.0,
            name: "orange",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Brown (Hue 50.0)
        .create(
            baseHue: 50.0,
            name: "brown",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Gold (Hue 70.0)
        .create(
            baseHue: 70.0,
            name: "gold",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Yellow (Hue 85.0)
        .create(
            baseHue: 85.0,
            name: "yellow",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Lime (Hue 100.0)
        .create(
            baseHue: 100.0,
            name: "lime",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Olive (Hue 110.0)
        .create(
            baseHue: 110.0,
            name: "olive",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Grass (Hue 120.0)
        .create(
            baseHue: 120.0,
            name: "grass",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Green (Hue 140.0)
        .create(
            baseHue: 140.0,
            name: "green",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Mint (Hue 160.0)
        .create(
            baseHue: 160.0,
            name: "mint",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Cyan (Hue 180.0)
        .create(
            baseHue: 180.0,
            name: "cyan",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Teal (Hue 190.0)
        .create(
            baseHue: 190.0,
            name: "teal",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Blue (Hue 210.0)
        .create(
            baseHue: 210.0,
            name: "blue",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Sky (Hue 235.0)
        .create(
            baseHue: 235.0,
            name: "sky",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Indigo (Hue 270.0)
        .create(
            baseHue: 270.0,
            name: "indigo",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Iris (Hue 292.5)
        .create(
            baseHue: 292.5,
            name: "iris",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Purple (Hue 310.0)
        .create(
            baseHue: 310.0,
            name: "purple",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Violet (Hue 325.0)
        .create(
            baseHue: 325.0,
            name: "violet",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Plum (Hue 345.0)
        .create(
            baseHue: 345.0,
            name: "plum",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ),
        
        // Ruby (Hue 360.0)
        .create(
            baseHue: 360.0,
            name: "ruby",
            lightness: [100, 95, 90, 85, 80, 75, 70, 65, 59, 55, 50, 44, 39, 34, 29, 24, 19, 14, 9, 4, 0],
            chroma: [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20],
            hueShift: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        )
    ]
} 
