//
//  ColorGeneratorView.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-08.
//

import SwiftUI
import ColorTokensKit


struct ColorTokensGeneratorView: View {
    @StateObject var viewModel: ColorTokensGeneratorViewModel
    
    init(lchColor: LCHColor) {
        _viewModel = StateObject(wrappedValue: ColorTokensGeneratorViewModel(lchColor: lchColor))
    }
    
    private let containerVStackPadding: CGFloat = 4
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                sectionHeader(title: "Foreground Colors")
                foregroundColors()
                
                sectionHeader(title: "Inverted Foreground Colors")
                invertedForegroundColors()
                
                sectionHeader(title: "Background Colors")
                backgroundColors()
                
                sectionHeader(title: "Inverted Background Colors")
                invertedBackgroundColors()
                
                sectionHeader(title: "Outline Colors")
                outlineColors()
            }
            .padding(16)
        }
        .navigationTitle("Color Tokens")
    }
    
    private func foregroundColors() -> some View {
        VStack(spacing: containerVStackPadding) {
            ColorBox(
                title: "Foreground Primary",
                foregroundColor: viewModel.lchColor.foregroundPrimary
            )
            ColorBox(
                title: "Foreground Secondary",
                foregroundColor: viewModel.lchColor.foregroundSecondary
            )
            ColorBox(
                title: "Foreground Tertiary",
                foregroundColor: viewModel.lchColor.foregroundTertiary
            )
        }
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(viewModel.lchColor.backgroundPrimary)
        )
    }
    
    private func invertedForegroundColors() -> some View {
        VStack(spacing: containerVStackPadding) {
            ColorBox(
                title: "Inverted Foreground Primary",
                foregroundColor: viewModel.lchColor.invertedForegroundPrimary
            )
            ColorBox(
                title: "Inverted Foreground Secondary",
                foregroundColor: viewModel.lchColor.invertedForegroundSecondary
            )
            ColorBox(
                title: "Inverted Foreground Tertiary",
                foregroundColor: viewModel.lchColor.invertedForegroundTertiary
            )
        }
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(viewModel.lchColor.invertedBackgroundPrimary)
        )
    }
    
    private func backgroundColors() -> some View {
        VStack(spacing: containerVStackPadding) {
            ColorBox(
                title: "Background Primary",
                backgroundColor: viewModel.lchColor.backgroundPrimary
            )
            ColorBox(
                title: "Background Secondary",
                backgroundColor: viewModel.lchColor.backgroundSecondary
            )
            ColorBox(
                title: "Background Tertiary",
                backgroundColor: viewModel.lchColor.backgroundTertiary
            )
        }
        .foregroundStyle(viewModel.lchColor.foregroundPrimary)
    }
    
    private func invertedBackgroundColors() -> some View {
        VStack(spacing: containerVStackPadding) {
            ColorBox(
                title: "Inverted Background Primary",
                backgroundColor: viewModel.lchColor.invertedBackgroundPrimary
            )
            ColorBox(
                title: "Inverted Background Secondary",
                backgroundColor: viewModel.lchColor.invertedBackgroundSecondary
            )
            ColorBox(
                title: "Inverted Background Tertiary",
                backgroundColor: viewModel.lchColor.invertedBackgroundTertiary
            )
        }
        .foregroundStyle(viewModel.lchColor.invertedForegroundPrimary)
    }
    
    private func outlineColors() -> some View {
        VStack(spacing: containerVStackPadding) {
            ColorBox(
                title: "Outline Primary",
                subtitle: "",
                foregroundColor: viewModel.lchColor.foregroundPrimary,
                outlineColor: viewModel.lchColor.outlinePrimary
            )
            ColorBox(
                title: "Outline Secondary",
                subtitle: "",
                foregroundColor: viewModel.lchColor.foregroundPrimary,
                outlineColor: viewModel.lchColor.outlineSecondary
            )
            ColorBox(
                title: "Outline Tertiary",
                subtitle: "",
                foregroundColor: viewModel.lchColor.foregroundPrimary,
                outlineColor: viewModel.lchColor.outlineTertiary
            )
        }
        .foregroundStyle(viewModel.lchColor.foregroundPrimary)
    }
    
    private func sectionHeader(title: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.appSmallBody(weight: .black))
        }
        .padding(.top, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ColorBox: View {
    @Environment(\.colorScheme) var colorScheme
    
    let title: String
    let subtitle: String
    let foregroundColor: Color?
    let backgroundColor: Color?
    let outlineColor: Color?
    let cornerRadius: CGFloat = 16
    
    init(
        title: String,
        subtitle: String = "",
        foregroundColor: Color? = nil,
        backgroundColor: Color? = nil,
        outlineColor: Color? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.outlineColor = outlineColor
    }
    
    private var colorToUse: Color {
        if let foregroundColor {
            return foregroundColor
        } else if let backgroundColor {
            return backgroundColor
        } else if let outlineColor {
            return outlineColor
        } else {
            return Color.clear
        }
    }
    
    private var hexString: String {
        return colorToUse.toHex()
    }
    
    private var lchString: String {
        return "(\(colorToUse.getLCHString()))"
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.appCaption(weight: .bold))
            Text(subtitle.isEmpty ? "#\(hexString) \(lchString)" : subtitle)
                .font(.appMiniCaption())
                .opacity(0.7)
        }
        .applyIf(foregroundColor != nil) { view in
            view.foregroundColor(foregroundColor!)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(backgroundColor ?? Color.clear)
                .stroke(outlineColor ?? Color.clear, style: .init(lineWidth: 1))
        )
    }
}


#Preview {
    ColorTokensGeneratorView(lchColor: Color.purple)
}
