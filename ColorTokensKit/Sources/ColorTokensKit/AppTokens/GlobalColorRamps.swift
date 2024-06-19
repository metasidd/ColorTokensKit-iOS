//
//  AppColors.swift
//
//
//  Created by Siddhant Mehta on 2024-06-10.
//

import SwiftUI

public extension Color {
    // TODO: Replace these with other dynamic names?
    static let allProColors: [String: OKLCHColor] = [
        "Gray": Color.gray,
        "Pink": Color.pink,
        "Red": Color.red,
        "Tomato": Color.tomato,
        "Orange": Color.orange,
        "Brown": Color.brown,
        "Gold": Color.gold,
        "Yellow": Color.yellow,
        "Lime": Color.lime,
        "Olive": Color.olive,
        "Grass": Color.grass,
        "Green": Color.green,
        "Mint": Color.mint,
        "Cyan": Color.cyan,
        "Teal": Color.teal,
        "Blue": Color.blue,
        "Sky": Color.sky,
        "Indigo": Color.indigo,
        "Iris": Color.iris,
        "Purple": Color.purple,
        "Violet": Color.violet,
        "Plum": Color.plum,
        "Ruby": Color.ruby
    ]
    
    // Static colors
    static let gray = OKLCHColor(h: 0.0, variableChroma: false, variableHue: false)
    
    // Dynamic colors
    static let pink = OKLCHColor(h: 0.0)
    static let red = OKLCHColor(h: 10.0)
    static let tomato = OKLCHColor(h: 20.0)
    static let orange = OKLCHColor(h: 30.0)
    static let brown = OKLCHColor(h: 45.0)
    static let gold = OKLCHColor(h: 70.0)
    static let yellow = OKLCHColor(h: 90.0)
    static let lime = OKLCHColor(h: 100.0)
    static let olive = OKLCHColor(h: 110.0)
    static let grass = OKLCHColor(h: 120.0)
    static let green = OKLCHColor(h: 140.0)
    static let mint = OKLCHColor(h: 160.0)
    static let cyan = OKLCHColor(h: 180.0)
    static let teal = OKLCHColor(h: 190.0)
    static let blue = OKLCHColor(h: 210.0)
    static let sky = OKLCHColor(h: 230.0)
    static let indigo = OKLCHColor(h: 260.0)
    static let iris = OKLCHColor(h: 295.0)
    static let purple = OKLCHColor(h: 310.0)
    static let violet = OKLCHColor(h: 320.0)
    static let plum = OKLCHColor(h: 345.0)
    static let ruby = OKLCHColor(h: 360.0)
}
