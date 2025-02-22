//
//  RGBColor+Manipulation.swift
//  ColorTokensKit
//

import Foundation
import SwiftUI

public extension RGBColor {
    /// Creates a new RGBColor with adjusted components
    func with(
        r: CGFloat? = nil,
        g: CGFloat? = nil,
        b: CGFloat? = nil,
        alpha: CGFloat? = nil
    ) -> RGBColor {
        return RGBColor(
            r: r ?? self.r,
            g: g ?? self.g,
            b: b ?? self.b,
            alpha: alpha ?? self.alpha
        )
    }
}
