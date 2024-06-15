//
//  ColorLCH.swift
//
//
//  Original repo: https://github.com/timrwood/ColorSpaces
//

import Foundation
import SwiftUI

public struct LCHColor: Hashable {
    private let l: CGFloat     // 0..100
    private let c: CGFloat     // 0..128
    private let h: CGFloat     // 0..360
    private let alpha: CGFloat // 0..1
    private let variableChroma: Bool
    
    public init (l: CGFloat, c: CGFloat, h: CGFloat, alpha: CGFloat = 1.0, variableChroma: Bool = true) {
        self.l = l
        self.c = c
        self.h = h
        self.variableChroma = variableChroma
        self.alpha = alpha
    }
    
    public init (h: CGFloat, variableChroma: Bool = true) {
        self.l = 0
        self.c = 0
        self.h = h
        self.variableChroma = variableChroma
        self.alpha = 1.0
    }
    
    public init (color: Color, variableChroma: Bool = true) {
        let lchColor = RGBColor(color: color).toLCH()
        self.l = lchColor.l
        self.c = lchColor.c
        self.h = lchColor.h
        self.alpha = lchColor.alpha
        self.variableChroma = variableChroma
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

extension LCHColor {
    public func getResponsiveColor(lightness: CGFloat, chroma: CGFloat, alpha: CGFloat = 1.0) -> Color {
        let h = self.getHue()
        let lightLCHColor = LCHColor(
            l: lightness,
            c: self.getVariableChroma() ? chroma : 0,
            h: h,
            alpha: alpha
        )
        let darkLCHColor = LCHColor(
            l: lightness,
            c: self.getVariableChroma() ? chroma : 0,
            h: h * 0.75,
            alpha: alpha
        )
        let color = Color(light: lightLCHColor.toColor(), dark: darkLCHColor.toColor())
        return color
    }
}

extension LCHColor {
    func getHue() -> CGFloat {
        self.h
    }
    func getLightness() -> CGFloat {
        self.l
    }
    func getChroma() -> CGFloat {
        self.c
    }
    func getVariableChroma() -> Bool {
        self.variableChroma
    }
}
