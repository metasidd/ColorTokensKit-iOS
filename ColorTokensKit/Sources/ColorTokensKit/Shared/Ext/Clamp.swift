//
//  Clamp.swift
//  
//
//  Created by Siddhant Mehta on 2024-06-19.
//

import Foundation

func clamp<T: Comparable>(_ value: T, min: T, max: T) -> T {
    return Swift.max(min, Swift.min(max, value))
}
