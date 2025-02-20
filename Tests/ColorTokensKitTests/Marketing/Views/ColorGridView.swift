import SwiftUI
import ColorTokensKit

struct ColorGridView: View {
    let interpolator = ColorRampInterpolator()
    let hueSteps = 14
    
    var colorRamps: [ColorRamp] {
        // Generate hues at regular intervals
        (0...hueSteps).map { step in
            let hue = Double(step) * (360.0 / Double(hueSteps))
            let stops = interpolator.interpolateRamp(forHue: hue)
            return ColorRamp(
                name: "H\(Int(hue))",
                stops: Dictionary(
                    uniqueKeysWithValues: stops.enumerated().map { index, stop in
                        ("\(index)", stop)
                    }
                )
            )
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(colorRamps, id: \.name) { ramp in
                ColorColumn(name: ramp.name, stops: ramp.stops)
            }
        }
        .padding(MarketingStyle.pagePadding)
        .background(MarketingStyle.backgroundColor)
        .background(Color.white)
    }
}

struct ColorColumn: View {
    let name: String
    let stops: [String: LCHColor]
    
    var sortedStops: [(key: String, stop: LCHColor)] {
        stops.map { (key: $0.key, stop: $0.value) }
            .sorted { Int($0.key) ?? 0 < Int($1.key) ?? 0 }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(sortedStops, id: \.key) { pair in
                    let color = LCHColor(l: pair.stop.l, c: pair.stop.c, h: pair.stop.h)
                    
                    VStack(spacing: 2) {
                        Text(pair.key)
                        Text("H:\(Int(pair.stop.h))")
                    }
                    .font(.system(size: 8))
                    .foregroundStyle(pair.stop.l > 50 ? Color.black : Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(color.toColor())
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ColorGridView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
} 
