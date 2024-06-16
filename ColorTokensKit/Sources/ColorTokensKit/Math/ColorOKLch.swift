//
//  File.swift
//  
//
//  Created by Siddhant Mehta on 2024-06-16.
//

import Foundation

public struct OKLCHColor: Hashable {
    public let l: CGFloat     // 0..1
    public let c: CGFloat     // 0..1
    public let h: CGFloat     // 0..360
    public let alpha: CGFloat // 0..1
    
    public init(l: CGFloat, c: CGFloat, h: CGFloat, alpha: CGFloat = 1.0) {
        self.l = l
        self.c = c
        self.h = h
        self.alpha = alpha
    }
    
    public func toOklab() -> OklabColor {
        let rad = h * CGFloat.pi / 180.0
        let a = cos(rad) * c
        let b = sin(rad) * c
        return OklabColor(l: l, a: a, b: b, alpha: alpha)
    }
    
    public func printValues() {
        print("L:\(Double(l)) C:\(Double(c)) H:\(Double(h))")
    }
}
