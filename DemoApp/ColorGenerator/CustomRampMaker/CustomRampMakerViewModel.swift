//
//  CustomRampMakerViewModel.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-10.
//

import Foundation
import SwiftUI

@Observable
class CustomRampMakerViewModel: ObservableObject {
    var selectedColor: Color = Color.gray
    var steps: Int = 10
    var hue: CGFloat
    
    init(hue: CGFloat) {
        self.hue = hue
    }
    
}
