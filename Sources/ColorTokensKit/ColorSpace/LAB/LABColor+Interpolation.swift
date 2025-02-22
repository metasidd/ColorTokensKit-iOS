//
//  LABColor+Interpolation.swift
//  ColorTokensKit
//
//  Created by Siddhant Mehta on 2024-07-29.
//

import Foundation
import SwiftUI

public extension LABColor {
    /// Linearly interpolates between the current LAB color and another LAB color.
    ///
    /// - Parameters:
    ///   - other: The target `LABColor` to interpolate towards.
    ///   - t: The interpolation factor, ranging from 0 to 1.
    ///
    /// - Returns: A new `LABColor` that is the result of the interpolation.
    func lerp(_ other: LABColor, t: CGFloat) -> LABColor {
        return LABColor(
            l: l + (other.l - l) * t,
            a: a + (other.a - a) * t,
            b: b + (other.b - b) * t,
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
}
