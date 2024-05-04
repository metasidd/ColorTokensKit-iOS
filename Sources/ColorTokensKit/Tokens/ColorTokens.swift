//
//  ColorTokens.swift
//
//  Created by Siddhant Mehta on 2022-12-20.
//

import Foundation
import SwiftUI

public class ColorTokens {
    
    /// Default color tokens for any app
    public class Default {
        public static var foreground: Color {
            Palettes.slate._12
        }
        public static var foreground_secondary: Color {
            Palettes.slate._11
        }
        public static var foreground_tertiary: Color {
            Palettes.slate._10
        }
        
        public static var invertedForeground: Color {
            Palettes.slate._1
        }
        public static var invertedForeground_secondary: Color {
            Palettes.slate._2
        }
        public static var invertedForeground_tertiary: Color {
            Palettes.slate._3
        }
        
        public static var backgroundPrimary: Color {
            Color(light: .white, dark: .black)
        }
        
        public static var backgroundSecondary: Color {
            Palettes.slate._2
        }
        public static var backgroundTertiary: Color {
            Palettes.slate._3
        }
        
        public static var outline: Color {
            Palettes.slate._7
        }
        public static var outline_secondary: Color {
            Palettes.slate._6
        }
        public static var outline_tertiary: Color {
            Palettes.slate._4
        }
        
        public static var negative: PaletteColor {
            Palettes.ruby()
        }
        public static var positive: PaletteColor {
            Palettes.green()
        }
    }
}
