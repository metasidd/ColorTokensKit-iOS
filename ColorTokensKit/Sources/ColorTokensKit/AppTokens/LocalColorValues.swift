//
//  File.swift
//  
//
//  Created by Siddhant Mehta on 2024-06-15.
//

import Foundation
import SwiftUI

public extension OKLCHColor {
    var allCases: [Color] {
        return [
            self._0,
            self._5,
            self._10,
            self._15,
            self._20,
            self._25,
            self._30,
            self._35,
            self._40,
            self._45,
            self._50,
            self._55,
            self._60,
            self._65,
            self._70,
            self._75,
            self._80,
            self._85,
            self._90,
            self._95,
            self._100
        ]
    }
    
    // Lightest to darkest
    var _0: Color { getResponsiveColor(lightness: 1, chroma: 0.01) }
    var _5: Color { getResponsiveColor(lightness: 0.95, chroma: 0.05) }
    var _10: Color { getResponsiveColor(lightness: 0.90, chroma: 0.10) }
    var _15: Color { getResponsiveColor(lightness: 0.85, chroma: 0.15) }
    var _20: Color { getResponsiveColor(lightness: 0.80, chroma: 0.20) }
    var _25: Color { getResponsiveColor(lightness: 0.75, chroma: 0.25) }
    var _30: Color { getResponsiveColor(lightness: 0.70, chroma: 0.30) }
    var _35: Color { getResponsiveColor(lightness: 0.65, chroma: 0.35) }
    var _40: Color { getResponsiveColor(lightness: 0.60, chroma: 0.40) }
    var _45: Color { getResponsiveColor(lightness: 0.55, chroma: 0.45) }
    var _50: Color { getResponsiveColor(lightness: 0.50, chroma: 0.50) }
    var _55: Color { getResponsiveColor(lightness: 0.45, chroma: 0.55) }
    var _60: Color { getResponsiveColor(lightness: 0.40, chroma: 0.60) }
    var _65: Color { getResponsiveColor(lightness: 0.35, chroma: 0.65) }
    var _70: Color { getResponsiveColor(lightness: 0.30, chroma: 0.70) }
    var _75: Color { getResponsiveColor(lightness: 0.25, chroma: 0.75) }
    var _80: Color { getResponsiveColor(lightness: 0.20, chroma: 0.80) }
    var _85: Color { getResponsiveColor(lightness: 0.15, chroma: 0.85) }
    var _90: Color { getResponsiveColor(lightness: 0.10, chroma: 0.90) }
    var _95: Color { getResponsiveColor(lightness: 0.05, chroma: 0.95) }
    var _100: Color { getResponsiveColor(lightness: 0.0, chroma: 1.0) }
}
