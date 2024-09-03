//
//  File.swift
//  
//
//  Created by Siddhant Mehta on 2024-06-15.
//

import Foundation
import SwiftUI

public extension LCHColor {
    var allNormalColors: [Color] {
        return [ 
            _0, _5, _10, _15, _20, _25, _30, 
            _35, _40, _45, _50, _55, _60, _65,
            _70, _75, _80, _85, _90, _95, _100
        ]
    }
    
    var allPastelColors: [Color] {
        return [
            _0_pastel, _5_pastel, _10_pastel, _15_pastel, _20_pastel, _25_pastel, _30_pastel,
            _35_pastel, _40_pastel, _45_pastel, _50_pastel, _55_pastel, _60_pastel, _65_pastel,
            _70_pastel, _75_pastel, _80_pastel, _85_pastel, _90_pastel, _95_pastel, _100_pastel
        ]
    }
    
    var _0: Color { getColor(l: 100, c: 10) }
    var _5: Color { getColor(l: 95, c: 15) }
    var _10: Color { getColor(l: 90, c: 20) }
    var _15: Color { getColor(l: 85, c: 25) }
    var _20: Color { getColor(l: 80, c: 30) }
    var _25: Color { getColor(l: 75, c: 35) }
    var _30: Color { getColor(l: 70, c: 40) }
    var _35: Color { getColor(l: 65, c: 45) }
    var _40: Color { getColor(l: 60, c: 50) }
    var _45: Color { getColor(l: 55, c: 55) }
    var _50: Color { getColor(l: 50, c: 60) }
    var _55: Color { getColor(l: 45, c: 65) }
    var _60: Color { getColor(l: 40, c: 60) }
    var _65: Color { getColor(l: 35, c: 55) }
    var _70: Color { getColor(l: 30, c: 50) }
    var _75: Color { getColor(l: 25, c: 45) }
    var _80: Color { getColor(l: 20, c: 40) }
    var _85: Color { getColor(l: 15, c: 35) }
    var _90: Color { getColor(l: 10, c: 30) }
    var _95: Color { getColor(l: 5, c: 25) }
    var _100: Color { getColor(l: 0, c: 20) }

    // Pastel colors (desaturated)
    var _0_pastel: Color { getColor(l: 100, c: 12) }
    var _5_pastel: Color { getColor(l: 95, c: 14) }
    var _10_pastel: Color { getColor(l: 90, c: 16) }
    var _15_pastel: Color { getColor(l: 85, c: 18) }
    var _20_pastel: Color { getColor(l: 80, c: 20) }
    var _25_pastel: Color { getColor(l: 75, c: 22.5) }
    var _30_pastel: Color { getColor(l: 70, c: 25) }
    var _35_pastel: Color { getColor(l: 65, c: 28) }
    var _40_pastel: Color { getColor(l: 60, c: 31) }
    var _45_pastel: Color { getColor(l: 55, c: 34) }
    var _50_pastel: Color { getColor(l: 50, c: 37) }
    var _55_pastel: Color { getColor(l: 45, c: 40) }
    var _60_pastel: Color { getColor(l: 40, c: 42.5) }
    var _65_pastel: Color { getColor(l: 35, c: 45) }
    var _70_pastel: Color { getColor(l: 30, c: 48) }
    var _75_pastel: Color { getColor(l: 25, c: 43) }
    var _80_pastel: Color { getColor(l: 20, c: 40) }
    var _85_pastel: Color { getColor(l: 15, c: 35) }
    var _90_pastel: Color { getColor(l: 10, c: 30) }
    var _95_pastel: Color { getColor(l: 5, c: 25) }
    var _100_pastel: Color { getColor(l: 0, c: 20) }
}
