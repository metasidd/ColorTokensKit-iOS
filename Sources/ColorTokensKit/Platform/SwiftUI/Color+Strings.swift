//
//  LCH+Utils.swift
//  ColorTokensKit
//
//  Created by Siddhant Mehta on 2025-02-23.
//

import SwiftUI

public extension Color {

    /// Converts the `LCHColor` to a hexadecimal string representation.
    public func getHexString() -> String {
        let resolvedColor = resolve(in: .init())

        // Ensure RGB values are within [0, 1]
        let r = Double(max(0, min(resolvedColor.red, 1)))
        let g = Double(max(0, min(resolvedColor.green, 1)))
        let b = Double(max(0, min(resolvedColor.blue, 1)))
        let a = Double(max(0, min(resolvedColor.cgColor.alpha, 1)))

        // Convert to hexadecimal
        let hexString: String
        if a != 1.0 {
            hexString = String(format: "%02lX%02lX%02lX%02lX", lround(r * 255), lround(g * 255), lround(b * 255), lround(a * 255))
        } else {
            hexString = String(format: "%02lX%02lX%02lX", lround(r * 255), lround(g * 255), lround(b * 255))
        }

        print("red \(r)")
        print("green \(g)")
        print("blue \(b)")
        print("alpha \(a)")
        print("hex: \(hexString)")
        print("-------")

        return hexString
    }
    
    /// Get LCH string representation
    public func getLCHString() -> String {
        let lchColor = LCHColor(color: self)
        return "L:\(Int(lchColor.l)) C:\(Int(lchColor.c)) H:\(Int(lchColor.h))"
    }
    
}
