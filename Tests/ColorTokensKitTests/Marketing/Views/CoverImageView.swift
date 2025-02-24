import ColorTokensKit
import SwiftUI

struct CoverImageView: View {
    private let hueSteps: Int = 12
    private let gridSpacing: Double = 0
    private let colorSize: Double = 80
    
    var hues: [(name: String, colors: [LCHColor])] {
        (0 ... hueSteps).map { step in
            let hue = Double(step) * (360.0 / Double(hueSteps))
            let stops = ColorRampGenerator().getColorRamp(forHue: hue)

            // Safely get middle stop or use default
            let midPoint = stops.count > 0 ?
                stops[Int(stops.count / 2)] :
                LCHColor(lchString: "lch(70% 30 \(hue))")

            return (
                name: "H\(Int(hue))",
                colors: LCHColor(l: 70, c: midPoint.c, h: midPoint.h).allStops
            )
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: gridSpacing) {
            let sortedRamp = hues.sorted { $0.colors.first?.h ?? 0 < $1.colors.first?.h ?? 0 }
            
            ForEach(Array(sortedRamp.enumerated()), id: \.offset) { index, element in
                colorRow(for: element.colors)
            }
        }
        .padding(0)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private func colorRow(for colors: [LCHColor]) -> some View {
        HStack(spacing: gridSpacing) {
            let shuffledColors = slightlyShuffle(colors)
            let halfCount = shuffledColors.count / 2
            var shapes = Array(repeating: true, count: halfCount) + Array(repeating: false, count: shuffledColors.count - halfCount)
            
            // Shuffle shapes to randomly distribute circles and squares
            shapes.shuffle()
            
            return HStack(spacing: gridSpacing) {
                ForEach(shuffledColors.indices, id: \.self) { index in
                    let isCircle = shapes[index]
                    colorBlock(for: shuffledColors[index], isCircle: isCircle)
                }
            }
        }
    }

    private func colorBlock(for color: LCHColor, isCircle: Bool) -> some View {
        return RoundedRectangle(cornerRadius: isCircle ? colorSize/2 : colorSize/4)
            .fill(color.toColor())
            .frame(
                maxWidth: isCircle ? colorSize : colorSize * 1.5,
                maxHeight: colorSize
            )
    }

    private func slightlyShuffle(_ colors: [LCHColor]) -> [LCHColor] {
        var shuffledColors = colors
        for i in shuffledColors.indices {
            let swapIndex = i + Int.random(in: -1...1) // Slight shuffle range
            if swapIndex >= 0 && swapIndex < shuffledColors.count {
                shuffledColors.swapAt(i, swapIndex)
            }
        }
        return shuffledColors
    }
}

private struct AnyShape: Shape {
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
