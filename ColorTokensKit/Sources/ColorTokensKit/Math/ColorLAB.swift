//
//  LABColor.swift
//
//
//  Original repo: https://github.com/timrwood/ColorSpaces
//

import Foundation

public struct LABColor: Hashable {
    public let l: CGFloat     //    0..100
    public let a: CGFloat     // -128..128
    public let b: CGFloat     // -128..128
    public let alpha: CGFloat //    0..1
    
    public init (l: CGFloat, a: CGFloat, b: CGFloat, alpha: CGFloat) {
        self.l = l
        self.a = a
        self.b = b
        self.alpha = alpha
    }

    fileprivate func xyzCompand(_ v: CGFloat) -> CGFloat {
        let v3 = v * v * v
        return v3 > Constants.LAB_E ? v3 : (v - Constants.LAB_16_116) / Constants.LAB_K_116
    }
}

// All conversion capabilities
public extension LABColor {
    func toXYZ() -> XYZColor {
        let y = (l + 16) / 116
        let x = y + (a / 500)
        let z = y - (b / 200)
        return XYZColor(
            x: xyzCompand(x) * Constants.LAB_X,
            y: xyzCompand(y) * Constants.LAB_Y,
            z: xyzCompand(z) * Constants.LAB_Z,
            alpha: alpha
        )
    }
    
    func toLCH() -> LCHColor {
        let c = sqrt(a * a + b * b)
        let angle = atan2(b, a) * Constants.RAD_TO_DEG
        let h = angle < 0 ? angle + 360 : angle
        return LCHColor(l: l, c: c, h: h, alpha: alpha)
    }
    
    func toRGB() -> RGBColor {
        return toXYZ().toRGB()
    }
    
    func lerp(_ other: LABColor, t: CGFloat) -> LABColor {
        return LABColor(
            l: l + (other.l - l) * t,
            a: a + (other.a - a) * t,
            b: b + (other.b - b) * t,
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
}
