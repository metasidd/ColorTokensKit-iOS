import SwiftUI
import ColorTokensKit

struct ColorSystemComparisonView: View {
    // Using all hues to create a rainbow
    let hues = Color.allProHues.sorted(by: { $0.value.h < $1.value.h }).filter({ $0.value != Color.gray })
    
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
                        colors: hues.map { $0.value._45 },
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
