//
//  Color+Dynamic.swift
//  ColorTokensKit
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

public extension Color {

#if canImport(UIKit)
    /// Initialize with light/dark mode colors for iOS
    init(
        light lightModeColor: @escaping @autoclosure () -> Color,
        dark darkModeColor: @escaping @autoclosure () -> Color
    ) {
        self.init(UIColor(
            light: UIColor(lightModeColor()),
            dark: UIColor(darkModeColor())
        ))
    }

    /// Initialize with light/dark mode LCH colors for iOS
    init(
        light lightModeColor: @escaping @autoclosure () -> LCHColor,
        dark darkModeColor: @escaping @autoclosure () -> LCHColor
    ) {
        self.init(UIColor(
            light: UIColor(lightModeColor().toColor()),
            dark: UIColor(darkModeColor().toColor())
        ))
    }
#endif
        
}
