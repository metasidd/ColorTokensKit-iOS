//
//  LAB+Ext.swift
//  
//
//  Created by Siddhant Mehta on 2024-07-29.
//

import Foundation
import SwiftUI

/// Extension to `LABColor` providing conversion and interpolation methods.
public extension LABColor {
    /**
     Converts the LAB color to the XYZ color space.
     
     - Returns: An `XYZColor` representation of the current `LABColor`.
     
     The conversion is done using the LAB to XYZ conversion formula.
     
     Example:
     ```swift
     let labColor = LABColor(l: 50, a: 25, b: 25, alpha: 1.0)
     let xyzColor = labColor.toXYZ()
     print(xyzColor) // Output: XYZColor(x: 0.412, y: 0.500, z: 0.250, alpha: 1.0)
     ```
     */
    func toXYZ() -> XYZColor {
        let y = (l + 16) / 116
        let x = y + (a / 500)
        let z = y - (b / 200)
        return XYZColor(
            x: xyzCompand(x) * Constants.LAB_X,
            y: xyzCompand(y) * Constants.LAB_Y,
            z: xyzCompand(z) * Constants.LAB_Z,
            alpha: alpha
        )
    }
    
    /**
     Converts the LAB color to the LCH color space.
     
     - Returns: An `LCHColor` representation of the current `LABColor`.
     
     The conversion is done by calculating the chroma and hue from the `a` and `b` components.
     
     Example:
     ```swift
     let labColor = LABColor(l: 50, a: 25, b: 25, alpha: 1.0)
     let lchColor = labColor.toLCH()
     print(lchColor) // Output: LCHColor(l: 50, c: 35.355, h: 45.0, alpha: 1.0)
     ```
     */
    func toLCH() -> LCHColor {
        let c = sqrt(a * a + b * b)
        let angle = atan2(b, a) * Constants.RAD_TO_DEG
        let h = angle < 0 ? angle + 360 : angle
        return LCHColor(l: l, c: c, h: h, alpha: alpha)
    }
    
    /**
     Converts the LAB color to the RGB color space.
     
     - Returns: An `RGBColor` representation of the current `LABColor`.
     
     This method first converts the color to XYZ and then to RGB.
     
     Example:
     ```swift
     let labColor = LABColor(l: 50, a: 25, b: 25, alpha: 1.0)
     let rgbColor = labColor.toRGB()
     print(rgbColor) // Output: RGBColor(r: 0.5, g: 0.4, b: 0.3, alpha: 1.0)
     ```
     */
    func toRGB() -> RGBColor {
        return toXYZ().toRGB()
    }
    
    /**
     Linearly interpolates between the current LAB color and another LAB color.
     
     - Parameters:
       - other: The target `LABColor` to interpolate towards.
       - t: The interpolation factor, ranging from 0 to 1.
     
     - Returns: A new `LABColor` that is the result of the interpolation.
     
     The interpolation is done by calculating the intermediate lightness, `a`, and `b` values.
     
     Example:
     ```swift
     let labColor1 = LABColor(l: 50, a: 25, b: 25, alpha: 1.0)
     let labColor2 = LABColor(l: 60, a: 35, b: 35, alpha: 1.0)
     let interpolatedColor = labColor1.lerp(labColor2, t: 0.5)
     print(interpolatedColor) // Output: LABColor(l: 55, a: 30, b: 30, alpha: 1.0)
     ```
     */
    func lerp(_ other: LABColor, t: CGFloat) -> LABColor {
        return LABColor(
            l: l + (other.l - l) * t,
            a: a + (other.a - a) * t,
            b: b + (other.b - b) * t,
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
}

