# 🌈 ColorTokensKit 🌈
By designers, for developers. 

![Cover Image](/Tests/ColorTokensKitTests/Exports/cover-image.png)

# Features

ColorTokensKit is a powerful design library that extends Swift's native capabilities by offering ergonomic access to the LCH color system, and 100's of pre-defined colors built using the LCH color system. 

- 📱 Designed for apps of all sizes
- ⭐️ Easy to use color token APIs
- 🎨 Pre-defined LCH color palettes
- 🤝 Built-in support for accessible contrast ratios
- 🌘 Built-in dark mode capability
- 🌈 Built-in theming for all apps
- 🎛️ Easy conversions between RGB/HSL/LCH/LAB/XYZ spaces
- 🕊️ No dependencies

# But wait, what are design tokens?
Design tokens are the fundamental building blocks of a design system. They represent the smallest, atomic decisions in your UI, such as colors, typography, spacing, and more. In the context of ColorTokensKit, we focus just on colors. 

![Color Grid](/Tests/ColorTokensKitTests/Exports/color-grid.png)

# What's LCH though? 
The LCH (**L**ightness, **C**hroma, **H**ue) color system offers significant advantages over RGB and HSL based initializers. LCH is "perceptually uniform", meaning changes in color values correspond more closely to how humans perceive color differences. This makes it easier to create harmonious color palettes, ensure proper contrast for accessibility, and make predictable color adjustments. Unlike RGB or HSL, LCH also supports a wider gamut of colors and provides more intuitive control over color properties, making it an excellent choice for modern iOS app development.

![Color System Comparison](/Tests/ColorTokensKitTests/Exports/color-system-comparison.png)

# Can you give me some examples?
Imagine you have a primary color used for your brand. This color is used in various levels of brightness and saturation in various areas (backgrounds, text, hovers, buttons, onpress states etc). 

Instead of hardcoding each of the color values in multiple places, you define a design token named `brandColor`. 

```swift
extension Color {
    var brandColor: LCHColor {
        LCHColor("#FF04DA") // The hex would represent your brand color
    }
}
```

Now, whenever the brand color needs to be used, you just use `brandColor.backgroundPrimary`. If the hue needs to change, you update just one token value, and all instances of `brandColor` in your app automatically update to the new colors. 

```swift
Text("Hello to ColorTokensKit")
  .background(Color(red: 0.5, green: 0.5, blue: 1.0)) // ❌ Messy & unscalable
  .background(Color.brandColorBackground) // ❌ Needs many variables, hard to maintain
  .background(Color.brandColor.backgroundPrimary) // ✅ Semantic naming, reusability, with accessible colors. 
```

Design tokens ensure consistency and make it easier to maintain and update your design system.

# Installation

ColorTokensKit provides a flexible framework for defining your own color stops and extensions. You can start by defining your own color tokens in your project. 

## Step 1: Install with SPM

Use `https://github.com/metasidd/ColorTokensKit.git` to install the package in your project.

## Step 2: Define Design Tokens
Copy-pasta these design tokens into your project, or create your own. An example is shown below.

