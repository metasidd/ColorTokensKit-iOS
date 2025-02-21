//
// ColorRampGenerator.swift
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

import Foundation

public class ColorRampGenerator {
    // Cache interpolated ramps
    private var interpolatedRamps: [Double: [LCHColor]] = [:]
    private let colorPaletteData: ColorPaletteData?
    
    public init() {
        self.colorPaletteData = ColorRampLoader.loadColorRamps()
    }
    
    public func getColorRamp(forHue targetHue: Double) -> [LCHColor] {
        // Check cache first
        let normalizedHue = (targetHue.truncatingRemainder(dividingBy: 360) + 360).truncatingRemainder(dividingBy: 360)
        if let cached = interpolatedRamps[normalizedHue] {
            return cached
        }
        
        guard let colorPaletteData = colorPaletteData else {
            assertionFailure("Unable to get any palettes")
            return []
        }
        
        // Get all ramps sorted by hue
        let sortedRamps = colorPaletteData.colorRamps.sorted { ramp1, ramp2 in
            let hue1 = ramp1.stops.first?.value.h ?? 0
            let hue2 = ramp2.stops.first?.value.h ?? 0
            return hue1 < hue2
        }
        
        // Find bounding ramps
        guard let (lowerRamp, upperRamp) = findBoundingRamps(forHue: targetHue, in: sortedRamps) else {
            assertionFailure("Unable to get any palettes")
            return []
        }
        
        // Get the first stop to determine hues
        let lowerHue = lowerRamp.stops.first?.value.h ?? 0
        let upperHue = upperRamp.stops.first?.value.h ?? 0
        
        // Calculate interpolation factor
        let t = (targetHue - lowerHue) / (upperHue - lowerHue)
        
        // Interpolate between corresponding stops
        let result = interpolateStops(from: lowerRamp, to: upperRamp, t: t)
        
        // Only cache non-empty results
        if !result.isEmpty {
            interpolatedRamps[normalizedHue] = result
        }
        
        guard !result.isEmpty else {
            assertionFailure("Unable to generate a palette")
            return []
        }
        
        return result
    }
    
    private func findBoundingRamps(forHue hue: Double, in ramps: [ColorRamp]) -> (ColorRamp, ColorRamp)? {
        guard let _ = ramps.first?.stops.first?.value.h,
              let _ = ramps.last?.stops.first?.value.h,
              !ramps.isEmpty else {
            return nil
        }
        
        // Handle wrap-around for hue
        let normalizedHue = (hue.truncatingRemainder(dividingBy: 360) + 360).truncatingRemainder(dividingBy: 360)
        
        // Find the first ramp with hue greater than target
        guard let upperIndex = ramps.firstIndex(where: { ramp in
            let rampHue = ramp.stops.first?.value.h ?? 0
            return rampHue >= normalizedHue
        }) else {
            // If not found, wrap around to first ramp
            return (ramps.last!, ramps.first!)
        }
        
        let lowerIndex = upperIndex == 0 ? ramps.count - 1 : upperIndex - 1
        return (ramps[lowerIndex], ramps[upperIndex])
    }
    
    private func interpolateStops(from: ColorRamp, to: ColorRamp, t: Double) -> [LCHColor] {
        // Get sorted stops from both ramps
        let fromStops = from.stops.sorted { Int($0.key) ?? 0 < Int($1.key) ?? 0 }
        let toStops = to.stops.sorted { Int($0.key) ?? 0 < Int($1.key) ?? 0 }
        
        guard !fromStops.isEmpty,
                fromStops.count == toStops.count else {
            assertionFailure("Unable to generate a palette")
            return []
        }
        
        // Interpolate each corresponding pair of stops
        return zip(fromStops, toStops).map { fromPair, toPair in
            let fromStop = fromPair.value
            let toStop = toPair.value
            
            return LCHColor(
                lchString: "lch(\(lerp(fromStop.l, toStop.l, t))% \(lerp(fromStop.c, toStop.c, t)) \(lerp(fromStop.h, toStop.h, t)))"
            )
        }
    }
    
    private func lerp(_ a: Double, _ b: Double, _ t: Double) -> Double {
        return a + (b - a) * t
    }
} 
