import SwiftUI
import ColorTokensKit

struct SimpleCardView: View {
    private struct Animal {
        let name: String
        let species: String
        let cuteness: Int
        let napsPerDay: Int
        let snackTime: Int  // minutes per day
        let theme: LCHColor
        let emoji: String
    }
    
    private let animals: [Animal] = [
        Animal(name: "Charlie", species: "Dog",
              cuteness: 92, napsPerDay: 12, snackTime: 30,
              theme: Color.proRed, emoji: "🐕"),
        Animal(name: "Ziggy", species: "Fox",
              cuteness: 94, napsPerDay: 10, snackTime: 60,
               theme: Color.proGold, emoji: "🦊"),
        Animal(name: "Luna", species: "Cat",
              cuteness: 95, napsPerDay: 16, snackTime: 45,
               theme: Color.proYellow, emoji: "🐱"),
        Animal(name: "Hoppy", species: "Parrot",
              cuteness: 47, napsPerDay: 1, snackTime: 60,
               theme: Color.proGreen, emoji: "🦜"),
        Animal(name: "Bubbles", species: "Penguin",
              cuteness: 96, napsPerDay: 6, snackTime: 180,
              theme: Color.proBlue, emoji: "🐧"),
    ]
    
    var body: some View {
        HStack(spacing: 24) {
            ForEach(animals, id: \.name) { animal in
                makeThemedCard(animal: animal)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.horizontal)
        .padding(MarketingStyle.pagePadding)
    }
    
    private func makeThemedCard(animal: Animal) -> some View {
        let outlineGradient = LinearGradient(
            colors: [animal.theme.outlineSecondary, animal.theme.outlineTertiary],
            startPoint: .top,
            endPoint: .bottom
        )
        let outlineGradient2 = LinearGradient(
            colors: [Color.backgroundPrimary, Color.clear],
            startPoint: .bottom,
            endPoint: .top
        )
        
        return VStack(alignment: .leading, spacing: 16) {
            // Animal Avatar
            Text(animal.emoji)
                .font(.system(size: 96))
            
            // Animal Info
            VStack(alignment: .leading, spacing: 16) {
                Text(animal.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(animal.theme.foregroundPrimary)
                
                // Fun Stats
                VStack(spacing: 16) {
                    statRow(label: "Cuteness", value: "\(animal.cuteness)%", theme: animal.theme)
                    statRow(label: "Naps/Day", value: "\(animal.napsPerDay)x", theme: animal.theme)
                    statRow(label: "Snack Time", value: "\(animal.snackTime)min", theme: animal.theme)
                }
            }
            .padding(.top, 32)
        }
        .padding(32)
        .frame(minWidth: 240)
        .background(animal.theme.backgroundPrimary)
        .cornerRadius(32)
        .overlay(
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .stroke(outlineGradient, lineWidth: 2)
        )
        .overlay(alignment: .topTrailing) {
            Text(animal.species)
                .font(.title2)
                .foregroundColor(animal.theme.invertedForegroundPrimary)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(animal.theme.invertedBackgroundTertiary)
                .clipShape(Capsule())
                .offset(x: -16, y: 16)
        }
        .shadow(color: animal.theme.surfaceSecondary, radius: 24, x: 0, y: 4)
        .fontDesign(.monospaced)
    }
    
    private func statRow(label: String, value: String, theme: LCHColor) -> some View {
        HStack {
            Text(label)
                .foregroundColor(theme.foregroundTertiary)
            Spacer()
            Text(value)
                .foregroundColor(theme.foregroundSecondary)
        }
        .font(.system(.title2, design: .rounded))
    }
}

#Preview {
    SimpleCardView()
        .frame(width: ImageSize.width, height: ImageSize.height)
        .background(Color.white)
} 
