//
//  ContentView.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-08.
//

import SwiftUI
import Routing
import ColorTokensKit

struct HuesView: View {
    @State var viewModel = HuesViewModel()
    @StateObject var router: Router<GlobalRouter>
    
    init(router: Router<GlobalRouter>) {
        _router = StateObject(wrappedValue: router)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 4) {
//                    ForEach(Array(stride(from: 0, to: 361, by: 10)), id: \.self) { index in
//                        let lchColor = LCHColor(l: 75, c: 50, h: CGFloat(index), alpha: 1.0)
//                        HueColorGroup(router: router, lchColor: lchColor)
//                    }
                    ForEach(Array(Color.allProColors).sorted { $0.value.h < $1.value.h }, id: \.key) { name, color in
                        HueColorGroup(router: router, lchColor: color, name: name)
                    }
                }
                .padding(16)
            }
            .navigationTitle("Color Book")
        }
    }
    
}

struct HueColorGroup: View {
    @StateObject var router: Router<GlobalRouter>
    
    let lchColor: LCHColor
    let name: String
    @State var collapsed: Bool = true
    
    var body: some View {
        VStack(spacing: 4) {
            hueColorButton(lchColor: lchColor)
        }
    }
    
    private func hueColorButton(lchColor: LCHColor) -> some View {
        return Button {
            withAnimation {
                router.routeTo(.colorRampView(lchColor))
                collapsed.toggle()
            }
        } label: {
            HStack {
                hueRampView(lchColor: lchColor)
            }
            .overlay {
                HStack {
                    Text("H\(Int(lchColor.h)) • \(name)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.appSmallBody(weight: .bold))
                        .foregroundStyle(lchColor.invertedForegroundPrimary)
                    Image(systemName: "chevron.right")
                        .rotationEffect(.degrees(collapsed ? 0 : 90))
                        .font(.appCaption(weight: .bold))
                        .foregroundStyle(lchColor.foregroundPrimary)
                }
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity)
            }
            .foregroundStyle(Color.black)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private func hueRampView(lchColor: LCHColor) -> some View {
        let colorRamp = lchColor.allCases.reversed()
        return HStack(spacing: 0) {
            ForEach(colorRamp, id: \.self) { lchColor in
                Rectangle()
                    .fill(lchColor)
                    .frame(height: 64)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

#Preview {
    HuesView(router: .mock)
}
