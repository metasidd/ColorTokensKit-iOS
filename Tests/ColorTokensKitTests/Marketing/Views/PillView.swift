import SwiftUI

struct PillView: View {
    var body: some View {
        HStack {
            Text("Primary Pill")
                .padding()
                .background(Color.backgroundPrimary)
                .foregroundColor(.foregroundPrimary)
                .clipShape(Capsule())
            
            Text("Secondary Pill")
                .padding()
                .background(Color.backgroundSecondary)
                .foregroundColor(.foregroundSecondary)
                .clipShape(Capsule())
            
            Text("Tertiary Pill")
                .padding()
                .background(Color.backgroundTertiary)
                .foregroundColor(.foregroundTertiary)
                .clipShape(Capsule())
        }
        .padding()
    }
}

#Preview {
    PillView()
        .frame(width: 400, height: 100)
        .background(Color.white)
} 