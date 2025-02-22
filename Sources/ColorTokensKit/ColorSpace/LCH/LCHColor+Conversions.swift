//
//  LCHColor+Conversions.swift
//  ColorTokensKit
//
//  Created by Siddhant Mehta on 2024-07-29.
//

import Foundation
import SwiftUI

public extension LCHColor {
    /// Converts to LAB color space
    func toLAB() -> LABColor {
        let rad = h / ColorConstants.RAD_TO_DEG
        let a = cos(rad) * c
        let b = sin(rad) * c
        return LABColor(l: l, a: a, b: b, alpha: alpha)
    }

    /// Converts to XYZ via LAB
    func toXYZ() -> XYZColor {
        return toLAB().toXYZ()
    }

    /// Converts to RGB via XYZ
    func toRGB() -> RGBColor {
        return toXYZ().toRGB()
    }

    /// Converts to SwiftUI Color
    func toColor() -> Color {
        let rgb = toRGB()
        return Color(red: rgb.r, green: rgb.g, blue: rgb.b)
    }
}
