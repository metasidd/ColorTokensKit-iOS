import ColorTokensKit
import SwiftUI

struct CoverImageView: View {
    private let gridSpacing: Double = 8
    private let colorSize: Double = 64
    
    // Pre-select a fixed set of color ramps by picking alternate hues
    private var fixedColorRamps: [(name: String, colors: [LCHColor])] {
        let allHues = Color.allProHues
        let selectedHues = allHues.keys.sorted().enumerated().compactMap { index, hue in
            index % 2 == 0 ? hue : nil
        }
        return selectedHues.compactMap { hue in
            guard let colors = allHues[hue]?.allStops else { return nil }
            return (name: hue, colors: colors)
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: gridSpacing) {
            let sortedRamp = fixedColorRamps.sorted { $0.colors.first?.h ?? 0 < $1.colors.first?.h ?? 0 }
            
            titleView
            
            // First 5 rows
            ForEach(0..<5) { index in
                if index < sortedRamp.count {
                    colorRow(for: sortedRamp[index].colors)
                }
            }
            
            // Next 5 rows
            ForEach(5..<10) { index in
                if index < sortedRamp.count {
                    colorRow(for: sortedRamp[index].colors)
                }
            }
        }
        .padding(16)
        .background(Color.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var titleView: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 8) {
                Image(systemName: "swift")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 24)
                
                Text("Color Tokens for Swift")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            Text("Your one-stop shop for accessible and uniform colors")
                .font(.title)
                .opacity(0.7)
        }
        .fontDesign(.monospaced)
        .padding(.vertical, 16)
    }

    private func colorRow(for colors: [LCHColor]) -> some View {
        HStack(spacing: gridSpacing) {
            ForEach(slightlyShuffle(colors), id: \.self) { color in
                colorBlock(for: color)
            }
        }
    }

    private func colorBlock(for color: LCHColor) -> some View {
        let isCircle = Bool.random()
        return RoundedRectangle(cornerRadius: isCircle ? colorSize/2 : colorSize/4)
            .fill(color.toColor())
            .frame(
                width: isCircle ? colorSize: colorSize * 1.5,
                height: colorSize
            )
    }

    private func slightlyShuffle(_ colors: [LCHColor]) -> [LCHColor] {
        var shuffledColors = colors
        for i in shuffledColors.indices {
            let swapIndex = i + Int.random(in: -2...2)
            if swapIndex >= 0 && swapIndex < shuffledColors.count {
                shuffledColors.swapAt(i, swapIndex)
            }
        }
        return shuffledColors
    }
}

struct AnyShape: Shape {
    private let path: (CGRect) -> Path

    init<S: Shape>(_ shape: S) {
        self.path = { rect in
            shape.path(in: rect)
        }
    }

    func path(in rect: CGRect) -> Path {
        path(rect)
    }
}

#Preview {
    CoverImageView()
        .frame(width: ImageSize.width, height: ImageSize.height)
} 
