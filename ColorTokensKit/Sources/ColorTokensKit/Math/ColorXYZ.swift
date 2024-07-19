//
//  ColorXYZ.swift
//  
//
//  Built off of the original repo of: https://github.com/timrwood/ColorSpaces
//

import Foundation

public struct XYZColor: Hashable {
    public let x: CGFloat     // 0..0.95047
    public let y: CGFloat     // 0..1
    public let z: CGFloat     // 0..1.08883
    public let alpha: CGFloat // 0..1
    
    public init (x: CGFloat, y: CGFloat, z: CGFloat, alpha: CGFloat) {
        self.x = x
        self.y = y
        self.z = z
        self.alpha = alpha
    }

    fileprivate func sRGBCompand(_ v: CGFloat) -> CGFloat {
        let absV = abs(v)
        let out = absV > 0.0031308 ? 1.055 * pow(absV, 1 / 2.4) - 0.055 : absV * 12.92
        return v > 0 ? out : -out
    }
    
    fileprivate func labCompand(_ v: CGFloat) -> CGFloat {
        return v > Constants.LAB_E ? pow(v, 1.0 / 3.0) : (Constants.LAB_K_116 * v) + Constants.LAB_16_116
    }
}

public extension XYZColor {
    func toRGB() -> RGBColor {
        let r = (x *  3.2404542) + (y * -1.5371385) + (z * -0.4985314)
        let g = (x * -0.9692660) + (y *  1.8760108) + (z *  0.0415560)
        let b = (x *  0.0556434) + (y * -0.2040259) + (z *  1.0572252)
        let R = sRGBCompand(r)
        let G = sRGBCompand(g)
        let B = sRGBCompand(b)
        return RGBColor(r: R, g: G, b: B, alpha: alpha)
    }
    
    func toLAB() -> LABColor {
        let fx = labCompand(x / Constants.LAB_X)
        let fy = labCompand(y / Constants.LAB_Y)
        let fz = labCompand(z / Constants.LAB_Z)
        return LABColor(
            l: 116 * fy - 16,
            a: 500 * (fx - fy),
            b: 200 * (fy - fz),
            alpha: alpha
        )
    }
    
    func toLCH() -> LCHColor {
        return toLAB().toLCH()
    }
    
    func lerp(_ other: XYZColor, t: CGFloat) -> XYZColor {
        return XYZColor(
            x: x + (other.x - x) * t,
            y: y + (other.y - y) * t,
            z: z + (other.z - z) * t,
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
}
