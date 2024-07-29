//
//  HomeViewModel.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-08.
//

import Foundation
import SwiftUI
import ColorTokensKit

@Observable
class HuesViewModel: ObservableObject {
    var colors = Color.allProHues
}
