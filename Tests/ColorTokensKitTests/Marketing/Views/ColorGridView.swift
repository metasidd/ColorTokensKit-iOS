import SwiftUI
import ColorTokensKit

struct ColorGridView: View {
    let colorPalettes = ColorRampLoader.loadColorRamps()
    
    var sortedRamps: [ColorRamp]? {
        colorPalettes?.colorRamps.sorted { ramp1, ramp2 in
            // Get the first stop's hue value for comparison
            let hue1 = ramp1.stops.first?.value.h ?? 0
            let hue2 = ramp2.stops.first?.value.h ?? 0
            
            // Special case: always put gray first
            if ramp1.name.lowercased() == "gray" { return true }
            if ramp2.name.lowercased() == "gray" { return false }
            
            return hue1 < hue2
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if let ramps = sortedRamps {
                ForEach(ramps, id: \.name) { ramp in
                    ColorColumn(name: ramp.name, stops: ramp.stops)
                }
            } else {
                Text("Failed to load color palettes")
                    .foregroundStyle(.red)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(MarketingStyle.pagePadding)
        .background(MarketingStyle.backgroundColor)
    }
}

struct ColorColumn: View {
    let name: String
    let stops: [String: ColorStop]
    
    var sortedStops: [(key: String, stop: ColorStop)] {
        stops.map { (key: $0.key, stop: $0.value) }
            .sorted { Int($0.key) ?? 0 < Int($1.key) ?? 0 }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text(name)
                .font(.caption)
            HStack(spacing: 0) {
                ForEach(sortedStops, id: \.key) { pair in
                    let color = LCHColor(l: pair.stop.l, c: pair.stop.c, h: pair.stop.h)
                    Rectangle()
                        .fill(color.toColor())
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .overlay {
                            VStack(spacing: 2) {
                                Text(pair.key)
                                    .font(.system(size: 8))
                                Text("H:\(Int(pair.stop.h))")
                                    .font(.system(size: 8))
                            }
                            .foregroundStyle(pair.stop.l > 50 ? Color.black : Color.white)
                        }
                }
            }
        }
    }
}

#Preview {
    ColorGridView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
} 
