import SwiftUI
import ColorTokensKit

struct PillView: View {
    private let nativeColors: [(name: String, color: Color)] = [
        ("Red", .red),
        ("Blue", .blue),
        ("Green", .green)
    ]
    
    private let colorTokenColors: [(name: String, color: LCHColor)] = [
        ("Red", Color.proRed),
        ("Blue", Color.proIndigo),
        ("Green", Color.proGreen)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Native SwiftUI Colors")
                    .font(.system(.title2, design: .monospaced))
                
                HStack(spacing: 16) {
                    ForEach(nativeColors, id: \.name) { colorInfo in
                        makePill(text: "\(colorInfo.name) Pill", 
                               color: colorInfo.color)
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text("ColorTokensKit Colors")
                    .font(.system(.title2, design: .monospaced))
                
                HStack(spacing: 16) {
                    ForEach(Array(colorTokenColors), id: \.name) { name, color in
                        makeThemedPill(text: "\(name) Pill", theme: color)
                    }
                }
            }
        }
        .padding(MarketingStyle.pagePadding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
    }
    
    private func makePill(text: String, color: Color) -> some View {
        Text(text)
            .padding()
            .background(color.opacity(0.2))
            .foregroundColor(color)
            .clipShape(Capsule())
    }
    
    private func makeThemedPill(text: String, theme: LCHColor) -> some View {
        Text(text)
            .padding()
            .background(theme.backgroundSecondary)
            .foregroundColor(theme.foregroundSecondary)
            .clipShape(Capsule())
    }
}

#Preview {
    PillView()
        .frame(width: ImageSize.width, height: ImageSize.height)
} 
