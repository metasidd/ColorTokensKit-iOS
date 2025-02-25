//
//  Color+Dynamic.swift
//  ColorTokensKit
//

import SwiftUI

#if canImport(AppKit)
import AppKit
typealias CTKColor = NSColor

#elseif canImport(UIKit)
import UIKit
typealias CTKColor = UIColor

#endif

public extension Color {
    /// Initialize with light/dark mode colors for iOS
    init(
        light lightModeColor: @escaping @autoclosure () -> Color,
        dark darkModeColor: @escaping @autoclosure () -> Color
    ) {
        self.init(CTKColor(
            light: CTKColor(lightModeColor()),
            dark: CTKColor(darkModeColor())
        ))
    }

    /// Initialize with light/dark mode LCH colors for iOS
    init(
        light lightModeColor: @escaping @autoclosure () -> LCHColor,
        dark darkModeColor: @escaping @autoclosure () -> LCHColor
    ) {
        self.init(CTKColor(
            light: CTKColor(lightModeColor().toColor()),
            dark: CTKColor(darkModeColor().toColor())
        ))
    }
}
