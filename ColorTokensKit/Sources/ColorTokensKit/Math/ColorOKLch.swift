//
//  File.swift
//  
//
//  Created by Siddhant Mehta on 2024-06-16.
//

import Foundation
import SwiftUI

public struct OKLCHColor: Hashable {
    public let l: CGFloat     // 0..1
    public let c: CGFloat     // 0..1
    public let h: CGFloat     // 0..360
    public let alpha: CGFloat // 0..1
    public let variableChroma: Bool
    public let variableHue: Bool
    
    public init(l: CGFloat = 0, c: CGFloat = 0, h: CGFloat, alpha: CGFloat = 1.0, variableChroma: Bool = true, variableHue: Bool = true) {
        self.l = clamp(l, min: 0, max: 1)
        self.c = variableChroma ? clamp(c, min: 0, max: 1) : 0 // TODO: rethink this
        self.h = variableHue ? clamp(h, min: 0, max: 360) : 0  // TODO: rethink this
        self.alpha = clamp(alpha, min: 0, max: 1)
        self.variableChroma = variableChroma
        self.variableHue = variableHue
    }
    
    public init(color: Color, variableChroma: Bool = true, variableHue: Bool = true) {
        let oklchColor = RGBColor(color: color).toOKLCH()
        self.l = oklchColor.l
        self.c = variableChroma ? clamp(oklchColor.c, min: 0, max: 1) : 0 // TODO: rethink this
        self.h = variableHue ? clamp(oklchColor.h, min: 0, max: 360) : 0 // TODO: rethink this
        self.alpha = oklchColor.alpha
        self.variableChroma = variableChroma
        self.variableHue = variableHue
    }

    public func toOklab() -> OklabColor {
        let rad = h * CGFloat.pi / 180.0
        let a = cos(rad) * c
        let b = sin(rad) * c
        return OklabColor(l: l, a: a, b: b, alpha: alpha)
    }
    
    public func toXYZ() -> XYZColor {
        return toOklab().toXYZ()
    }
    
    public func toRGB() -> RGBColor {
        return toXYZ().toRGB()
    }
    
    public func toColor() -> Color {
        let rgb = self.toRGB()
        return Color.init(red: rgb.r, green: rgb.g, blue: rgb.b)
    }

    public func printValues() {
        print("L:\(Double(l)) C:\(Double(c)) H:\(Double(h))")
    }
}

public extension OKLCHColor {
    func getResponsiveColor(lightness: CGFloat, chroma: CGFloat, alpha: CGFloat = 1.0) -> Color {
        let lightOKLCHColor = OKLCHColor(
            l: lightness,
            c: self.variableChroma ? chroma : 0,
            h: self.variableHue ? h : 0,
            alpha: alpha
        )
        let darkOKLCHColor = OKLCHColor(
            l: 100 - lightness,
            c: self.variableChroma ? chroma : 0,
            h: self.variableHue ? h : 0,
            alpha: alpha
        )
        let color = Color(light: lightOKLCHColor.toColor(), dark: darkOKLCHColor.toColor())
        return color
    }
}
