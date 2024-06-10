//
//  ColorTokens.swift
//
//  Created by Siddhant Mehta on 2022-12-20.
//

import Foundation
import SwiftUI

extension Color {
    public static var foregroundPrimary: Color {
        AppColors.gray.foregroundPrimary
    }
    public static var foregroundSecondary: Color {
        AppColors.gray.foregroundSecondary
    }
    public static var foregroundTertiary: Color {
        AppColors.gray.foregroundTertiary
    }
    
    public static var invertedForeground: Color {
        AppColors.gray.invertedForegroundPrimary
    }
    public static var invertedForegroundSecondary: Color {
        AppColors.gray.invertedForegroundSecondary
    }
    public static var invertedForegroundTertiary: Color {
        AppColors.gray.invertedForegroundTertiary
    }
    
    public static var backgroundPrimary: Color {
        Color(light: .white, dark: .black) // Pure black and white
    }
    public static var backgroundSecondary: Color {
        AppColors.gray.backgroundSecondary
    }
    public static var backgroundTertiary: Color {
        AppColors.gray.backgroundTertiary
    }
    
    public static var outlinePrimary: Color {
        AppColors.gray.outlinePrimary
    }
    public static var outlineSecondary: Color {
        AppColors.gray.outlineSecondary
    }
    public static var outlineTertiary: Color {
        AppColors.gray.outlineTertiary
    }
}
