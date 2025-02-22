//
//  RGBColor+Interpolation.swift
//  ColorTokensKit
//

import Foundation

public extension RGBColor {
    /// Interpolates between two RGB colors
    func lerp(_ other: RGBColor, t: CGFloat) -> RGBColor {
        return RGBColor(
            r: r + (other.r - r) * t,
            g: g + (other.g - g) * t,
            b: b + (other.b - b) * t,
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
}
