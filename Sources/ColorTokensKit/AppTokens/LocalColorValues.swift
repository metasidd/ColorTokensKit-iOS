//
//  File.swift
//  
//
//  Created by Siddhant Mehta on 2024-06-15.
//

import Foundation
import SwiftUI

public extension LCHColor {
    var allCases: [Color] {
        let instance = LCHColor(
            l: self.getLightness(),
            c: self.getChroma(),
            h: self.getHue(),
            alpha: 1
        )
        return [
            instance._0,
            instance._5,
            instance._10,
            instance._15,
            instance._20,
            instance._25,
            instance._30,
            instance._35,
            instance._40,
            instance._45,
            instance._50,
            instance._55,
            instance._60,
            instance._65,
            instance._70,
            instance._75,
            instance._80,
            instance._85,
            instance._90,
            instance._95,
            instance._100
        ]
    }
    
    // Lightest to darkest
    var _0: Color { getResponsiveColor(lightness: 100, chroma: 0) }
    var _5: Color { getResponsiveColor(lightness: 95, chroma: 5) }
    var _10: Color { getResponsiveColor(lightness: 90, chroma: 10) }
    var _15: Color { getResponsiveColor(lightness: 85, chroma: 15) }
    var _20: Color { getResponsiveColor(lightness: 80, chroma: 20) }
    var _25: Color { getResponsiveColor(lightness: 75, chroma: 25) }
    var _30: Color { getResponsiveColor(lightness: 70, chroma: 30) }
    var _35: Color { getResponsiveColor(lightness: 65, chroma: 35) }
    var _40: Color { getResponsiveColor(lightness: 60, chroma: 40) }
    var _45: Color { getResponsiveColor(lightness: 55, chroma: 45) }
    var _50: Color { getResponsiveColor(lightness: 50, chroma: 50) }
    var _55: Color { getResponsiveColor(lightness: 45, chroma: 55) }
    var _60: Color { getResponsiveColor(lightness: 40, chroma: 60) }
    var _65: Color { getResponsiveColor(lightness: 35, chroma: 65) }
    var _70: Color { getResponsiveColor(lightness: 30, chroma: 70) }
    var _75: Color { getResponsiveColor(lightness: 25, chroma: 75) }
    var _80: Color { getResponsiveColor(lightness: 20, chroma: 80) }
    var _85: Color { getResponsiveColor(lightness: 15, chroma: 85) }
    var _90: Color { getResponsiveColor(lightness: 10, chroma: 90) }
    var _95: Color { getResponsiveColor(lightness: 5, chroma: 95) }
    var _100: Color { getResponsiveColor(lightness: 0, chroma: 100) }
}
