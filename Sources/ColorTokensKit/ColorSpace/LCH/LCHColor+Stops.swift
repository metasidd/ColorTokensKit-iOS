//
//  LCHColor+Stops.swift
//  ColorTokensKit
//
//  Created by Siddhant Mehta on 2025-02-21.
//

public extension LCHColor {
    var allStops: [LCHColor] {
        [
            _50, _100, _150, _200, _250, _300, _350, _400, _450, _500, _550, _600, _650, _700, _750, _800, _850, _900, _950, _1000,
        ]
    }

    var _50: LCHColor { getColor(at: 0) }
    var _100: LCHColor { getColor(at: 1) }
    var _150: LCHColor { getColor(at: 2) }
    var _200: LCHColor { getColor(at: 3) }
    var _250: LCHColor { getColor(at: 4) }
    var _300: LCHColor { getColor(at: 5) }
    var _350: LCHColor { getColor(at: 6) }
    var _400: LCHColor { getColor(at: 7) }
    var _450: LCHColor { getColor(at: 8) }
    var _500: LCHColor { getColor(at: 9) }
    var _550: LCHColor { getColor(at: 10) }
    var _600: LCHColor { getColor(at: 11) }
    var _650: LCHColor { getColor(at: 12) }
    var _700: LCHColor { getColor(at: 13) }
    var _750: LCHColor { getColor(at: 14) }
    var _800: LCHColor { getColor(at: 15) }
    var _850: LCHColor { getColor(at: 16) }
    var _900: LCHColor { getColor(at: 17) }
    var _950: LCHColor { getColor(at: 18) }
    var _1000: LCHColor { getColor(at: 19) }
}
