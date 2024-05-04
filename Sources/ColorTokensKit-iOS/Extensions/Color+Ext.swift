//
//  File.swift
//  
//
//  Created by Siddhant Mehta on 2023-12-18.
//

import SwiftUI


// Algorithm coming from: https://en.wikipedia.org/wiki/HSL_and_HSV#HSV_to_HSL
extension Color {
    /**
     - Parameter h: Range from 0 to 360.
     - Parameter s: Range from 0 to 1.
     - Parameter l: Range from 0 to 1.
     - Parameter a: Range from 0 to 1.
     */
    init(h hue: Double, s saturation: Double, l lightness: Double, a opacity: Double = 1) {
        let brightness = lightness + saturation * min(lightness, 1 - lightness)
        let saturation = brightness == 0 ? 0 : 2 * (1 - lightness / brightness)

        // Map to Color initializer.
        self.init(hue: hue / 360, saturation: saturation, brightness: brightness, opacity: opacity)
    }
}

#if canImport(UIKit)
extension UIColor {
    convenience public init(
        light lightModeColor: @escaping @autoclosure () -> UIColor,
        dark darkModeColor: @escaping @autoclosure () -> UIColor
    ) {
        self.init { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .light:
                return lightModeColor()
            case .dark:
                return darkModeColor()
            default:
                return lightModeColor()
            }
        }
    }
}

extension Color {
    public init(
        light lightModeColor: @escaping @autoclosure () -> Color,
        dark darkModeColor: @escaping @autoclosure () -> Color
    ) {
        self.init(UIColor(
            light: UIColor(lightModeColor()),
            dark: UIColor(darkModeColor())
        ))
    }
}
#endif
