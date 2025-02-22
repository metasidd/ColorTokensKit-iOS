//
//  RGBColor+Conversions.swift
//  ColorTokensKit
//

import Foundation
import SwiftUI

public extension RGBColor {
    /// Converts to XYZ color space
    func toXYZ() -> XYZColor {
        let R = sRGBCompand(r)
        let G = sRGBCompand(g)
        let B = sRGBCompand(b)
        let x: CGFloat = (R * 0.4124564) + (G * 0.3575761) + (B * 0.1804375)
        let y: CGFloat = (R * 0.2126729) + (G * 0.7151522) + (B * 0.0721750)
        let z: CGFloat = (R * 0.0193339) + (G * 0.1191920) + (B * 0.9503041)
        return XYZColor(x: x, y: y, z: z, alpha: alpha)
    }

    /// Converts to LAB via XYZ
    func toLAB() -> LABColor {
        return toXYZ().toLAB()
    }

    /// Converts to LCH via XYZ
    func toLCH() -> LCHColor {
        return toXYZ().toLCH()
    }

    #if canImport(UIKit)
        /// Converts to UIColor
        func color() -> UIColor {
            return UIColor(red: r, green: g, blue: b, alpha: alpha)
        }
    #endif
}
