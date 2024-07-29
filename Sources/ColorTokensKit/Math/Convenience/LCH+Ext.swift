//
//  LCH+Ext.swift
//
//
//  Created by Siddhant Mehta on 2024-07-29.
//

import Foundation
import SwiftUI

public extension LCHColor {
    func toLAB() -> LABColor {
        let rad = h / Constants.RAD_TO_DEG
        let a = cos(rad) * c
        let b = sin(rad) * c
        return LABColor(l: l, a: a, b: b, alpha: alpha)
    }
    
    func toXYZ() -> XYZColor {
        return toLAB().toXYZ()
    }
    
    func toRGB() -> RGBColor {
        return toXYZ().toRGB()
    }
    
    func toColor() -> Color {
        let rgb = self.toRGB()
        return Color.init(red: rgb.r, green: rgb.g, blue: rgb.b)
    }
    
    func lerp(_ other: LCHColor, t: CGFloat) -> LCHColor {
        let angle = (((((other.h - h).truncatingRemainder(dividingBy: 360)) + 540).truncatingRemainder(dividingBy: 360)) - 180) * t
        return LCHColor(
            l: l + (other.l - l) * t,
            c: c + (other.c - c) * t,
            h: (h + angle + 360).truncatingRemainder(dividingBy: 360),
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
    
    func getColor(
        l: CGFloat? = nil,
        c: CGFloat? = nil,
        h: CGFloat? = nil,
        alpha: CGFloat? = nil,
        variableChroma: Bool? = nil,
        variableHue: Bool? = nil
    ) -> Color {
        return LCHColor(
            l: l ?? self.l,
            c: (variableChroma ?? self.variableChroma) ? (c ?? self.c) : 0,
            h: (variableHue ?? self.variableHue) ? (h ?? self.h) : 0,
            alpha: alpha ?? self.alpha,
            variableChroma: variableChroma ?? self.variableChroma,
            variableHue: variableHue ?? self.variableHue
        ).toColor()
    }
}
