//
//  ColorRampViewModel.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-15.
//

import Foundation
import SwiftUI
import ColorTokensKit

@Observable
class ColorRampViewModel: ObservableObject {
    var hue: CGFloat
    var steps: Int
    var colors: [LCHColor] = []
    
    init(hue: CGFloat, steps: Int = 16) {
        self.hue = hue
        self.steps = steps
        updateColors()
    }
    
    func updateColors() {
        colors = (0..<steps).map { step in
            let lightness = calculateLightness(for: step)
            let chroma = calculateChroma(for: step)
            let adjustedHue = UIScreen.main.traitCollection.userInterfaceStyle == .dark ? 0 : hue
            return LCHColor(l: lightness, c: chroma, h: adjustedHue, alpha: 1.0)
        }
    }
    
    private func calculateLightness(for step: Int) -> CGFloat {
        // Increase lightness gradually from 0 to 100
        return CGFloat(step) / CGFloat(steps - 1) * 100
    }
    
    private func calculateChroma(for step: Int) -> CGFloat {
        // Decrease chroma gradually from 100 to 0
        return (1.0 - CGFloat(step) / CGFloat(steps - 1)) * 100
    }
}


