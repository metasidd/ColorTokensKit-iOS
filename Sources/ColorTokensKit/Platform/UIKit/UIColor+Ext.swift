//
//  UIColor+Ext.swift
//
//
//  Created by Siddhant Mehta on 2024-06-10.
//

#if canImport(UIKit)

    import Foundation
    import UIKit

    /// Extension to `UIColor` providing a method to convert `UIColor` to an `RGBColor`.
public extension UIColor {
    /**
     Converts the `UIColor` to an `RGBColor` representation.
     
     - Returns: An `RGBColor` object if the conversion is successful, or `nil` if the conversion fails.
     
     This method extracts the red, green, blue, and alpha components from the `UIColor` and initializes an `RGBColor` with those values.
     
     Example:
     ```swift
     let uiColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
     if let rgbColor = uiColor.rgbColor() {
     print(rgbColor) // Output: RGBColor(r: 0.5, g: 0.5, b: 0.5, alpha: 1.0)
     }
     ```
     */
    func rgbColor() -> RGBColor? {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var alpha: CGFloat = 0
        if getRed(&r, green: &g, blue: &b, alpha: &alpha) {
            return RGBColor(r: r, g: g, b: b, alpha: alpha)
        } else {
            return nil
        }
    }
    /**
     Initializes a `UIColor` with different colors for light and dark modes.
     
     - Parameters:
     - lightModeColor: The color to use in light mode.
     - darkModeColor: The color to use in dark mode.
     
     This initializer dynamically provides the appropriate color based on the current user interface style.
     */
    convenience init(
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

#endif
