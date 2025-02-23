import SwiftUI
import ColorTokensKit

struct ThemedCardView: View {
    var theme: LCHColor

    var body: some View {
        VStack {
            Text("Themed Card")
                .foregroundColor(theme.foregroundPrimary)
            Text("Accessible Content")
                .foregroundColor(theme.foregroundSecondary)
        }
        .padding()
        .background(theme.backgroundPrimary)
        .cornerRadius(10)
    }
}

struct ThemedCardViewPreview: View {
    var body: some View {
        VStack {
            ThemedCardView(theme: Color.proGray)
            ThemedCardView(theme: Color.proBlue)
            ThemedCardView(theme: Color.proGreen)
        }
        .padding()
    }
}

#Preview {
    ThemedCardViewPreview()
        .frame(width: 400, height: 300)
        .background(Color.white)
} 
