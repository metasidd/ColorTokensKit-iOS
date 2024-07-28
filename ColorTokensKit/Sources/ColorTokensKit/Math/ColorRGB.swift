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
            var proRed: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0

            UIColor(color).getRed(&proRed, green: &green, blue: &blue, alpha: &alpha)
            self.r = proRed
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

    fileprivate func sRGBCompand(_ v: CGFloat) -> CGFloat {
        let absV = abs(v)
        let out = absV > 0.04045 ? pow((absV + 0.055) / 1.055, 2.4) : absV / 12.92
        return v > 0 ? out : -out
    }
}

public extension RGBColor {
    func toXYZ() -> XYZColor {
        let R = sRGBCompand(r)
        let G = sRGBCompand(g)
        let B = sRGBCompand(b)
        let x: CGFloat = (R * 0.4124564) + (G * 0.3575761) + (B * 0.1804375)
        let y: CGFloat = (R * 0.2126729) + (G * 0.7151522) + (B * 0.0721750)
        let z: CGFloat = (R * 0.0193339) + (G * 0.1191920) + (B * 0.9503041)
        return XYZColor(x: x, y: y, z: z, alpha: alpha)
    }
    
    func toLAB() -> LABColor {
        return toXYZ().toLAB()
    }
    
    func toLCH() -> LCHColor {
        return toXYZ().toLCH()
    }
    
    func color() -> UIColor {
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
    
    func lerp(_ other: RGBColor, t: CGFloat) -> RGBColor {
        return RGBColor(
            r: r + (other.r - r) * t,
            g: g + (other.g - g) * t,
            b: b + (other.b - b) * t,
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
}
