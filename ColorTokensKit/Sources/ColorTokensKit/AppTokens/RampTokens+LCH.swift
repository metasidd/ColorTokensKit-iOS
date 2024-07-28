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
    
    var allPastelColors: [Color] {
        return [
            _0_pastel, _5_pastel, _10_pastel, _15_pastel, _20_pastel, _25_pastel, _30_pastel,
            _35_pastel, _40_pastel, _45_pastel, _50_pastel, _55_pastel, _60_pastel, _65_pastel,
            _70_pastel, _75_pastel, _80_pastel, _85_pastel, _90_pastel, _95_pastel, _100_pastel
        ]
    }
    
    var _0: Color { LCHColor(l: 100, c: 10, h: self.h).toColor() }
    var _5: Color { LCHColor(l: 95, c: 15, h: self.h).toColor() }
    var _10: Color { LCHColor(l: 90, c: 20, h: self.h).toColor() }
    var _15: Color { LCHColor(l: 85, c: 25, h: self.h).toColor() }
    var _20: Color { LCHColor(l: 80, c: 30, h: self.h).toColor() }
    var _25: Color { LCHColor(l: 75, c: 32, h: self.h).toColor() }
    var _30: Color { LCHColor(l: 70, c: 30, h: self.h).toColor() }
    var _35: Color { LCHColor(l: 65, c: 30, h: self.h).toColor() }
    var _40: Color { LCHColor(l: 60, c: 30, h: self.h).toColor() }
    var _45: Color { LCHColor(l: 55, c: 30, h: self.h).toColor() }
    var _50: Color { LCHColor(l: 50, c: 30, h: self.h).toColor() }
    var _55: Color { LCHColor(l: 45, c: 35, h: self.h).toColor() }
    var _60: Color { LCHColor(l: 40, c: 40, h: self.h).toColor() }
    var _65: Color { LCHColor(l: 35, c: 45, h: self.h).toColor() }
    var _70: Color { LCHColor(l: 30, c: 50, h: self.h).toColor() }
    var _75: Color { LCHColor(l: 25, c: 55, h: self.h).toColor() }
    var _80: Color { LCHColor(l: 20, c: 60, h: self.h).toColor() }
    var _85: Color { LCHColor(l: 15, c: 75, h: self.h).toColor() }
    var _90: Color { LCHColor(l: 10, c: 80, h: self.h).toColor() }
    var _95: Color { LCHColor(l: 5, c: 85, h: self.h).toColor() }
    var _100: Color { LCHColor(l: 0, c: 90, h: self.h).toColor() }

    // Pastel colors (desaturated)
    var _0_pastel: Color { LCHColor(l: 100, c: 10, h: self.h).toColor() }
    var _5_pastel: Color { LCHColor(l: 95, c: 12, h: self.h).toColor() }
    var _10_pastel: Color { LCHColor(l: 90, c: 14, h: self.h).toColor() }
    var _15_pastel: Color { LCHColor(l: 85, c: 16, h: self.h).toColor() }
    var _20_pastel: Color { LCHColor(l: 80, c: 18, h: self.h).toColor() }
    var _25_pastel: Color { LCHColor(l: 75, c: 20, h: self.h).toColor() }
    var _30_pastel: Color { LCHColor(l: 70, c: 22, h: self.h).toColor() }
    var _35_pastel: Color { LCHColor(l: 65, c: 25, h: self.h).toColor() }
    var _40_pastel: Color { LCHColor(l: 60, c: 28, h: self.h).toColor() }
    var _45_pastel: Color { LCHColor(l: 55, c: 31, h: self.h).toColor() }
    var _50_pastel: Color { LCHColor(l: 50, c: 34, h: self.h).toColor() }
    var _55_pastel: Color { LCHColor(l: 45, c: 37, h: self.h).toColor() }
    var _60_pastel: Color { LCHColor(l: 40, c: 40, h: self.h).toColor() }
    var _65_pastel: Color { LCHColor(l: 35, c: 42, h: self.h).toColor() }
    var _70_pastel: Color { LCHColor(l: 30, c: 45, h: self.h).toColor() }
    var _75_pastel: Color { LCHColor(l: 25, c: 47, h: self.h).toColor() }
    var _80_pastel: Color { LCHColor(l: 20, c: 50, h: self.h).toColor() }
    var _85_pastel: Color { LCHColor(l: 15, c: 52, h: self.h).toColor() }
    var _90_pastel: Color { LCHColor(l: 10, c: 55, h: self.h).toColor() }
    var _95_pastel: Color { LCHColor(l: 5, c: 57, h: self.h).toColor() }
    var _100_pastel: Color { LCHColor(l: 0, c: 60, h: self.h).toColor() }
}
