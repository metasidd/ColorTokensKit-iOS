import Foundation

// Make internal since it's just used internally
public struct ColorRamp {
    public let name: String
    public let stops: [String: LCHColor]
    
    public init(name: String, stops: [String: LCHColor]) {
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
                stops: stops.mapValues { LCHColor(lchString: $0) }
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
