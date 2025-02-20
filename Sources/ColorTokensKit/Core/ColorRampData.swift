import Foundation

public struct ColorStop {
    public let l: Double
    public let c: Double
    public let h: Double
    
    public init(lchString: String) {
        // Parse "lch(97% 4.3 0)" format
        let pattern = #"lch\((\d+\.?\d*)%\s+(\d+\.?\d*)\s+(\d+\.?\d*)\)"#
        let regex = try! NSRegularExpression(pattern: pattern)
        let range = NSRange(lchString.startIndex..<lchString.endIndex, in: lchString)
        
        if let match = regex.firstMatch(in: lchString, range: range) {
            let l = Double(lchString[Range(match.range(at: 1), in: lchString)!]) ?? 70
            let c = Double(lchString[Range(match.range(at: 2), in: lchString)!]) ?? 30
            let h = Double(lchString[Range(match.range(at: 3), in: lchString)!]) ?? 0
            
            // Validate and clamp values to valid ranges
            self.l = max(0, min(l, 100))
            self.c = max(0, min(c, 128))
            self.h = (h.truncatingRemainder(dividingBy: 360) + 360).truncatingRemainder(dividingBy: 360)
        } else {
            print("Failed to parse LCH string: \(lchString)")
            // Use safe defaults
            self.l = 70
            self.c = 30
            self.h = 0
        }
    }
    
    // Add convenience initializer with validation
    public init(l: Double, c: Double, h: Double) {
        self.l = max(0, min(l, 100))
        self.c = max(0, min(c, 128))
        self.h = (h.truncatingRemainder(dividingBy: 360) + 360).truncatingRemainder(dividingBy: 360)
    }
}

// Make internal since it's just used internally
public struct ColorRamp {
    public let name: String
    public let stops: [String: ColorStop]
    
    public init(name: String, stops: [String: ColorStop]) {
        self.name = name
        self.stops = stops
    }
}

// Keep public as it's the main interface
public struct ColorPalettes: Codable {
    private var palettes: [String: [String: String]]
    
    // Keep public as it's the API surface
    public var colorRamps: [ColorRamp] {
        palettes.map { name, stops in
            ColorRamp(
                name: name,
                stops: stops.mapValues { ColorStop(lchString: $0) }
            )
        }
    }
    
    public init(from decoder: Decoder) throws {
        // Decode the top-level dictionary directly
        let container = try decoder.singleValueContainer()
        palettes = try container.decode([String: [String: String]].self)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(palettes)
    }
}

public enum ColorRampLoader {
    // Cache the loaded palettes
    private static var cachedPalettes: ColorPalettes?
    
    public static func loadColorRamps() -> ColorPalettes? {
        // Return cached version if available
        if let cached = cachedPalettes {
            return cached
        }
        
        guard let url = Bundle.module.url(forResource: "ColorPalettes", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Failed to load ColorPalettes.json")
            return nil
        }
        
        do {
            let palettes = try JSONDecoder().decode(ColorPalettes.self, from: data)
            cachedPalettes = palettes // Cache the loaded palettes
            return palettes
        } catch {
            print("Failed to decode ColorPalettes.json: \(error)")
            return nil
        }
    }
} 
