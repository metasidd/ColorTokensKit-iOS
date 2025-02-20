//
//  AppColors.swift
//
//
//  Created by Siddhant Mehta on 2024-06-10.
//

import SwiftUI
import ColorTokensKit

public extension Color {
    // TODO: Replace these with other dynamic names?
    static let allProHues: [String: LCHColor] = [
        "Gray": Color.gray,
        "Pink": Color.proPink,
        "Red": Color.proRed,
        "Tomato": Color.proTomato,
        "Orange": Color.proOrange,
        "Brown": Color.proBrown,
        "Gold": Color.proGold,
        "Yellow": Color.proYellow,
        "Lime": Color.proLime,
        "Olive": Color.proOlive,
        "Grass": Color.proGrass,
        "Green": Color.proGreen,
        "Mint": Color.proMint,
        "Cyan": Color.proCyan,
        "Teal": Color.proTeal,
        "Blue": Color.proBlue,
        "Sky": Color.proSky,
        "Indigo": Color.proIndigo,
        "Iris": Color.proIris,
        "Purple": Color.proPurple,
        "Violet": Color.proViolet,
        "Plum": Color.proPlum,
        "Ruby": Color.proRuby
    ]
    
    // Static colors
    static let gray = LCHColor(h: 0.0, variableChroma: false, variableHue: false)
    
    // Dynamic colors
    static let proPink = LCHColor(h: 0.0)
    static let proRed = LCHColor(h: 10.0)
    static let proTomato = LCHColor(h: 20.0)
    static let proOrange = LCHColor(h: 35)
    static let proBrown = LCHColor(h: 50)
    static let proGold = LCHColor(h: 70)
    static let proYellow = LCHColor(h: 85)
    static let proLime = LCHColor(h: 100.0)
    static let proOlive = LCHColor(h: 110.0)
    static let proGrass = LCHColor(h: 120.0)
    static let proGreen = LCHColor(h: 140.0)
    static let proMint = LCHColor(h: 160.0)
    static let proCyan = LCHColor(h: 180.0)
    static let proTeal = LCHColor(h: 190.0)
    static let proBlue = LCHColor(h: 210.0)
    static let proSky = LCHColor(h: 235.0)
    static let proIndigo = LCHColor(h: 270.0)
    static let proIris = LCHColor(h: 292.5)
    static let proPurple = LCHColor(h: 310.0)
    static let proViolet = LCHColor(h: 325.0)
    static let proPlum = LCHColor(h: 345.0)
    static let proRuby = LCHColor(h: 360.0)
}
