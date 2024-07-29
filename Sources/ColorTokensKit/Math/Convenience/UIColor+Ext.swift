//
//  UIColor+Ext.swift
//  
//
//  Created by Siddhant Mehta on 2024-06-10.
//

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
}
