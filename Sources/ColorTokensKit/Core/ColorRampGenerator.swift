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
    private var interpolatedRamps: [String: [LCHColor]] = [:]
    private let colorPaletteData: ColorPaletteData
    
    /// Initializes the color ramp generator with required palette data
    public init() {
        guard let data = ColorRampLoader.loadColorRamps() else {
            fatalError("Required color palette data is missing")
        }
        self.colorPaletteData = data
    }
    
    /// Generates a color ramp for a given hue value
    /// - Parameters:
    ///   - targetHue: The target hue value (0-360 degrees)
    ///   - steps: Optional number of steps in the ramp (defaults to palette's step count)
    /// - Returns: Array of LCHColors representing the color ramp
    public func getColorRamp(forHue targetHue: Double, steps: Int? = nil) -> [LCHColor] {
        // Assign a constant value
        let steps = steps ?? ColorConstants.rampStops
        
        // Normalize the input hue to 0-360 range
        let normalizedHue = (targetHue.truncatingRemainder(dividingBy: 360) + 360).truncatingRemainder(dividingBy: 360)
        
        // Generate cache key combining hue and steps
        let cacheKey = "H\(normalizedHue)-\(steps)"
        
        // Check cache first
        if let cached = interpolatedRamps[cacheKey] {
            return cached
        }
        
        // Get all ramps sorted by hue
        let sortedRamps = colorPaletteData.colorRamps.sorted { ramp1, ramp2 in
            let hue1 = ramp1.stops.first?.value.h ?? 0
            let hue2 = ramp2.stops.first?.value.h ?? 0
            return hue1 < hue2
        }
        
        // Find bounding ramps
        let (lowerRamp, upperRamp) = findBoundingRamps(forHue: normalizedHue, in: sortedRamps)
        
        // Get the first stop to determine hues
        let lowerHue = lowerRamp.stops.first?.value.h ?? 0
        let upperHue = upperRamp.stops.first?.value.h ?? 0
        
        // Calculate interpolation factor with proper wrapping
        let hueDiff = (upperHue - lowerHue + 360).truncatingRemainder(dividingBy: 360)
        let t = (normalizedHue - lowerHue + 360).truncatingRemainder(dividingBy: 360) / hueDiff
        
        // Interpolate between corresponding stops
        let result = interpolateStops(from: lowerRamp, to: upperRamp, t: t)
        
        // Cache the result
        interpolatedRamps[cacheKey] = result
        
        return result
    }
    
    /// Finds the two color ramps that bound the target hue
    /// - Parameters:
    ///   - hue: Target hue value
    ///   - ramps: Array of available color ramps
    /// - Returns: Tuple of (lower, upper) ramps that bound the target hue
    private func findBoundingRamps(forHue hue: Double, in ramps: [ColorRamp]) -> (ColorRamp, ColorRamp) {
        // If only one ramp exists, use it for both bounds
        guard ramps.count > 1 else {
            return (ramps[0], ramps[0])
        }
        
        // Find the first ramp with hue greater than target
        let upperIndex = ramps.firstIndex { ramp in
            let rampHue = ramp.stops.first?.value.h ?? 0
            return rampHue >= hue
        } ?? 0
        
        let lowerIndex = upperIndex == 0 ? ramps.count - 1 : upperIndex - 1
        return (ramps[lowerIndex], ramps[upperIndex])
    }
    
    /// Interpolates between corresponding color stops of two ramps
    /// - Parameters:
    ///   - from: Starting color ramp
    ///   - to: Ending color ramp
    ///   - t: Interpolation factor (0-1)
    /// - Returns: Array of interpolated LCHColors
    private func interpolateStops(from: ColorRamp, to: ColorRamp, t: Double) -> [LCHColor] {
        // Get sorted stops from both ramps
        let fromStops = from.stops.sorted { Int($0.key) ?? 0 < Int($1.key) ?? 0 }
        let toStops = to.stops.sorted { Int($0.key) ?? 0 < Int($1.key) ?? 0 }
        
        // Create evenly spaced indices for the requested number of steps
        let stepSize = 1.0 / Double(ColorConstants.rampStops - 1)
        
        return (0..<ColorConstants.rampStops).map { step in
            let progress = Double(step) * stepSize
            
            // Find the bounding stops in both ramps
            let fromIndex = Int((Double(fromStops.count - 1) * progress).rounded())
            let toIndex = Int((Double(toStops.count - 1) * progress).rounded())
            
            let fromStop = fromStops[fromIndex].value
            let toStop = toStops[toIndex].value
            
            return LCHColor(
                l: lerp(fromStop.l, toStop.l, t),
                c: lerp(fromStop.c, toStop.c, t),
                h: lerpHue(fromStop.h, toStop.h, t)
            )
        }
    }
    
    /// Linear interpolation between two values
    /// - Parameters:
    ///   - a: Starting value
    ///   - b: Ending value
    ///   - t: Interpolation factor (0-1)
    /// - Returns: Interpolated value
    private func lerp(_ a: Double, _ b: Double, _ t: Double) -> Double {
        return a + (b - a) * t
    }
    
    /// Interpolates between two hue angles, taking the shortest path around the color wheel
    /// - Parameters:
    ///   - h1: Starting hue angle (0-360)
    ///   - h2: Ending hue angle (0-360)
    ///   - t: Interpolation factor (0-1)
    /// - Returns: Interpolated hue angle
    private func lerpHue(_ h1: Double, _ h2: Double, _ t: Double) -> Double {
        let diff = (h2 - h1 + 360).truncatingRemainder(dividingBy: 360)
        let shortestPath = diff <= 180 ? diff : diff - 360
        return (h1 + shortestPath * t + 360).truncatingRemainder(dividingBy: 360)
    }
} 

