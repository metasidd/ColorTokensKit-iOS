//
//  File.swift
//  
//
//  Created by Siddhant Mehta on 2024-06-10.
//

import Foundation
import SwiftUI

public typealias DynamicColor = LCHColor

public extension LCHColor {
    // Foreground colors
    var foregroundPrimary: Color { getTraitAdjustedColor(l: 0, c: 20) }
    var foregroundSecondary: Color { getTraitAdjustedColor(l: 15, c: 25) }
    var foregroundTertiary: Color { getTraitAdjustedColor(l: 35, c: 30) }
    
    // Inverted foreground colors
    var invertedForegroundPrimary: Color { getTraitAdjustedColor(l: 95, c: 10) }
    var invertedForegroundSecondary: Color { getTraitAdjustedColor(l: 85, c: 20) }
    var invertedForegroundTertiary: Color { getTraitAdjustedColor(l: 75, c: 30) }
    
    // Backgroundcolors
    var backgroundPrimary: Color { getTraitAdjustedColor(l: 95, c: 5) }
    var backgroundSecondary: Color { getTraitAdjustedColor(l: 90, c: 10) }
    var backgroundTertiary: Color { getTraitAdjustedColor(l: 85, c: 15) }
    
    // Inverted background colors
    var invertedBackgroundPrimary: Color { getTraitAdjustedColor(l: 30, c: 70) }
    var invertedBackgroundSecondary: Color { getTraitAdjustedColor(l: 40, c: 65) }
    var invertedBackgroundTertiary: Color { getTraitAdjustedColor(l: 45, c: 60) }
    
    // Outline colors
    var outlinePrimary: Color { getTraitAdjustedColor(l: 70, c: 30) }
    var outlineSecondary: Color { getTraitAdjustedColor(l: 80, c: 20) }
    var outlineTertiary: Color { getTraitAdjustedColor(l: 90, c: 10) }
}
