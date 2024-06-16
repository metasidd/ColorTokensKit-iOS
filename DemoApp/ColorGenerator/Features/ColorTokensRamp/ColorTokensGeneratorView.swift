//
//  ColorGeneratorView.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-08.
//

import SwiftUI
import ColorTokensKit

extension Color {
    // Foreground colors
    public static var foregroundPrimary: Color {
        .gray.foregroundPrimary
    }
    public static var foregroundSecondary: Color {
        .gray.foregroundSecondary
    }
    public static var foregroundTertiary: Color {
        .gray.foregroundTertiary
    }
    
    // Inverted colors
    public static var invertedForeground: Color {
        .gray.invertedForegroundPrimary
    }
    public static var invertedForegroundSecondary: Color {
        .gray.invertedForegroundSecondary
    }
    public static var invertedForegroundTertiary: Color {
        .gray.invertedForegroundTertiary
    }
    
    // Background colors
    public static var backgroundPrimary: Color {
        Color(light: .white, dark: .black) // Pure black and white
    }
    public static var backgroundSecondary: Color {
        .gray.backgroundSecondary
    }
    public static var backgroundTertiary: Color {
        .gray.backgroundTertiary
    }
    
    // Outline colors
    public static var outlinePrimary: Color {
        .gray.outlinePrimary
    }
    public static var outlineSecondary: Color {
        .gray.outlineSecondary
    }
    public static var outlineTertiary: Color {
        .gray.outlineTertiary
    }
}

public extension LCHColor {
    // Foreground colors
    var foregroundPrimary: Color { _100 }
    var foregroundSecondary: Color { _80 }
    var foregroundTertiary: Color { _60 }
    
    // Inverted foreground colors
    var invertedForegroundPrimary: Color { _0 }
    var invertedForegroundSecondary: Color { _15 }
    var invertedForegroundTertiary: Color { _25 }
    
    // Backgroundcolors
    var backgroundPrimary: Color { _5 }
    var backgroundSecondary: Color { _10 }
    var backgroundTertiary: Color { _20 }
    
    // Inverted background colors
    var invertedBackgroundPrimary: Color { _80 }
    var invertedBackgroundSecondary: Color { _65 }
    var invertedBackgroundTertiary: Color { _50 }
    
    // Outline colors
    var outlinePrimary: Color { _30 }
    var outlineSecondary: Color { _10 }
    var outlineTertiary: Color { _5 }
}

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
        return colorToUse.getLCHString()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.appCaption())
            Text(subtitle.isEmpty ? "#\(hexString) \(lchString)" : subtitle)
                .font(.appMiniCaption())
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
