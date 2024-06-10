//
//  ColorLCH.swift
//
//
//  Original repo: https://github.com/timrwood/ColorSpaces
//

import Foundation
import SwiftUI

public struct LCHColor: Hashable {
    public let l: CGFloat     // 0..100
    public let c: CGFloat     // 0..128
    public let h: CGFloat     // 0..360
    public let alpha: CGFloat // 0..1
    
    public init (l: CGFloat, c: CGFloat, h: CGFloat, alpha: CGFloat) {
        self.l = l
        self.c = c
        self.h = h
        self.alpha = alpha
    }
    
    public init (color: Color) {
        let lchColor = RGBColor(color: color).toLCH()
        self.l = lchColor.l
        self.c = lchColor.c
        self.h = lchColor.h
        self.alpha = lchColor.alpha
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
