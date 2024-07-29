//
//  ColorRGB.swift
//  
//
//  Original repo: https://github.com/timrwood/ColorSpaces
//

import Foundation
import SwiftUI

public struct RGBColor: Hashable {
    public let r: CGFloat     // 0..1
    public let g: CGFloat     // 0..1
    public let b: CGFloat     // 0..1
    public let alpha: CGFloat // 0..1
    
    public init (r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
        self.r = r
        self.g = g
        self.b = b
        self.alpha = alpha
    }
    
    public init(color: Color) {
        if #available(iOS 17.0, *) {
            let resolvedColor = color.resolve(in: .init())
            self.r = CGFloat(resolvedColor.red)
            self.g = CGFloat(resolvedColor.green)
            self.b = CGFloat(resolvedColor.blue)
            self.alpha = CGFloat(resolvedColor.cgColor.alpha)
        } else {
            #if canImport(UIKit)
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0

            UIColor(color).getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            self.r = red
            self.g = green
            self.b = blue
            self.alpha = alpha
            #elseif canImport(AppKit)
            guard let convertedColor = NSColor(color).usingColorSpace(.deviceRGB) else {
                self.r = 0
                self.g = 0
                self.b = 0
                self.alpha = 1
                return
            }
            self.r = convertedColor.redComponent
            self.g = convertedColor.greenComponent
            self.b = convertedColor.blueComponent
            self.alpha = convertedColor.alphaComponent
            #else
            self.r = 0
            self.g = 0
            self.b = 0
            self.alpha = 1
            #endif
        }
    }

    func sRGBCompand(_ v: CGFloat) -> CGFloat {
        let absV = abs(v)
        let out = absV > 0.04045 ? pow((absV + 0.055) / 1.055, 2.4) : absV / 12.92
        return v > 0 ? out : -out
    }
}
