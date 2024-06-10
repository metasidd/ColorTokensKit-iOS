//
//  File.swift
//  
//
//  Created by Siddhant Mehta on 2024-06-10.
//

import Foundation
import SwiftUI

extension LCHColor {
    var foregroundPrimary: Color { tokenColor(for: .foregroundPrimary) }
    var foregroundSecondary: Color { tokenColor(for: .foregroundSecondary) }
    var foregroundTertiary: Color { tokenColor(for: .foregroundTertiary) }
    
    var invertedForegroundPrimary: Color { tokenColor(for: .invertedForegroundPrimary) }
    var invertedForegroundSecondary: Color { tokenColor(for: .invertedForegroundSecondary) }
    var invertedForegroundTertiary: Color { tokenColor(for: .invertedForegroundTertiary) }
    
    var backgroundPrimary: Color { tokenColor(for: .backgroundPrimary) }
    var backgroundSecondary: Color { tokenColor(for: .backgroundSecondary) }
    var backgroundTertiary: Color { tokenColor(for: .backgroundTertiary) }
    
    var invertedBackgroundPrimary: Color { tokenColor(for: .invertedBackgroundPrimary) }
    var invertedBackgroundSecondary: Color { tokenColor(for: .invertedBackgroundSecondary) }
    var invertedBackgroundTertiary: Color { tokenColor(for: .invertedBackgroundTertiary) }
    
    var outlinePrimary: Color { tokenColor(for: .outlinePrimary) }
    var outlineSecondary: Color { tokenColor(for: .outlineSecondary) }
    var outlineTertiary: Color { tokenColor(for: .outlineTertiary) }
    
    
    // Extend LCHColor with token properties
    private func tokenColor(for token: LCHColorTokens) -> Color {
        let adjustedHue = UIScreen.main.traitCollection.userInterfaceStyle == .dark ? (self.getHue() * 0.75).truncatingRemainder(dividingBy: 360) : self.getHue()
        let lchColor = LCHColor(
            l: token.lightness,
            c: self.getVariableChroma() ? token.chroma : 0,
            h: adjustedHue,
            alpha: token.alpha
        )
        return lchColor.toColor()
    }
}

enum LCHColorTokens: String, CaseIterable {
    // Foreground
    case foregroundPrimary = "Foreground Primary"
    case foregroundSecondary = "Foreground Secondary"
    case foregroundTertiary = "Foreground Tertiary"
    
    // Inverted Foreground
    case invertedForegroundPrimary = "Inv Foreground Primary"
    case invertedForegroundSecondary = "Inv Foreground Secondary"
    case invertedForegroundTertiary = "Inv Foreground Tertiary"
    
    // Background
    case backgroundPrimary = "Background Primary"
    case backgroundSecondary = "Background Secondary"
    case backgroundTertiary = "Background Tertiary"
    
    // Inverted Background
    case invertedBackgroundPrimary = "Inv Background Primary"
    case invertedBackgroundSecondary = "Inv Background Secondary"
    case invertedBackgroundTertiary = "Inv Background Tertiary"
    
    // Outline
    case outlinePrimary = "Outline Primary"
    case outlineSecondary = "Outline Secondary"
    case outlineTertiary = "Outline Tertiary"
    
    var lightness: CGFloat {
        switch self {
        case .foregroundPrimary: return 0
        case .foregroundSecondary: return 15
        case .foregroundTertiary: return 35
            
        case .invertedForegroundPrimary: return 95
        case .invertedForegroundSecondary: return 85
        case .invertedForegroundTertiary: return 75
            
        case .backgroundPrimary: return 95
        case .backgroundSecondary: return 90
        case .backgroundTertiary: return 85
            
        case .invertedBackgroundPrimary: return 30
        case .invertedBackgroundSecondary: return 40
        case .invertedBackgroundTertiary: return 45
            
        case .outlinePrimary: return 70
        case .outlineSecondary: return 80
        case .outlineTertiary: return 90
        }
    }
    
    var chroma: CGFloat {
        switch self {
        case .foregroundPrimary: return 20
        case .foregroundSecondary: return 25
        case .foregroundTertiary: return 30
            
        case .invertedForegroundPrimary: return 10
        case .invertedForegroundSecondary: return 20
        case .invertedForegroundTertiary: return 30
            
        case .backgroundPrimary: return 5
        case .backgroundSecondary: return 10
        case .backgroundTertiary: return 15
            
        case .invertedBackgroundPrimary: return 70
        case .invertedBackgroundSecondary: return 65
        case .invertedBackgroundTertiary: return 60
            
        case .outlinePrimary: return 30
        case .outlineSecondary: return 20
        case .outlineTertiary: return 10
        }
    }
    
    var alpha: CGFloat {
        return 1.0
    }
}
