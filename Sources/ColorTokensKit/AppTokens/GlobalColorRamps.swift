//
//  AppColors.swift
//
//
//  Created by Siddhant Mehta on 2024-06-10.
//

import SwiftUI

public extension Color {
    // TODO: Replace these with other dynamic names?
    static let allProColors: [String: LCHColor] = [
        "gray": Color.gray,
        "pink": Color.pink,
        "red": Color.red,
        "tomato": Color.tomato,
        "orange": Color.orange,
        "bronze": Color.bronze,
        "brown": Color.brown,
        "amber": Color.amber,
        "gold": Color.gold,
        "yellow": Color.yellow,
        "lime": Color.lime,
        "olive": Color.olive,
        "grass": Color.grass,
        "green": Color.green,
        "mint": Color.mint,
        "cyan": Color.cyan,
        "teal": Color.teal,
        "blue": Color.blue,
        "sky": Color.sky,
        "indigo": Color.indigo,
        "iris": Color.iris,
        "purple": Color.purple,
        "violet": Color.violet,
        "plum": Color.plum,
        "ruby": Color.ruby
    ]
    
    // Static colors
    static let gray = LCHColor(h: 0.0, variableChroma: false)
    
    // Dynamic colors
    static let pink = LCHColor(h: 0.0)
    static let red = LCHColor(h: 10.0)
    static let tomato = LCHColor(h: 20.0)
    static let orange = LCHColor(h: 30.0)
    static let bronze = LCHColor(h: 50.0)
    static let brown = LCHColor(h: 40.0)
    static let amber = LCHColor(h: 45.0)
    static let gold = LCHColor(h: 70.0)
    static let yellow = LCHColor(h: 90.0)
    static let lime = LCHColor(h: 100.0)
    static let olive = LCHColor(h: 110.0)
    static let grass = LCHColor(h: 120.0)
    static let green = LCHColor(h: 140.0)
    static let mint = LCHColor(h: 160.0)
    static let cyan = LCHColor(h: 180.0)
    static let teal = LCHColor(h: 190.0)
    static let blue = LCHColor(h: 210.0)
    static let sky = LCHColor(h: 230.0)
    static let indigo = LCHColor(h: 260.0)
    static let iris = LCHColor(h: 280.0)
    static let purple = LCHColor(h: 310.0)
    static let violet = LCHColor(h: 320.0)
    static let plum = LCHColor(h: 345.0)
    static let ruby = LCHColor(h: 360.0)
}
