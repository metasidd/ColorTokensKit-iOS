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
    var _0: Color {
        Color(
            light: LCHColor(l: 100, c: 10, h: self.h).toColor(),
            dark: LCHColor(l: 0, c: 10, h: self.h).toColor())
    }

    var _5: Color {
        Color(
            light: LCHColor(l: 95, c: 10, h: self.h).toColor(),
            dark: LCHColor(l: 5, c: 5, h: self.h).toColor())
    }

    var _10: Color {
        Color(
            light: LCHColor(l: 90, c: 20, h: self.h).toColor(),
            dark: LCHColor(l: 10, c: 10, h: self.h).toColor())
    }

    var _15: Color {
        Color(
            light: LCHColor(l: 85, c: 30, h: self.h).toColor(),
            dark: LCHColor(l: 15, c: 15, h: self.h).toColor())
    }

    var _20: Color {
        Color(
            light: LCHColor(l: 80, c: 30, h: self.h).toColor(),
            dark: LCHColor(l: 20, c: 20, h: self.h).toColor())
    }

    var _25: Color {
        Color(
            light: LCHColor(l: 75, c: 30, h: self.h).toColor(),
            dark: LCHColor(l: 25, c: 35, h: self.h).toColor())
    }

    var _30: Color {
        Color(
            light: LCHColor(l: 70, c: 30, h: self.h).toColor(),
            dark: LCHColor(l: 30, c: 40, h: self.h).toColor())
    }

    var _35: Color {
        Color(
            light: LCHColor(l: 65, c: 30, h: self.h).toColor(),
            dark: LCHColor(l: 35, c: 40, h: self.h).toColor())
    }

    var _40: Color {
        Color(
            light: LCHColor(l: 60, c: 30, h: self.h).toColor(),
            dark: LCHColor(l: 40, c: 40, h: self.h).toColor())
    }

    var _45: Color {
        Color(
            light: LCHColor(l: 55, c: 30, h: self.h).toColor(),
            dark: LCHColor(l: 45, c: 40, h: self.h).toColor())
    }

    var _50: Color {
        Color(
            light: LCHColor(l: 50, c: 30, h: self.h).toColor(),
            dark: LCHColor(l: 50, c: 40, h: self.h).toColor())
    }

    var _55: Color {
        Color(
            light: LCHColor(l: 45, c: 35, h: self.h).toColor(),
            dark: LCHColor(l: 52, c: 40, h: self.h).toColor())
    }

    var _60: Color {
        Color(
            light: LCHColor(l: 40, c: 50, h: self.h).toColor(),
            dark: LCHColor(l: 55, c: 40, h: self.h).toColor())
    }

    var _65: Color {
        Color(
            light: LCHColor(l: 35, c: 45, h: self.h).toColor(),
            dark: LCHColor(l: 58, c: 40, h: self.h).toColor())
    }

    var _70: Color {
        Color(
            light: LCHColor(l: 30, c: 50, h: self.h).toColor(),
            dark: LCHColor(l: 60, c: 40, h: self.h).toColor())
    }

    var _75: Color {
        Color(
            light: LCHColor(l: 25, c: 55, h: self.h).toColor(),
            dark: LCHColor(l: 63, c: 40, h: self.h).toColor())
    }

    var _80: Color {
        Color(
            light: LCHColor(l: 20, c: 60, h: self.h).toColor(),
            dark: LCHColor(l: 65, c: 40, h: self.h).toColor())
    }

    var _85: Color {
        Color(
            light: LCHColor(l: 15, c: 75, h: self.h).toColor(),
            dark: LCHColor(l: 67, c: 45, h: self.h).toColor())
    }

    var _90: Color {
        Color(
            light: LCHColor(l: 10, c: 80, h: self.h).toColor(),
            dark: LCHColor(l: 70, c: 50, h: self.h).toColor())
    }

    var _95: Color {
        Color(
            light: LCHColor(l: 5, c: 85, h: self.h).toColor(),
            dark: LCHColor(l: 75, c: 50, h: self.h).toColor())
    }

    var _100: Color {
        Color(
            light: LCHColor(l: 0, c: 90, h: self.h).toColor(),
            dark: LCHColor(l: 80, c: 60, h: self.h).toColor())
    }
}
