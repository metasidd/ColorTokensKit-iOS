//
//  XYZColor+Manipulation.swift
//  ColorTokensKit
//

import Foundation

public extension XYZColor {
    /// Creates a new XYZColor with adjusted components
    func with(
        x: CGFloat? = nil,
        y: CGFloat? = nil,
        z: CGFloat? = nil,
        alpha: CGFloat? = nil
    ) -> XYZColor {
        return XYZColor(
            x: x ?? self.x,
            y: y ?? self.y,
            z: z ?? self.z,
            alpha: alpha ?? self.alpha
        )
    }
} 