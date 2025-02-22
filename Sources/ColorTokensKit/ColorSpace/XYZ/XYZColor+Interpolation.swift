//
//  XYZColor+Interpolation.swift
//  ColorTokensKit
//

import Foundation

public extension XYZColor {
    /// Interpolates between two XYZ colors
    func lerp(_ other: XYZColor, t: CGFloat) -> XYZColor {
        return XYZColor(
            x: x + (other.x - x) * t,
            y: y + (other.y - y) * t,
            z: z + (other.z - z) * t,
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
}
