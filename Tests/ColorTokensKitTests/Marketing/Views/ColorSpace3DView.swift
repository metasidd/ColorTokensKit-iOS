import SwiftUI
import ColorTokensKit
import AppKit

struct ColorSpace3DView: View {
    let interpolator = ColorRampInterpolator()
    let hueSteps = 16
    
    var colorRamps: [ColorRamp] {
        // Generate hues at regular intervals, but don't include the final point (360 degrees)
        (0..<hueSteps).map { step in
            let hue = Double(step) * (360.0 / Double(hueSteps))
            let stops = interpolator.getCalculatedColorRamp(forHue: hue)
            return ColorRamp(
                name: "H\(Int(hue))",
                stops: Dictionary(
                    uniqueKeysWithValues: stops.enumerated().map { index, stop in
                        ("\(index)", stop)
                    }
                )
            )
        }
    }
    
    static func renderSnapshot(size: CGSize) -> NSImage? {
        print("Starting Core Graphics render...")
        
        let image = NSImage(size: size)
        image.lockFocus()
        
        guard let context = NSGraphicsContext.current?.cgContext else {
            print("Failed to get graphics context")
            image.unlockFocus()
            return nil
        }
        
        // Fill background
        context.setFillColor(NSColor.white.cgColor)
        context.fill(CGRect(origin: .zero, size: size))
        
        // Set up coordinate system
        context.translateBy(x: size.width/6, y: size.height/4)
        
        // Scale up to make points bigger
        let scale: CGFloat = 4.0
        context.scaleBy(x: scale, y: scale)
        
        // Function to convert 3D to 2D coordinates with minimal tilt
        func project(_ x: CGFloat, _ y: CGFloat, _ z: CGFloat) -> CGPoint {
            let tilt = 0.2 // Subtle tilt factor
            return CGPoint(
                x: x + z * tilt,
                y: y - z * tilt // Negative z tilt to show height going up
            )
        }
        
        // Draw grid
        context.setStrokeColor(NSColor.gray.withAlphaComponent(0.1).cgColor)
        
        // Draw horizontal grid lines (X-Y plane)
        for y in stride(from: 0.0, through: 128.0, by: 16.0) {
            context.move(to: project(0, y, 0))
            context.addLine(to: project(360, y, 0))
            context.strokePath()
        }
        
        // Draw vertical grid lines (X-Y plane)
        for x in stride(from: 0.0, through: 360.0, by: 45.0) {
            context.move(to: project(x, 0, 0))
            context.addLine(to: project(x, 128, 0))
            context.strokePath()
        }
        
        // Draw height lines
        for x in stride(from: 0.0, through: 360.0, by: 45.0) {
            for y in stride(from: 0.0, through: 128.0, by: 16.0) {
                context.move(to: project(x, y, 0))
                context.addLine(to: project(x, y, 100))
                context.strokePath()
            }
        }
        
        // Save current transform for text
        context.saveGState()
        context.scaleBy(x: 1/scale, y: 1/scale) // Reset scale for text
        
        // Draw axes labels
        let font = NSFont.systemFont(ofSize: 12)
        let attrs: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: NSColor.black
        ]
        
        let textScale = scale // Scale factor for text positioning
        "Hue (0-360)".draw(at: project(180 * textScale, -30 * textScale, 0), withAttributes: attrs)
        "Chroma (0-128)".draw(at: project(-40 * textScale, 64 * textScale, 0), withAttributes: attrs)
        "Lightness (0-100)".draw(at: project(-40 * textScale, -30 * textScale, 50 * textScale), withAttributes: attrs)
        
        // Restore transform
        context.restoreGState()
        
        // Draw color points and connect them
        let colorSpace3D = ColorSpace3DView()
        let ramps = colorSpace3D.colorRamps
        
