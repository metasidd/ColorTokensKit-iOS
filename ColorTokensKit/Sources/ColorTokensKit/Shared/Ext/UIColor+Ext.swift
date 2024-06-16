//
//  UIColor+Ext.swift
//  
//
//  Created by Siddhant Mehta on 2024-06-10.
//

import Foundation
import UIKit

public extension UIColor {
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
