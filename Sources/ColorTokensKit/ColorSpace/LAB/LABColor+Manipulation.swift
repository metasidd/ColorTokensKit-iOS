//
//  LABColor+Manipulation.swift
//  ColorTokensKit
//
//  Created by Siddhant Mehta on 2024-07-29.
//

import Foundation
import SwiftUI

public extension LABColor {
    /// Creates a new LABColor with adjusted components.
    ///
    /// - Parameters:
    ///   - l: New lightness value. If nil, uses current value.
    ///   - a: New a value. If nil, uses current value.
    ///   - b: New b value. If nil, uses current value.
    ///   - alpha: New alpha value. If nil, uses current value.
    func with(
        l: CGFloat? = nil,
        a: CGFloat? = nil,
        b: CGFloat? = nil,
        alpha: CGFloat? = nil
    ) -> LABColor {
        return LABColor(
            l: l ?? self.l,
            a: a ?? self.a,
            b: b ?? self.b,
            alpha: alpha ?? self.alpha
        )
    }

    /// Adjusts the lightness of the color.
    ///
    /// - Parameter amount: The amount to adjust the lightness by.
    /// - Returns: A new LABColor with adjusted lightness.
    func adjustLightness(by amount: CGFloat) -> LABColor {
        return with(l: max(0, min(100, l + amount)))
    }
}
