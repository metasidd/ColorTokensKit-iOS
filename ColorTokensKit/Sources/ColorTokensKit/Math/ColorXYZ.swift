//
//  ColorXYZ.swift
//  
//
//  Original repo: https://github.com/timrwood/ColorSpaces
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
    
    public func toRGB() -> RGBColor {
        let r = (x *  3.2404542) + (y * -1.5371385) + (z * -0.4985314)
        let g = (x * -0.9692660) + (y *  1.8760108) + (z *  0.0415560)
        let b = (x *  0.0556434) + (y * -0.2040259) + (z *  1.0572252)
        let R = sRGBCompand(r)
        let G = sRGBCompand(g)
        let B = sRGBCompand(b)
        return RGBColor(r: R, g: G, b: B, alpha: alpha)
    }
    
    fileprivate func labCompand(_ v: CGFloat) -> CGFloat {
        return v > Constants.LAB_E ? pow(v, 1.0 / 3.0) : (Constants.LAB_K_116 * v) + Constants.LAB_16_116
    }
    
    public func toLAB() -> LABColor {
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
    
    public func toLCH() -> LCHColor {
        return toLAB().toLCH()
    }
    
    public func lerp(_ other: XYZColor, t: CGFloat) -> XYZColor {
        return XYZColor(
            x: x + (other.x - x) * t,
            y: y + (other.y - y) * t,
            z: z + (other.z - z) * t,
            alpha: alpha + (other.alpha - alpha) * t
        )
    }
    
    public func toOklab() -> OklabColor {
        // 1. Convert XYZ to linear LMS
        let L = 0.4121656120 * x + 0.5362752080 * y + 0.0514575653 * z
        let M = 0.2118591070 * x + 0.6807189570 * y + 0.1074065790 * z
        let S = 0.0883097947 * x + 0.2818474170 * y + 0.6302613616 * z
        
        // 2. Apply the non-linear transformation (cube root)
        let l_ = pow(L, 1.0/3.0)
        let m_ = pow(M, 1.0/3.0)
        let s_ = pow(S, 1.0/3.0)
        
        // 3. Convert to Oklab
        let okL = 0.2104542553 * l_ + 0.7936177850 * m_ - 0.0040720468 * s_
        let okA = 1.9779984951 * l_ - 2.4285922050 * m_ + 0.4505937099 * s_
        let okB = 0.0259040371 * l_ + 0.7827717662 * m_ - 0.8086757660 * s_
        
        return OklabColor(l: okL, a: okA, b: okB, alpha: alpha)
    }
    
    func toOKLCH() -> OKLCHColor {
        return toOklab().toOKLCH()
    }
    
    public func printValues() {
        print("X:\(Double(x)) Y:\(Double(y)) Z:\(Double(z))")
    }
}
