//
//  File.swift
//  
//
//  Created by Siddhant Mehta on 2024-06-16.
//

import Foundation

struct ColorMatrix {
    let x: (Double, Double, Double)
    let y: (Double, Double, Double)
    let z: (Double, Double, Double)
    
    func dotProduct(_ vector: (Double, Double, Double)) -> (Double, Double, Double) {
        return (
            x.0 * vector.0 + x.1 * vector.1 + x.2 * vector.2,
            y.0 * vector.0 + y.1 * vector.1 + y.2 * vector.2,
            z.0 * vector.0 + z.1 * vector.1 + z.2 * vector.2
        )
    }
}

public struct OklabColor: Hashable {
    public let l: CGFloat     // 0..1
    public let a: CGFloat     // -0.5..0.5
    public let b: CGFloat     // -0.5..0.5
    public let alpha: CGFloat // 0..1
    
    public init(l: CGFloat, a: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.l = l
        self.a = a
        self.b = b
        self.alpha = alpha
    }
    
    public func toOKLCH() -> OKLCHColor {
        let c = sqrt(a * a + b * b)
        let h = atan2(b, a) * 180.0 / CGFloat.pi
        let hue = h < 0 ? h + 360 : h
        return OKLCHColor(l: l, c: c, h: hue, alpha: alpha)
    }
    
    public func toXYZ() -> XYZColor {
        let lmsToXyz = ColorMatrix(
            x: ( 1.2268798733741557,  -0.5578149965554813,  0.28139105017721583),
            y: (-0.04057576262431372,  1.1122868293970594, -0.07171106666151701),
            z: (-0.07637294974672142, -0.4214933239627914,  1.5869240244272418)
        )
        
        let oklabToLms = ColorMatrix(
            x: (0.99999999845051981432,  0.39633779217376785678,   0.21580375806075880339),
            y: (1.0000000088817607767,  -0.1055613423236563494,   -0.063854174771705903402),
            z: (1.0000000546724109177,  -0.089484182094965759684, -1.2914855378640917399)
        )
        
        let lms = oklabToLms.dotProduct((l, a, b))
        let (x, y, z) = lmsToXyz.dotProduct((pow(lms.0, 3), pow(lms.1, 3), pow(lms.2, 3)))
        return XYZColor(x: CGFloat(x), y: CGFloat(y), z: CGFloat(z), alpha: 1.0)
    }
    
    public func printValues() {
        print("L:\(Double(l)) A:\(Double(a)) B:\(Double(b))")
    }
}
