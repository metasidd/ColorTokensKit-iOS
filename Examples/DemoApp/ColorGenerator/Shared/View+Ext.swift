//
//  View+Ext.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-16.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func applyIf<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