```swift
public extension LCHColor {
    // Foreground colors
    var foregroundPrimary: Color {
        Color(light: _1000, dark:  _50)
    }
    var foregroundSecondary: Color {
        Color(light: _800, dark: _200)
    }
    var foregroundTertiary: Color {
        Color(light: _700, dark: _300) }

    // Inverted foreground colors
    var invertedForegroundPrimary: Color { 
        Color(light: _50, dark: _1000) 
    }
    var invertedForegroundSecondary: Color { 
        Color(light: _150, dark: _800) 
    }
    var invertedForegroundTertiary: Color { 
        Color(light: _250, dark: _700) 
    }

    // Backgroundcolors
    var backgroundPrimary: Color { 
        Color(light: _50, dark: _1000) 
    }
    var backgroundSecondary: Color { 
        Color(light: _100, dark: _800) 
    }
    var backgroundTertiary: Color { 
        Color(light: _200, dark: _700) 
    }
    
    // Surface colors
    var surfacePrimary: Color {
        Color(light: _200, dark: _700).opacity(0.5)
    }
    var surfaceSecondary: Color {
        Color(light: _200, dark: _700).opacity(0.3)
    }
    var surfaceTertiary: Color {
        Color(light: _200, dark: _700).opacity(0.1)
    }

    // Inverted surface colors
    var invertedSurfacePrimary: Color {
        Color(light: _400, dark: _600).opacity(0.4)
    }
    var invertedSurfaceSecondary: Color {
        Color(light: _400, dark: _600).opacity(0.2)
    }

    // Inverted background colors
    var invertedBackgroundPrimary: Color { 
        Color(light: _900, dark: _50) 
    }
    var invertedBackgroundSecondary: Color { 
        Color(light: _800, dark: _150) 
    }
    var invertedBackgroundTertiary: Color { 
        Color(light: _650, dark: _250) 
    }

    // Outline colors
    var outlinePrimary: Color { 
        Color(light: _300, dark: _700) 
    }
    var outlineSecondary: Color { 
        Color(light: _200, dark: _800)
    }
    var outlineTertiary: Color { 
        Color(light: _100, dark: _900) 
    }
}
```

## Step 3: Create Your Default Gray Ramp

Most of your app will have pieces of text, backgrounds, shadows, icons, and outlines. You can create a default gray ramp for your app by extending the `Color` type so you don't always have to type `.Color.proGray.foregroundPrimary`.

```swift
import SwiftUI
import ColorTokensKit

public extension Color {
    // Foreground colors
    static var foregroundPrimary: Color {
        .proGray.foregroundPrimary
    }

    static var foregroundSecondary: Color {
        .proGray.foregroundSecondary
    }

    static var foregroundTertiary: Color {
        .proGray.foregroundTertiary
    }

    // Inverted colors
    static var invertedForeground: Color {
        .proGray.invertedForegroundPrimary
    }

    static var invertedForegroundSecondary: Color {
        .proGray.invertedForegroundSecondary
    }

    static var invertedForegroundTertiary: Color {
        .proGray.invertedForegroundTertiary
    }

    // Background colors
    static var backgroundPrimary: Color {
        Color(light: .white, dark: .black) // Pure black and white
    }

    static var backgroundSecondary: Color {
        .proGray.backgroundSecondary
    }

    static var backgroundTertiary: Color {
        .proGray.backgroundTertiary
    }

    // Outline colors
    static var outlinePrimary: Color {
        .proGray.outlinePrimary
    }

    static var outlineSecondary: Color {
        .proGray.outlineSecondary
    }

    static var outlineTertiary: Color {
        .proGray.outlineTertiary
    }
}
```

# Examples

## Pills ([Example Code](/Tests/ColorTokensKitTests/Marketing/Views/PillView.swift))

The `PillView` demonstrates the benefits of using ColorTokensKit's color tokens. You can use the pre-defined color tokens below (like `Color.backgroundPrimary`, `Color.foregroundTertiary`, `Color.outlinePrimary`), or use the custom tokens you created in Step 2.

![Pill View](/Tests/ColorTokensKitTests/Exports/pill-view.png)

```swift
import ColorTokensKit

struct CardView: View {
    var body: some View {
        VStack {
            Text("Welcome to ColorTokensKit")
                .foregroundStyle(Color.foregroundPrimary) // Uses the most accessible color available for text
            Text("This is a subtitle")
                .foregroundStyle(Color.foregroundSecondary) // Uses a lighter shade of the foreground color
        }
        .background(Color.backgroundPrimary) // Uses the primary background color available
        .shadow(color: Color.outlineSecondary, radius: 5) // Uses the primary outline color available as a shadow
    }
}
```

## Themes & Dark mode ([Example Code](/Tests/ColorTokensKitTests/Marketing/Views/ThemedCardView.swift))
![Simple Card View](/Tests/ColorTokensKitTests/Exports/simple-card-view.png)
![Simple Card Dark Mode View](/Tests/ColorTokensKitTests/Exports/simple-card-dark-mode-view.png)