        // First draw the cross-hue connections
        for stopIndex in 0..<ramps[0].stops.count {
            // Only connect between adjacent hues, stopping before the last one
            for hueIndex in 0..<(ramps.count - 1) {
                let ramp1 = ramps[hueIndex]
                let ramp2 = ramps[hueIndex + 1]
                
                // Get corresponding stops from adjacent hues
                let stop1 = ramp1.stops.sorted { Int($0.key) ?? 0 < Int($1.key) ?? 0 }[stopIndex].value
                let stop2 = ramp2.stops.sorted { Int($0.key) ?? 0 < Int($1.key) ?? 0 }[stopIndex].value
                
                let point1 = project(CGFloat(stop1.h), CGFloat(stop1.c), CGFloat(stop1.l))
                let point2 = project(CGFloat(stop2.h), CGFloat(stop2.c), CGFloat(stop2.l))
                
                // Create gradient for the line
                let gradient = CGGradient(
                    colorsSpace: CGColorSpace(name: CGColorSpace.sRGB)!,
                    colors: [stop1.toColor().cgColor!, stop2.toColor().cgColor!] as CFArray,
                    locations: [0.0, 1.0]
                )!
                
                // Draw gradient line
                context.saveGState()
                context.setLineWidth(1.0) // Thinner lines for cross-hue connections
                
                // Create path for the line
                let path = CGMutablePath()
                path.move(to: point1)
                path.addLine(to: point2)
                
                // Add the path as a clip
                context.addPath(path)
                context.replacePathWithStrokedPath()
                context.clip()
                
                // Draw the gradient
                context.drawLinearGradient(
                    gradient,
                    start: point1,
                    end: point2,
                    options: []
                )
                
                context.restoreGState()
            }
        }
        
        // Then draw the original vertical connections and points
        for ramp in ramps {
            // Sort stops by key to ensure consistent line connections
            let sortedStops = ramp.stops.sorted { a, b in
                Int(a.key) ?? 0 < Int(b.key) ?? 0
            }
            
            // Draw lines connecting the points with gradients
            for i in 0..<(sortedStops.count - 1) {
                let stop1 = sortedStops[i].value
                let stop2 = sortedStops[i + 1].value
                
                let point1 = project(CGFloat(stop1.h), CGFloat(stop1.c), CGFloat(stop1.l))
                let point2 = project(CGFloat(stop2.h), CGFloat(stop2.c), CGFloat(stop2.l))
                
                // Create gradient for the line
                let gradient = CGGradient(
                    colorsSpace: CGColorSpace(name: CGColorSpace.sRGB)!,
                    colors: [stop1.toColor().cgColor!, stop2.toColor().cgColor!] as CFArray,
                    locations: [0.0, 1.0]
                )!
                
                // Draw gradient line
                context.saveGState()
                context.setLineWidth(2.0) // Keep vertical connections thicker
                
                // Create path for the line
                let path = CGMutablePath()
                path.move(to: point1)
                path.addLine(to: point2)
                
                // Add the path as a clip
                context.addPath(path)
                context.replacePathWithStrokedPath()
                context.clip()
                
                // Draw the gradient
                context.drawLinearGradient(
                    gradient,
                    start: point1,
                    end: point2,
                    options: []
                )
                
                context.restoreGState()
            }
            
            // Draw points last so they're on top
            for (_, stop) in sortedStops {
                let point = project(CGFloat(stop.h), CGFloat(stop.c), CGFloat(stop.l))
                
                // Draw point
                let pointSize: CGFloat = 3
                let rect = CGRect(
                    x: point.x - pointSize/2,
                    y: point.y - pointSize/2,
                    width: pointSize,
                    height: pointSize
                )
                
                context.setFillColor(stop.toColor().cgColor!)
                context.fillEllipse(in: rect)
                
                // Add black outline
                context.setStrokeColor(NSColor.black.withAlphaComponent(0.3).cgColor)
                context.setLineWidth(0.5)
                context.strokeEllipse(in: rect)
            }
        }
        
        image.unlockFocus()
        print("Core Graphics render completed")
        return image
    }
    
    var body: some View {
        Text("Color Space View")
            .frame(width: ImageSize.width, height: ImageSize.height)
            .background(Color.white)
    }
}

#Preview {
    ColorSpace3DView()
} 
