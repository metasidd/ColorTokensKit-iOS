//
//  LCH+Ext.swift
//
//
//  Created by Siddhant Mehta on 2024-07-29.
//

import Foundation
import SwiftUI

/// Extension to `LCHColor` providing conversion and interpolation methods.
public extension LCHColor {
    /**
     Converts the LCH color to the LAB color space.
     
     - Returns: An `LABColor` representation of the current `LCHColor`.
     
     The conversion is done by calculating the `a` and `b` components from the chroma and hue.
     */
    func toLAB() -> LABColor {
        let rad = h / Constants.RAD_TO_DEG
        let a = cos(rad) * c
        let b = sin(rad) * c
        return LABColor(l: l, a: a, b: b, alpha: alpha)
    }
    
    /**
     Converts the LCH color to the XYZ color space.
     
     - Returns: An `XYZColor` representation of the current `LCHColor`.
     
     This method first converts the color to LAB and then to XYZ.
     */
    func toXYZ() -> XYZColor {
        return toLAB().toXYZ()
    }
    
    /**
     Converts the LCH color to the RGB color space.
     
     - Returns: An `RGBColor` representation of the current `LCHColor`.
     
     This method first converts the color to XYZ and then to RGB.
     */
    func toRGB() -> RGBColor {
        return toXYZ().toRGB()
    }
    
    /**
     Converts the LCH color to a SwiftUI `Color`.
     
     - Returns: A `Color` representation of the current `LCHColor`.
     
     This method converts the color to RGB and initializes a `Color` with the resulting values.
     */
    func toColor() -> Color {
        let rgb = self.toRGB()
        return Color(red: rgb.r, green: rgb.g, blue: rgb.b)
    }
    
    /**
     Linearly interpolates between the current LCH color and another LCH color.
     
     - Parameters:
       - other: The target `LCHColor` to interpolate towards.
       - t: The interpolation factor, ranging from 0 to 1.
     
     - Returns: A new `LCHColor` that is the result of the interpolation.
     
     The interpolation is done by calculating the intermediate lightness, chroma, and hue.
     */
    func lerp(_ other: LCHColor, t: CGFloat) -> LCHColor {
        let angle = (((((other.h - h).truncatingRemainder(dividingBy: 360)) + 540).truncatingRemainder(dividingBy: 360)) - 180) * t
        return LCHColor(
            l: l + (other.l - l) * t,
            c: c + (other.c - c) * t,
            h: (h + angle + 360).truncatingRemainder(dividingBy: 360),
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
    
    /**
     Creates a new `Color` by adjusting the current LCH values.
     
     - Parameters:
       - l: The lightness value to use. If `nil`, the current lightness is used.
       - c: The chroma value to use. If `nil`, the current chroma is used.
       - h: The hue value to use. If `nil`, the current hue is used.
       - alpha: The alpha value to use. If `nil`, the current alpha is used.
       - variableChroma: A boolean indicating whether chroma should be variable. If `nil`, the current value is used.
       - variableHue: A boolean indicating whether hue should be variable. If `nil`, the current value is used.
     
     - Returns: A `Color` initialized with the adjusted LCH values.
     
     This method allows for the creation of new colors with adjusted properties while maintaining flexibility with optional parameters.
     */
    func getColor(
        l: CGFloat? = nil,
        c: CGFloat? = nil,
        h: CGFloat? = nil,
        alpha: CGFloat? = nil,
        variableChroma: Bool? = nil,
        variableHue: Bool? = nil
    ) -> Color {
        return LCHColor(
            l: l ?? self.l,
            c: (variableChroma ?? self.variableChroma) ? (c ?? self.c) : 0,
            h: (variableHue ?? self.variableHue) ? (h ?? self.h) : 0,
            alpha: alpha ?? self.alpha,
            variableChroma: variableChroma ?? self.variableChroma,
            variableHue: variableHue ?? self.variableHue
        ).toColor()
    }
}
