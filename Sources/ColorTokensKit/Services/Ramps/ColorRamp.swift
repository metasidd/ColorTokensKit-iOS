//
//  ColorRamp.swift
//  ColorTokensKit
//
//  Created by Siddhant Mehta on 2025-02-22.
//

import Foundation

struct ColorRamp {
    let name: String
    let stops: [String: LCHColor]

    public init(name: String, stops: [String: LCHColor]) {
        self.name = name
        self.stops = stops
    }
}
