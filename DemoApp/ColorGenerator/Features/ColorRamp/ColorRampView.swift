////
////  ColorRampView.swift
////  ColorGenerator
////
////  Created by Siddhant Mehta on 2024-06-15.
////
//
//import SwiftUI
//import ColorTokensKit
//
//struct ColorRampView: View {
//    @StateObject var viewModel: ColorRampViewModel
//    
//    init(hue: CGFloat) {
//        _viewModel = StateObject(wrappedValue: ColorRampViewModel(hue: hue))
//    }
//    
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 4) {
//                ForEach($viewModel.colors, id: \.offset) { index, token in
//                    colorBlock(lchColor: viewModel.colors[index], token: token)
//                }
//            }
//            .padding(16)
//        }
//        .navigationTitle("Playground")
//    }
//    
//    private func colorBlock(lchColor: LCHColor, token: LCHColorTokens) -> some View {
//        let rgbColor = lchColor.toRGB()
//        let defaultForegroundColor = lchColor.foregroundPrimary
//        let invertedForegroundColor = lchColor.invertedForegroundPrimary
//        
//        let contrast = lchColor.getContrast(with: LCHColor(color: defaultForegroundColor))
//        let invertedContrast = lchColor.getContrast(with: LCHColor(color: invertedForegroundColor))
//        
//        return HStack(alignment: .center, spacing: 4) {
//            VStack {
//                Text(token.rawValue)
//                    .font(.appSmallBody(weight: .bold))
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                
//                accessibilityLabel(lchColor: lchColor, contrast: contrast > 4.5 ? contrast : invertedContrast)
//                
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .font(.appCaption())
//            
//            VStack(alignment: .trailing) {
//                Text("#\(lchColor.toColor().toHex())")
//                    .multilineTextAlignment(.trailing)
//                Text("L:\(Int(lchColor.l)) C: \(Int(lchColor.c)) H: \(Int(lchColor.h))")
//                    .multilineTextAlignment(.trailing)
//            }
//            .frame(maxWidth: .infinity, alignment: .trailing)
//            .font(.appMiniCaption())
//        }
//        .foregroundStyle(contrast > 4.5 ? defaultForegroundColor : invertedForegroundColor)
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .padding(16)
//        .background(Color(red: rgbColor.r, green: rgbColor.g, blue: rgbColor.b))
//        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
//    }
//    
//    private func accessibilityLabel(lchColor: LCHColor, contrast: Double) -> some View {
//        return HStack(spacing: 2) {
//            if contrast > 4.5 {
//                Image(systemName: "checkmark")
//            } else {
//                Image(systemName: "xmark")
//            }
//            Text(String(contrast.round(to: 2)))
//        }
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .font(.appMiniCaption(weight: .bold))
//    }
//}
//
//#Preview {
//    ColorRampView(hue: 100)
//}
