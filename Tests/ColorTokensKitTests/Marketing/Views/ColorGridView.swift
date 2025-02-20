import SwiftUI
import ColorTokensKit

struct ColorGridView: View {
    private let primaryColors: [(key: String, value: LCHColor)] = {
        ColorRampDefinition.predefinedRamps.map { ramp in
            (
                key: ramp.name.capitalized,
                value: LCHColor(
                    l: ramp.lightness[5],
                    c: ramp.chroma[5],
                    h: ramp.baseHue + ramp.hueShift[5]
                )
            )
        }.sorted { pair1, pair2 in
            // Always put gray first
            if pair1.key == "Gray" { return true }
            if pair2.key == "Gray" { return false }
            // Sort by hue
            return pair1.value.h < pair2.value.h
        }
    }()
    
    private let secondaryValues: [LCHColor] = {
        // Create array of LCHColors based on ColorRampDefinition.stops
        ColorRampDefinition.stops.map { stop in
            LCHColor(l: Double(stop), c: 40, h: 0)
        }
    }()
    
    private let gridSpacing: CGFloat = 0
    
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
            ForEach(ColorRampDefinition.stops, id: \.self) { stop in
                Text("L\(stop)")
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
        let ramp = ColorRampDefinition.predefinedRamps.first { $0.name.capitalized == name }!
        
        return HStack(spacing: gridSpacing) {
            // Hue name
            hueNameCell(name: name)
            
            // Color cells
            ForEach(Array(zip(ColorRampDefinition.stops, ramp.chroma)), id: \.0) { stop, chroma in
                let color = name == "Gray" ? 
                    LCHColor(l: Double(stop), c: 0, h: 0) :
                    LCHColor(l: Double(stop), c: chroma, h: primaryColor.h)
                colorCell(color: color, lightness: stop)
            }
        }
    }
    
    private func hueNameCell(name: String) -> some View {
        let ramp = ColorRampDefinition.predefinedRamps.first { $0.name.capitalized == name }!
        return VStack(spacing: 2) {
            Text(name)
                .font(.system(.caption, design: .monospaced))
            if name != "Gray" {
                Text("H\(Int(ramp.baseHue))")
                    .font(.system(.caption2, design: .monospaced))
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
    
    private func colorCell(color: LCHColor, lightness: Int) -> some View {
        Text("\(lightness)")
            .font(.system(size: 10, design: .monospaced))
            .foregroundStyle(lightness > 50 ? 
                LCHColor(l: 20, c: color.c, h: color.h).toColor() :
                LCHColor(l: 80, c: color.c, h: color.h).toColor()
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(color.toColor())
    }
}

#Preview {
    ColorGridView()
        .frame(width: ImageSize.width, height: ImageSize.height)
} 
