//
//  ColorRampUtility.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-09.
//

import Foundation
import ColorTokensKit

class ColorRampUtility {
    func generateColors(hue: CGFloat, steps: Int) -> [LCHColor] {
        var colors: [LCHColor] = []
        let lightnessStepSize = 100.0 / Double(steps - 1)
        let chromaStepSize = 90.0 / Double(steps - 1)

        for i in 0..<steps {
            let currentLightness = lightnessStepSize * Double(i)
            let currentChroma = 100 - (chromaStepSize * Double(i))
            colors.append(LCHColor(l: currentLightness, c: currentChroma, h: hue, alpha: 1.0))
        }
        
        return colors
    }
}
