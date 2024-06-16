//
//  ColorSpaces+Ext.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-08.
//

import Foundation
import SwiftUI
import ColorTokensKit

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
