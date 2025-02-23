import SwiftUI
import ColorTokensKit

struct SimpleCardView: View {
    var body: some View {
        HStack {
            VStack {
                Text("Light Mode")
                    .foregroundColor(.foregroundPrimary)
                Text("Secondary Text")
                    .foregroundColor(.foregroundSecondary)
            }
            .padding()
            .background(Color.backgroundPrimary)
            .cornerRadius(10)
            
            VStack {
                Text("Dark Mode")
                    .foregroundColor(.invertedForeground)
                Text("Secondary Text")
                    .foregroundColor(.invertedForegroundSecondary)
            }
            .padding()
            .background(Color.foregroundPrimary)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    SimpleCardView()
        .frame(width: 400, height: 200)
        .background(Color.white)
} 