Theming is made extremely ergonomic with this approach. You can pass theme values as needed, and all children elements are dynamically assigned colors depending on the LCH color chosen.

```swift
import ColorTokensKit
import SwiftUI

struct ContentView: View {
  var body: some View {
    CardView() // Themeless
    CardView(theme: Color.proMint) // Mint theme
    CardView(theme: Color.proBlue) // Blue theme
    CardView(theme: Color.proGold) // Gold theme
    CardView(theme: Color.proRuby) // Ruby theme
    CardView(theme: LCHColor("#abcdef")) // Custom theme based on hex values
  }
}

struct CardView: View {
  let title: String
  let subtitle: String
  let theme: LCHColor // This could very well be an `@Environment var`. Whatever floats your boat.

  init(
    title: String, 
    subtitle: String,
    theme: LCHColor = Color.proGray // Default component could be themeless, or have a default hue
    ) {
      self.title = title
      self.subtitle = subtitle
      self.theme = theme
  }

  var body: some View {
    VStack {
      Text(title)
        .foregroundStyle(theme.foregroundPrimary) // Uses the darkest text color available
      Text(subtitle)
        .foregroundStyle(theme.foregroundSecondary) // Since it's a secondary piece of text, it uses a lighter shade available
    }
    .background(
      RoundedRectangle(cornerRadius: 16) // Creates a rounded rectangle container that works in light & dark mode
        .fill(theme.backgroundPrimary) // Uses `backgroundPrimary` as its base, resulting in a white background
        .stroke(theme.outlineTertiary, lineWidth: 1) // Uses the lightest gray outline for a border
    )
  }
}
```

# Utilities 

In addition to just using color tokens, we offer some easy conversions, and interpolations colors for niche usecases.

## Interpolating Colors
Transitioning colors using LCH offer much smoother color values.

```swift
let color1 = LCHColor(l: 40, c: 30, h: 60)
let color2 = LCHColor(l: 60, c: 60, h: 90)
let interpolatedColor = color1.lerp(color2, t: 0.5)
print(interpolatedColor) // Output: LCHColor(l: 50, c: 45, h: 75)
```

## Converting Colors
ColorKit allows you to convert between different color types - RGB, HSL, HEX, LCH, LAB, OKLAB, OKLCH etc. Here are some simple examples:

```swift

// HEX to Color
let color = Color(hex: "#abcdef")

// RGB to LCH Color
let rgbColor = Color(r: 0.5, g: 0.4, b: 0.3, alpha: 1.0)
let lchColor = LCHColor(color: rgbColor)

// HEX to LCH Color
let lchColor = LCHColor(hex: "#abcdef")

// HSL to LCH Color
let hslColor = Color(h: 50, s: 50, l: 50)
let lchColor = LCHColor(color: hslColor)

// LCH to RGB
let lchColor = LCHColor(l: 40, c: 30, h: 60)
let rgbColor: color = lchColor.toRGB()

// LCH to HEX
let lchColor = LCHColor(l: 40, c: 30, h: 60)
let hexColor: String = lchColor.toHex()

// LCH to UIColor
let lchColor = LCHColor(l: 42.33, c: 29.65, h: 59.53, alpha: 1.0)
let uiColor = lchColor.toColor()
print(uiColor) // Output: UIDeviceRGBColorSpace 0.5 0.4 0.3 1

```

## Future Ideas
- [ ] Offer `.lighten()`, `.darken()`, `.saturate()` and `.desaturate()` for LCH Colors
- [ ] Create smooth gradients using LCH colors
- [ ] Add resource links to Read Me
- [ ] Basic Unit Tests
- [ ] UI Snapshot Tests
- [ ] Example Figma
- [ ] Custom Lightness, Chroma or Hue curves
- [ ] Any other feedback?

## License
The source code for the site is licensed under the MIT license, which you can find in the MIT-LICENSE.txt file.
