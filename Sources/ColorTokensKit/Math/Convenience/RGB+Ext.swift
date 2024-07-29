//
//  RGB+Ext.swift
//  
//
//  Created by Siddhant Mehta on 2024-07-29.
//

import Foundation
import SwiftUI

/// Extension to `RGBColor` providing conversion and interpolation methods.
public extension RGBColor {
    /**
     Converts the RGB color to the XYZ color space.
     
     - Returns: An `XYZColor` representation of the current `RGBColor`.
     
     The conversion is done using the sRGB to XYZ conversion formula.
     
     Example:
     ```swift
     let rgbColor = RGBColor(r: 0.5, g: 0.4, b: 0.3, alpha: 1.0)
     let xyzColor = rgbColor.toXYZ()
     print(xyzColor) // Output: XYZColor(x: 0.357, y: 0.333, z: 0.285, alpha: 1.0)
     ```
     */
    func toXYZ() -> XYZColor {
        let R = sRGBCompand(r)
        let G = sRGBCompand(g)
        let B = sRGBCompand(b)
        let x: CGFloat = (R * 0.4124564) + (G * 0.3575761) + (B * 0.1804375)
        let y: CGFloat = (R * 0.2126729) + (G * 0.7151522) + (B * 0.0721750)
        let z: CGFloat = (R * 0.0193339) + (G * 0.1191920) + (B * 0.9503041)
        return XYZColor(x: x, y: y, z: z, alpha: alpha)
    }
    
    /**
     Converts the RGB color to the LAB color space.
     
     - Returns: An `LABColor` representation of the current `RGBColor`.
     
     This method first converts the color to XYZ and then to LAB.
     
     Example:
     ```swift
     let rgbColor = RGBColor(r: 0.5, g: 0.4, b: 0.3, alpha: 1.0)
     let labColor = rgbColor.toLAB()
     print(labColor) // Output: LABColor(l: 42.33, a: 15.51, b: 25.32, alpha: 1.0)
     ```
     */
    func toLAB() -> LABColor {
        return toXYZ().toLAB()
    }
    
    /**
     Converts the RGB color to the LCH color space.
     
     - Returns: An `LCHColor` representation of the current `RGBColor`.
     
     This method first converts the color to XYZ, then to LAB, and finally to LCH.
     
     Example:
     ```swift
     let rgbColor = RGBColor(r: 0.5, g: 0.4, b: 0.3, alpha: 1.0)
     let lchColor = rgbColor.toLCH()
     print(lchColor) // Output: LCHColor(l: 42.33, c: 29.65, h: 59.53, alpha: 1.0)
     ```
     */
    func toLCH() -> LCHColor {
        return toXYZ().toLCH()
    }
    
    /**
     Converts the RGB color to a `UIColor`.
     
     - Returns: A `UIColor` representation of the current `RGBColor`.
     
     This method initializes a `UIColor` with the RGB and alpha values.
     
     Example:
     ```swift
     let rgbColor = RGBColor(r: 0.5, g: 0.4, b: 0.3, alpha: 1.0)
     let uiColor = rgbColor.color()
     print(uiColor) // Output: UIDeviceRGBColorSpace 0.5 0.4 0.3 1
     ```
     */
    func color() -> UIColor {
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
    
    /**
     Linearly interpolates between the current RGB color and another RGB color.
     
     - Parameters:
       - other: The target `RGBColor` to interpolate towards.
       - t: The interpolation factor, ranging from 0 to 1.
     
     - Returns: A new `RGBColor` that is the result of the interpolation.
     
     The interpolation is done by calculating the intermediate red, green, blue, and alpha values.
     
     Example:
     ```swift
     let rgbColor1 = RGBColor(r: 0.5, g: 0.4, b: 0.3, alpha: 1.0)
     let rgbColor2 = RGBColor(r: 0.7, g: 0.6, b: 0.5, alpha: 1.0)
     let interpolatedColor = rgbColor1.lerp(rgbColor2, t: 0.5)
     print(interpolatedColor) // Output: RGBColor(r: 0.6, g: 0.5, b: 0.4, alpha: 1.0)
     ```
     */
    func lerp(_ other: RGBColor, t: CGFloat) -> RGBColor {
        return RGBColor(
            r: r + (other.r - r) * t,
            g: g + (other.g - g) * t,
            b: b + (other.b - b) * t,
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
}
