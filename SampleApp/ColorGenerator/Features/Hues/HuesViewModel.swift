//
//  HuesViewModel.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-08.
//

import ColorTokensKit
import Foundation
import SwiftUI

@Observable
class HuesViewModel: ObservableObject {
    var colors = Color.allProHues
}
