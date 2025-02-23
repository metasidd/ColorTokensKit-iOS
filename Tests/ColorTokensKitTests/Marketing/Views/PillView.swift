import SwiftUI
import ColorTokensKit

struct PillView: View {
    private let nativeColors: [(name: String, color: Color)] = [
        ("Gray", .gray),
        ("Red", .red),
        ("Blue", .blue),
        ("Green", .green),
        ("Yellow", .yellow),
        ("Purple", .purple)
    ]
    
    private let colorTokenColors: [(name: String, color: LCHColor)] = [
        ("Gray", Color.proGray),
        ("Red", Color.proRed),
        ("Blue", Color.proIndigo),
        ("Green", Color.proGreen),
        ("Yellow", Color.proYellow),
        ("Purple", Color.proPurple)
    ]
    
    var body: some View {
        VStack(alignment: .center, spacing: 128) {
            VStack(alignment: .center, spacing: 48) {
                Text("👎 With SwiftUI Colors")
                
                HStack(spacing: 16) {
                    ForEach(nativeColors, id: \.name) { colorInfo in
                        makePill(text: "\(colorInfo.name) Pill", 
                               color: colorInfo.color)
                    }
                }
            }
            
            VStack(alignment: .center, spacing: 48) {
                Text("🔥 With Color Tokens")
                
                HStack(spacing: 16) {
                    ForEach(Array(colorTokenColors), id: \.name) { name, color in
                        makeThemedPill(text: "\(name) Pill", theme: color)
                    }
                }
            }
        }
        .font(.system(size: 36, weight: .black, design: .monospaced))
        .padding(MarketingStyle.pagePadding)
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color.white)
    }
    
    private func makePill(text: String, color: Color) -> some View {
        Text(text)
            .font(.title)
            .foregroundColor(color)
            .padding(.horizontal, 32)
            .padding(.vertical, 12)
            .background(color.opacity(0.2))
            .clipShape(Capsule())
    }
    
    private func makeThemedPill(text: String, theme: LCHColor) -> some View {
        Text(text)
            .font(.title)
            .foregroundColor(theme.foregroundSecondary)
            .padding(.horizontal, 32)
            .padding(.vertical, 12)
            .background(theme.backgroundSecondary)
            .clipShape(Capsule())
    }
}

#Preview {
    PillView()
        .frame(width: ImageSize.width, height: ImageSize.height)
} 
