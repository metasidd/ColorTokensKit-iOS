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
            instance._10,
            instance._20,
            instance._30,
            instance._40,
            instance._50,
            instance._60,
            instance._70,
            instance._80,
            instance._90,
            instance._100,
            instance._110,
            instance._120,
            instance._130,
            instance._140,
            instance._150,
            instance._160
        ]
    }
    
    // Lightest to darkest
    var _10: Color { getResponsiveColor(lightness: 100, chroma: 0) }
    var _20: Color { getResponsiveColor(lightness: 93, chroma: 7) }
    var _30: Color { getResponsiveColor(lightness: 86, chroma: 14) }
    var _40: Color { getResponsiveColor(lightness: 80, chroma: 20) }
    var _50: Color { getResponsiveColor(lightness: 73, chroma: 26) }
    var _60: Color { getResponsiveColor(lightness: 66, chroma: 32) }
    var _70: Color { getResponsiveColor(lightness: 60, chroma: 38) }
    var _80: Color { getResponsiveColor(lightness: 53, chroma: 44) }
    var _90: Color { getResponsiveColor(lightness: 46, chroma: 50) }
    var _100: Color { getResponsiveColor(lightness: 40, chroma: 56) }
    var _110: Color { getResponsiveColor(lightness: 34, chroma: 62) }
    var _120: Color { getResponsiveColor(lightness: 28, chroma: 68) }
    var _130: Color { getResponsiveColor(lightness: 22, chroma: 74) }
    var _140: Color { getResponsiveColor(lightness: 16, chroma: 80) }
    var _150: Color { getResponsiveColor(lightness: 10, chroma: 88) }
    var _160: Color { getResponsiveColor(lightness: 4, chroma: 96) }
}
