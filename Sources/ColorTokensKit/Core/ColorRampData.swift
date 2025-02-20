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
            self.l = Double(lchString[Range(match.range(at: 1), in: lchString)!])!
            self.c = Double(lchString[Range(match.range(at: 2), in: lchString)!])!
            self.h = Double(lchString[Range(match.range(at: 3), in: lchString)!])!
        } else {
            self.l = 0
            self.c = 0
            self.h = 0
            print("Failed to parse LCH string: \(lchString)")
        }
    }
}

public struct ColorRamp {
    public let name: String
    public let stops: [String: ColorStop]
    
    public init(name: String, stops: [String: ColorStop]) {
        self.name = name
        self.stops = stops
    }
}

public struct ColorPalettes: Codable {
    // The JSON is directly a dictionary of color ramps
    private var palettes: [String: [String: String]]
    
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
    public static func loadColorRamps() -> ColorPalettes? {
        guard let url = Bundle.module.url(forResource: "ColorPalettes", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Failed to load ColorPalettes.json")
            return nil
        }
        
        do {
            let palettes = try JSONDecoder().decode(ColorPalettes.self, from: data)
            return palettes
        } catch {
            print("Failed to decode ColorPalettes.json: \(error)")
            return nil
        }
    }
} 
