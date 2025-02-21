//
//  LCH+ColorStops.swift
//  ColorTokensKit
//
//  Created by Siddhant Mehta on 2025-02-21.
//

extension LCHColor {
    public var allStops: [LCHColor] {
        [
        _50, _100, _150, _200, _250, _300, _350, _400, _450, _500, _550, _600, _650, _700, _750, _800, _850, _900, _950, _1000
        ]
    }
    
    public var _50: LCHColor { getColor(at: 0) }
    public var _100: LCHColor { getColor(at: 1) }
    public var _150: LCHColor { getColor(at: 2) }
    public var _200: LCHColor { getColor(at: 3) }
    public var _250: LCHColor { getColor(at: 4) }
    public var _300: LCHColor { getColor(at: 5) }
    public var _350: LCHColor { getColor(at: 6) }
    public var _400: LCHColor { getColor(at: 7) }
    public var _450: LCHColor { getColor(at: 8) }
    public var _500: LCHColor { getColor(at: 9) }
    public var _550: LCHColor { getColor(at: 10) }
    public var _600: LCHColor { getColor(at: 11) }
    public var _650: LCHColor { getColor(at: 12) }
    public var _700: LCHColor { getColor(at: 13) }
    public var _750: LCHColor { getColor(at: 14) }
    public var _800: LCHColor { getColor(at: 15) }
    public var _850: LCHColor { getColor(at: 16) }
    public var _900: LCHColor { getColor(at: 17) }
    public var _950: LCHColor { getColor(at: 18) }
    public var _1000: LCHColor { getColor(at: 19) }
}
