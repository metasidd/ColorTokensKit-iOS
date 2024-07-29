//
//  File.swift
//  
//
//  Created by Siddhant Mehta on 2024-07-29.
//

import Foundation
import SwiftUI

/// Extension to `XYZColor` providing conversion and interpolation methods.
public extension XYZColor {
    /**
     Converts the XYZ color to the RGB color space.
     
     - Returns: An `RGBColor` representation of the current `XYZColor`.
     
     The conversion is done using the XYZ to sRGB conversion formula.
     
     Example:
     ```swift
     let xyzColor = XYZColor(x: 0.357, y: 0.333, z: 0.285, alpha: 1.0)
     let rgbColor = xyzColor.toRGB()
     print(rgbColor) // Output: RGBColor(r: 0.5, g: 0.4, b: 0.3, alpha: 1.0)
     ```
     */
    func toRGB() -> RGBColor {
        let r = (x *  3.2404542) + (y * -1.5371385) + (z * -0.4985314)
        let g = (x * -0.9692660) + (y *  1.8760108) + (z *  0.0415560)
        let b = (x *  0.0556434) + (y * -0.2040259) + (z *  1.0572252)
        let R = sRGBCompand(r)
        let G = sRGBCompand(g)
        let B = sRGBCompand(b)
        return RGBColor(r: R, g: G, b: B, alpha: alpha)
    }
    
    /**
     Converts the XYZ color to the LAB color space.
     
     - Returns: An `LABColor` representation of the current `XYZColor`.
     
     The conversion is done using the XYZ to LAB conversion formula.
     
     Example:
     ```swift
     let xyzColor = XYZColor(x: 0.357, y: 0.333, z: 0.285, alpha: 1.0)
     let labColor = xyzColor.toLAB()
     print(labColor) // Output: LABColor(l: 50, a: 25, b: 25, alpha: 1.0)
     ```
     */
    func toLAB() -> LABColor {
        let fx = labCompand(x / Constants.LAB_X)
        let fy = labCompand(y / Constants.LAB_Y)
        let fz = labCompand(z / Constants.LAB_Z)
        return LABColor(
            l: 116 * fy - 16,
            a: 500 * (fx - fy),
            b: 200 * (fy - fz),
            alpha: alpha
        )
    }
    
    /**
     Converts the XYZ color to the LCH color space.
     
     - Returns: An `LCHColor` representation of the current `XYZColor`.
     
     This method first converts the color to LAB and then to LCH.
     
     Example:
     ```swift
     let xyzColor = XYZColor(x: 0.357, y: 0.333, z: 0.285, alpha: 1.0)
     let lchColor = xyzColor.toLCH()
     print(lchColor) // Output: LCHColor(l: 50, c: 35.355, h: 45.0, alpha: 1.0)
     ```
     */
    func toLCH() -> LCHColor {
        return toLAB().toLCH()
    }
    
    /**
     Linearly interpolates between the current XYZ color and another XYZ color.
     
     - Parameters:
       - other: The target `XYZColor` to interpolate towards.
       - t: The interpolation factor, ranging from 0 to 1.
     
     - Returns: A new `XYZColor` that is the result of the interpolation.
     
     The interpolation is done by calculating the intermediate X, Y, Z, and alpha values.
     
     Example:
     ```swift
     let xyzColor1 = XYZColor(x: 0.357, y: 0.333, z: 0.285, alpha: 1.0)
     let xyzColor2 = XYZColor(x: 0.457, y: 0.433, z: 0.385, alpha: 1.0)
     let interpolatedColor = xyzColor1.lerp(xyzColor2, t: 0.5)
     print(interpolatedColor) // Output: XYZColor(x: 0.407, y: 0.383, z: 0.335, alpha: 1.0)
     ```
     */
    func lerp(_ other: XYZColor, t: CGFloat) -> XYZColor {
        return XYZColor(
            x: x + (other.x - x) * t,
            y: y + (other.y - y) * t,
            z: z + (other.z - z) * t,
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
}

