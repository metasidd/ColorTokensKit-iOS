import ColorTokensKit
import SwiftUI

struct ColorGridView: View {
    private var colorRamps: [(name: String, color: LCHColor)] {
        Color.allProHues.map { (name: $0.key, color: $0.value) }
            .sorted { lhs, rhs in
                if lhs.name == "Gray" { return true }
                if rhs.name == "Gray" { return false }
                return lhs.color.h < rhs.color.h
            }
    }

    var body: some View {
        VStack(spacing: 0) {
            ForEach(colorRamps, id: \.name) { ramp in
                ColorColumn(name: ramp.name, color: ramp.color)
            }
        }
    }
}

private struct ColorColumn: View {
    let name: String
    let color: LCHColor

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(Array(color.allStops.enumerated()), id: \.offset) { index, stop in
                    VStack(spacing: 2) {
                        Text("\(index)")
                        Text("H:\(Int(stop.h))")
                    }
                    .font(.system(size: 8))
                    .foregroundStyle(stop.l > 50 ? Color.black : Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(stop.toColor())
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
