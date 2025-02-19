import SwiftUI
import ColorTokensKit

struct ColorGridView: View {
    private let primaryColors = Color.allProHues.sorted { $0.value.h < $1.value.h }
    private let secondaryValues: [LCHColor] = Color.allProHues.first!.value.allNormalColors.map({ LCHColor(color: $0) })
    private let gridSpacing: CGFloat = 2
    
    // Define the LCH values for each step based on RampTokens+LCH.swift
    
    var body: some View {
        VStack(spacing: 32) {
            VStack(spacing: gridSpacing) {
                headerRow
                colorRows
            }
        }
        .padding(MarketingStyle.pagePadding)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
    
    private var headerRow: some View {
        HStack(spacing: gridSpacing) {
            // Empty cell for hue names
            Text("")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
            
            // Lightness value headers
            ForEach(Array(secondaryValues.enumerated()), id: \.offset) { index, secondaryValue in
                Text("L\(Int(secondaryValue.l))")
                    .font(.system(.caption, design: .monospaced))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
            }
        }
    }
    
    private var colorRows: some View {
        ForEach(primaryColors, id: \.key) { name, primaryColor in
            colorRow(name: name, primaryColor: primaryColor)
        }
    }
    
    private func colorRow(name: String, primaryColor: LCHColor) -> some View {
        
        return HStack(spacing: gridSpacing) {
            // Hue name
            hueNameCell(name: name)
            
            // Color cells
            ForEach(Array(secondaryValues.enumerated()), id: \.offset) { index, secondaryValue in
                let color = LCHColor(l: secondaryValue.l, c: secondaryValue.c, h: primaryColor.h)
                let _ = print("Color: \(name), lightness: \(secondaryValue.l), h: \(primaryColor.h), c: \(secondaryValue.c)")
                colorCell(color: color, lightness: Int(secondaryValue.l))
            }
        }
    }
    
    private func hueNameCell(name: String) -> some View {
        Text(name)
            .font(.system(.caption, design: .monospaced))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
    }
    
    private func colorCell(color: LCHColor, lightness: Int) -> some View {
        Text("\(lightness)")
            .font(.system(size: 10, design: .monospaced))
            .foregroundStyle(lightness > 50 ? Color.black : Color.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(color.toColor())
    }
}

#Preview {
    ColorGridView()
        .frame(width: ImageSize.width, height: ImageSize.height)
} 
