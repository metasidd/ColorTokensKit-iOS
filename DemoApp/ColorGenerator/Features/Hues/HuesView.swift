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
                    let sortedProColors = Array(Color.allProColors).sorted { $0.value.h < $1.value.h }
                    ForEach(sortedProColors, id: \.key) { name, color in
                        HueColorGroup(router: router, okLchColor: color, name: name)
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
    
    let okLchColor: OKLCHColor
    let name: String
    @State var collapsed: Bool = true
    
    var body: some View {
        VStack(spacing: 4) {
            hueColorButton(okLchColor: okLchColor)
        }
    }
    
    private func hueColorButton(okLchColor: OKLCHColor) -> some View {
        return Button {
            withAnimation {
                router.routeTo(.colorRampView(okLchColor))
                collapsed.toggle()
            }
        } label: {
            HStack {
                hueRampView(okLchColor: okLchColor)
            }
            .overlay {
                HStack {
                    Text("H\(Int(okLchColor.h)) • \(name)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.appSmallBody(weight: .bold))
                        .foregroundStyle(okLchColor.invertedForegroundPrimary)
                    Image(systemName: "chevron.right")
                        .rotationEffect(.degrees(collapsed ? 0 : 90))
                        .font(.appCaption(weight: .bold))
                        .foregroundStyle(okLchColor.foregroundPrimary)
                }
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity)
            }
            .foregroundStyle(Color.black)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private func hueRampView(okLchColor: OKLCHColor) -> some View {
        let colorRamp = okLchColor.allCases.reversed()
        return HStack(spacing: 0) {
            ForEach(colorRamp, id: \.self) { okLchColor in
                Rectangle()
                    .fill(okLchColor)
                    .frame(height: 64)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

#Preview {
    HuesView(router: .mock)
}
