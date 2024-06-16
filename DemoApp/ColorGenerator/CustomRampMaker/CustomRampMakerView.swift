//
//  CustomRampMakerView.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-10.
//

import Foundation
import SwiftUI

struct CustomRampMakerView: View {
    @State private var viewModel: CustomRampMakerViewModel
    
    init(hue: CGFloat) {
        self._viewModel = State(wrappedValue: CustomRampMakerViewModel(hue: hue))
    }
    
    var body: some View {
        sliders
    }
    
    private var sliders: some View {
        VStack {
            HStack {
                Text("Steps")
                Slider(value: Binding(
                    get: { Double(viewModel.steps) },
                    set: { viewModel.steps = Int($0) }
                ), in: 5...20, step: 1)
                Text(String(format: "%.0f", Double(viewModel.steps)))
            }
            HStack {
                Text("Hue")
                Slider(value: $viewModel.hue, in: 0...360)
                Text(String(format: "%.0f", viewModel.hue))
            }
        }
        .font(.appSmallBody())
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(radius: 32)
        .padding(16)
    }
    
    private var selectedColor: some View {
        ColorPicker("Pick a Color", selection: $viewModel.selectedColor, supportsOpacity: false)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(viewModel.selectedColor)
                    .frame(height: 64)
            )
            .font(.appBody())
            .padding(.horizontal, 16)
    }
}
