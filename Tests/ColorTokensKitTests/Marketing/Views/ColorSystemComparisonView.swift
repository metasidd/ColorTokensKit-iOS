import SwiftUI
import ColorTokensKit

struct ColorSystemComparisonView: View {
    // Using all hues to create a rainbow
    let hues: [(name: String, color: LCHColor)] = {
        ColorRampDefinition.predefinedRamps
            .map { ramp in
                (
                    name: ramp.name.capitalized,
                    color: LCHColor(
                        l: ramp.lightness[7], // Using index 10 for middle lightness
                        c: ramp.chroma[7],    // Using index 10 for middle chroma
                        h: ramp.baseHue + ramp.hueShift[7]
                    )
                )
            }
            .sorted { $0.color.h < $1.color.h }
            .filter { $0.name != "Gray" }
    }()
    
    var body: some View {
        VStack(spacing: 48) {
            HStack(spacing: 64) {
                lchGradientView
                rgbGradientView
            }
            .font(.system(.title, design: .monospaced))
            
            descriptionText
        }
        .padding(MarketingStyle.pagePadding)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
    
    private var lchGradientView: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("LCH Color System")
            
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: hues.map { $0.color.toColor() },
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(maxWidth: .infinity, maxHeight: 240)
                .clipShape(RoundedRectangle(cornerRadius: 32))
        }
    }
    
    private var rgbGradientView: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("RGB Color System")
            
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [.red, .yellow, .green, .cyan, .blue, .purple, .red],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(maxWidth: .infinity, maxHeight: 240)
                .clipShape(RoundedRectangle(cornerRadius: 32))
        }
    }
    
    private var descriptionText: some View {
        Text("LCH maintains consistent brightness and saturation across hues\nRGB shows uneven brightness and saturation changes.\nNote that while the RGB gradient is more vibrant, it is not as accessible or scalable as the LCH gradient system.")
            .font(.system(.title2, design: .monospaced))
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            .padding(.trailing, 256)
    }
}

#Preview {
    ColorSystemComparisonView()
        .frame(width: ImageSize.width, height: ImageSize.height)
} 
