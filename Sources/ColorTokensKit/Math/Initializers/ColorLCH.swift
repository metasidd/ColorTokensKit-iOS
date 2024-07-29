//
//  ColorLCH.swift
//
//
//  Original repo: https://github.com/timrwood/ColorSpaces
//

import Foundation
import SwiftUI

public struct LCHColor: Hashable, Equatable {
    public let l: CGFloat     // 0..100. How bright or dark the color is.
    public let c: CGFloat     // 0..128. How much saturation the color holds.
    public let h: CGFloat     // 0..360. What hue it picks.
    public let alpha: CGFloat // 0..1
    public let variableChroma: Bool
    public let variableHue: Bool
    
    public init (
        l: CGFloat = 0,
        c: CGFloat = 0,
        h: CGFloat = 0,
        alpha: CGFloat = 1.0,
        variableChroma: Bool = true,
        variableHue: Bool = true
    ) {
        self.l = l
        self.c = variableChroma ? c : 0
        self.h = variableHue ? h : 0
        self.alpha = alpha
        self.variableChroma = variableChroma
        self.variableHue = variableHue
    }
    
    public init (
        color: Color,
        variableChroma: Bool = true,
        variableHue: Bool = true
    ) {
        let lchColor = RGBColor(color: color).toLCH()
        self.l = lchColor.l
        self.c = variableChroma ? lchColor.c : 0
        self.h = variableHue ? lchColor.h : 0
        self.alpha = lchColor.alpha
        self.variableChroma = variableChroma
        self.variableHue = variableHue
    }
}
