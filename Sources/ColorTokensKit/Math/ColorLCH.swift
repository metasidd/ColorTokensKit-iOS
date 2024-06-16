//
//  ColorLCH.swift
//
//
//  Original repo: https://github.com/timrwood/ColorSpaces
//

import Foundation
import SwiftUI

public struct LCHColor: Hashable, Equatable {
    public let l: CGFloat     // 0..100
    public let c: CGFloat     // 0..128
    public let h: CGFloat     // 0..360
    public let alpha: CGFloat // 0..1
    public let variableChroma: Bool
    public let variableHue: Bool
    
    public init (l: CGFloat, c: CGFloat, h: CGFloat, alpha: CGFloat = 1.0, variableChroma: Bool = true, variableHue: Bool = true) {
        self.l = l
        self.c = variableChroma ? c : 0 // TODO: rethink this
        self.h = variableHue ? h : 0  // TODO: rethink this
        self.variableChroma = variableChroma
        self.variableHue = variableHue
        self.alpha = alpha
    }
    
    public init (h: CGFloat, variableChroma: Bool = true, variableHue: Bool = true) {
        self.l = 0
        self.c = 0
        self.h = variableHue ? h : 0 // TODO: rethink this
        self.alpha = 1.0
        self.variableChroma = variableChroma
        self.variableHue = variableHue
    }
    
    public init (color: Color, variableChroma: Bool = true, variableHue: Bool = true) {
        let lchColor = RGBColor(color: color).toLCH()
        self.l = lchColor.l
        self.c = variableChroma ? lchColor.c : 0 // TODO: rethink this
        self.h = variableHue ? lchColor.h : 0 // TODO: rethink this
        self.alpha = lchColor.alpha
        self.variableChroma = variableChroma
        self.variableHue = variableHue
    }

    public func toLAB() -> LABColor {
        let rad = h / Constants.RAD_TO_DEG
        let a = cos(rad) * c
        let b = sin(rad) * c
        return LABColor(l: l, a: a, b: b, alpha: alpha)
    }
    
    public func toXYZ() -> XYZColor {
        return toLAB().toXYZ()
    }
    
    public func toRGB() -> RGBColor {
        return toXYZ().toRGB()
    }
    
    public func toColor() -> Color {
        let rgb = self.toRGB()
        return Color.init(red: rgb.r, green: rgb.g, blue: rgb.b)
    }
    
    public func lerp(_ other: LCHColor, t: CGFloat) -> LCHColor {
        let angle = (((((other.h - h).truncatingRemainder(dividingBy: 360)) + 540).truncatingRemainder(dividingBy: 360)) - 180) * t
        return LCHColor(
            l: l + (other.l - l) * t,
            c: c + (other.c - c) * t,
            h: (h + angle + 360).truncatingRemainder(dividingBy: 360),
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
}

public extension LCHColor {
    func getResponsiveColor(lightness: CGFloat, chroma: CGFloat, alpha: CGFloat = 1.0) -> Color {
        let lightLCHColor = LCHColor(
            l: lightness,
            c: self.variableChroma ? chroma : 0,
            h: self.variableHue ? h : 0,
            alpha: alpha
        )
        let darkLCHColor = LCHColor(
            l: 100 - lightness,
            c: self.variableChroma ? chroma * 0.95 : 0,
            h: self.variableHue ? h : 0,
            alpha: alpha
        )
        let color = Color(light: lightLCHColor.toColor(), dark: darkLCHColor.toColor())
        return color
    }
}
