//
//  Double+Ext.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-08.
//

import Foundation

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
