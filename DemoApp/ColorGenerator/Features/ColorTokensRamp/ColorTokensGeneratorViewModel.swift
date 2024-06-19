//
//  ColorGeneratorViewModel.swift
//  ColorGeneratorViewModel
//
//  Created by Siddhant Mehta on 2024-06-08.
//

import Foundation
import SwiftUI
import UIKit
import ColorTokensKit

@Observable
class ColorTokensGeneratorViewModel: ObservableObject {
    var lchColor: OKLCHColor
    var steps: Int = Color.allProColors.count
    var colors: [String: OKLCHColor] = [:]
    
    init(lchColor: OKLCHColor) {
        self.lchColor = lchColor
        updateColors()
    }
    
    func updateColors() {
        colors = Color.allProColors
    }
}

