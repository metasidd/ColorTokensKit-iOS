//
//  Playground.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-16.
//

import SwiftUI
import ColorTokensKit

struct Playground: View {
    private let hex = "#abcdef"
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                titleView(
                    title: "Conversions from Hex"
                )
                
                colorView(
                    title: "Hex to RGBColor to LCH",
                    color: RGBColor(
                        color: Color(
                            hex: hex
                        )
                    ).toLCH().toColor()
                )
                
                colorView(
                    title: "Hex to LCH Color",
                    color: LCHColor(color: Color(hex: hex)).toColor()
                )
                
                colorView(
                    title: "LCH to LAB to XYZ to OKLAB to OKLCH Color",
                    color: getColor(inputColor: Color(hex: hex))
                )
                
                titleView(
                    title: "Fixed colors"
                )
                
                colorView(
                    title: "Hex Color \(hex)",
                    color: Color(
                        hex: hex
                    )
                )
                colorView(
                    title: "RGB Color",
                    color: Color(
                        red: 0.67,
                        green: 0.80,
                        blue: 0.94
                    )
                )
                colorView(
                    title: "HSL Color",
                    color: Color(
                        h: 211.3,
                        s: 0.697,
                        l: 0.806
                    )
                )
                colorView(
                    title: "LCH Color",
                    color: LCHColor(
                        l: 80.77,
                        c: 21.57,
                        h: 254.01
                    ).toColor()
                )
                colorView(
                    title: "OkLAB Color",
                    color: OklabColor(
                        l: 0.835,
                        a: -0.022,
                        b: -0.056
                    ).toXYZ().toLCH().toColor()
                )
                colorView(
                    title: "OkLCH Color",
                    color: OKLCHColor(
                        l: 0.835,
                        c: 0.06,
                        h: 248.55
                    ).toOklab().toXYZ().toLCH().toColor()
                )
                
            }
            .font(.appSmallBody())
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private func titleView(title: String) -> some View {
        Text(title)
            .padding(.vertical, 16)
            .font(.appXXLargeBody())
    }
    
    private func colorView(title: String, color: Color) -> some View {
        VStack(alignment: .leading) {
            Text(title)
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(color)
                .frame(height: 64)
        }
        .padding(.top, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func getColor(inputColor: Color) -> Color {
        print("STARTING GET COLOR:")
        
        let lchColor = LCHColor(color: inputColor)
        print("LCH Color Values:")
        lchColor.printValues()
        print("")
        
        let labColor = LCHColor(color: inputColor).toLAB()
        print("LAB Color Values:")
        labColor.printValues()
        print("")
        
        let xyzColor = labColor.toXYZ()
        print("XYZ Color Values:")
        xyzColor.printValues()
        print("")
        
        let okLabColor = xyzColor.toOklab()
        print("OKLAB Color Values:")
        okLabColor.printValues()
        print("")
        
        let okLChColor = okLabColor.toOKLCH()
        print("OKLCH Color Values:")
        okLChColor.printValues()
        print("")
        
        return okLChColor.toOklab().toXYZ().toLCH().toColor()
    }
}

#Preview {
    Playground()
}
