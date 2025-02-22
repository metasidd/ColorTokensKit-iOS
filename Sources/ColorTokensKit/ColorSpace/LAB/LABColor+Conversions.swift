//
//  LABColor+Conversions.swift
//  ColorTokensKit
//
//  Created by Siddhant Mehta on 2024-07-29.
//

import Foundation
import SwiftUI

public extension LABColor {
    /// Converts the LAB color to the XYZ color space.
    /// - Returns: An `XYZColor` representation of the current `LABColor`.
    func toXYZ() -> XYZColor {
        let y = (l + 16) / 116
        let x = y + (a / 500)
        let z = y - (b / 200)
        return XYZColor(
            x: xyzCompand(x) * ColorConstants.LAB_X,
            y: xyzCompand(y) * ColorConstants.LAB_Y,
            z: xyzCompand(z) * ColorConstants.LAB_Z,
            alpha: alpha
        )
    }

    /// Converts the LAB color to the LCH color space.
    /// - Returns: An `LCHColor` representation of the current `LABColor`.
    func toLCH() -> LCHColor {
        let c = sqrt(a * a + b * b)
        let angle = atan2(b, a) * ColorConstants.RAD_TO_DEG
        let h = angle < 0 ? angle + 360 : angle
        return LCHColor(l: l, c: c, h: h, alpha: alpha)
    }

    /// Converts the LAB color to the RGB color space.
    /// - Returns: An `RGBColor` representation of the current `LABColor`.
    func toRGB() -> RGBColor {
        return toXYZ().toRGB()
    }
}
