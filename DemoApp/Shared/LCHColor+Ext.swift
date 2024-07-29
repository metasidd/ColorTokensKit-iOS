//
//  ColorRampUtility.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-09.
//

import Foundation
import ColorTokensKit
import SwiftUI

public extension LCHColor {
    // Foreground colors
    var foregroundPrimary: Color { Color(light: _100, dark: _0_pastel) }
    var foregroundSecondary: Color { Color(light: _80, dark: _20_pastel) }
    var foregroundTertiary: Color { Color(light: _65, dark: _35_pastel) }
    
    // Inverted foreground colors
    var invertedForegroundPrimary: Color { Color(light: _0, dark: _100_pastel) }
    var invertedForegroundSecondary: Color { Color(light: _10, dark: _90_pastel) }
    var invertedForegroundTertiary: Color { Color(light: _20, dark: _80_pastel) }
    
    // Background colors
    var backgroundPrimary: Color { Color(light: _5, dark: _95_pastel) }
    var backgroundSecondary: Color { Color(light: _10, dark: _90_pastel) }
    var backgroundTertiary: Color { Color(light: _20, dark: _80_pastel) }
    
    // Inverted background colors
    var invertedBackgroundPrimary: Color { Color(light: _85, dark: _15_pastel) }
    var invertedBackgroundSecondary: Color { Color(light: _70, dark: _30_pastel) }
    var invertedBackgroundTertiary: Color { Color(light: _60, dark: _40_pastel) }
    
    // Outline colors
    var outlinePrimary: Color { Color(light: _30, dark: _70_pastel) }
    var outlineSecondary: Color { Color(light: _10, dark: _90_pastel) }
    var outlineTertiary: Color { Color(light: _5, dark: _95_pastel) }

}

extension LCHColor {
    func getContrast(with lchColor: LCHColor) -> Double {
        let color1 = self.toColor().resolve(in: .init())
        let color2 = lchColor.toColor().resolve(in: .init())
        
        let luminance1 = relativeLuminance(red: Double(color1.red), green: Double(color1.green), blue: Double(color1.blue))
        let luminance2 = relativeLuminance(red: Double(color2.red), green: Double(color2.green), blue: Double(color2.blue))
        
        let lighter = max(luminance1, luminance2) + 0.05
        let darker = min(luminance1, luminance2) + 0.05
        
        return lighter / darker
    }
    
    // Function to calculate relative luminance
    func relativeLuminance(red: Double, green: Double, blue: Double) -> Double {
        func adjust(_ component: Double) -> Double {
            return component <= 0.03928 ? component / 12.92 : pow((component + 0.055) / 1.055, 2.4)
        }
        
        let r = adjust(red)
        let g = adjust(green)
        let b = adjust(blue)
        
        return 0.2126 * r + 0.7152 * g + 0.0722 * b
    }
}
