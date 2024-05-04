//
//  PaletteColors.swift
//  
//
//  Created by Siddhant Mehta on 2023-12-08.
//

import Foundation
import SwiftUI

public protocol PaletteColor {
    init()
    static var _1: Color { get }
    static var _2: Color { get }
    static var _3: Color { get }
    static var _4: Color { get }
    static var _5: Color { get }
    static var _6: Color { get }
    static var _7: Color { get }
    static var _8: Color { get }
    static var _9: Color { get }
    static var _10: Color { get }
    static var _11: Color { get }
    static var _12: Color { get }
    static var _1Alpha: Color { get }
    static var _2Alpha: Color { get }
    static var _3Alpha: Color { get }
    static var _4Alpha: Color { get }
    static var _5Alpha: Color { get }
    static var _6Alpha: Color { get }
    static var _7Alpha: Color { get }
    static var _8Alpha: Color { get }
    static var _9Alpha: Color { get }
    static var _10Alpha: Color { get }
    static var _11Alpha: Color { get }
    static var _12Alpha: Color { get }
    
    func invertedForeground() -> Color
}

public extension PaletteColor {
    
    var foreground: Color { return Self._12 }
    var foregroundSecondary: Color { return Self._11 }
    var foregroundTertiary: Color { return Self._10 }
    var background: Color { return Self._3Alpha }
    var backgroundSecondary: Color { return Self._2Alpha }
    var outline: Color { return Self._7Alpha }
    var outlineSecondary: Color { return Self._6Alpha }
    var invertedBackground: Color { return Self._10 }
    
    // Special considerations for lighter colors
    func invertedForeground() -> Color {
        switch self {
        case is Palettes.sky,
            is Palettes.mint,
            is Palettes.lime,
            is Palettes.yellow,
            is Palettes.amber:
            return Color(light: Self._12, dark: Self._2)
        default:
            return Self._1
        }
    }
}
