# 🌈 ColorTokensKit 🌈
#### 🚧 STABLE RELEASE COMING SOON 🚧

![Cover Image](/Tests/ColorTokensKitTests/Exports/cover-image.png)

By designers, for developers. 

ColorTokensKit is a powerful design library that extends Swift's native capabilities by offering ergonomic access to the LCH color system, and 100's of pre-defined colors built using the LCH color system. 

- [What are design tokens?](#what-are-design-tokens)
- [How does LCH work?](#how-does-lch-work)
- [Simple Example](#simple-example)
- [Setting it up](#setting-it-up)
- [Using them in the UI](#using-them-in-the-ui)
- [Going beyond the basics](#going-beyond-the-basics)
  - [Working with themes](#working-with-themes)
  - [Making exceptions for dark mode](#making-exceptions-for-dark-mode)
  - [Interpolating Colors](#interpolating-colors)
  - [Convenience Functions](#convenience-functions)
- [Sample Application](#sample-application)
- [Future ideas](#future-ideas)
- [License](#license)

## What are design tokens?
Design tokens are the fundamental building blocks of a design system. They represent the smallest, atomic decisions in your UI, such as colors, typography, spacing, and more. In the context of ColorTokensKit, we focus on color tokens. 

![Cover Image](/Tests/ColorTokensKitTests/Exports/color-grid.png)

#### Let's take an example
Imagine you have a primary color used for your brand. This color is used in various levels of brightness and saturation in various areas (backgrounds, text, hovers, buttons, onpress states etc). Instead of hardcoding each of the color values in multiple places, you define a design token named `brandColor`. Now, whenever the brand color needs to be used, you just use `brandColor.backgroundPrimary`. If it needs to change, you update just one token value, and all instances of `brandColor` in your app automatically update. Design tokens ensure consistency and make it easier to maintain and update your design system.

```swift
Text("Hello to ColorTokensKit")
  .background(Color(red: 0.5, green: 0.5, blue: 1.0)) // Messy: Defining colors inline
  .background(Color.brandColorBackground) // Custom Variables: Often hardcoded. Changing various values associated with brandColor is hard and impractical.
  .background(Color.brandColor.backgroundPrimary) // Design Tokens: Semantic naming that enables reusability, predictability and enables accessible colors. 
```

 Behind the scenes, `brandColor` uses an LCH color system to get a specific color. It gets the "hue" value from `brandColor` and calculates an accessible color ramp based on a few defined primitives.

## What is the LCH color system? 
The LCH (**L**ightness, **C**hroma, **H**ue) color system offers significant advantages over RGB and HSL based initializers. LCH is "perceptually uniform", meaning changes in color values correspond more closely to how humans perceive color differences. This makes it easier to create harmonious color palettes, ensure proper contrast for accessibility, and make predictable color adjustments. Unlike RGB or HSL, LCH also supports a wider gamut of colors and provides more intuitive control over color properties, making it an excellent choice for modern iOS app development.

#### RGB vs LCH color ramps
![Cover Image](/Tests/ColorTokensKitTests/Exports/color-system-comparison.png)

#### Let's take an example

```swift
Text("Hello to ColorTokensKit")
    .background(Color("#8080FF")) // HEX: Handpicked colors that aren't easy to scale to various use cases. Lots of room for error
    .background(Color(red: 0.5, green: 0.5, blue: 1.0)) // RGB: Inconsistent brightness across colors
    .background(Color(h: 0.24, s: 0.32, l: 0.44)) // HSL: Inconsistent color intensity. Some colors like yellow are brighter than others, making it hard to read
    .background(Color(l: 0.32, c: 0.44, h: 0.9)) // LCH: Perceptually uniform; consistent brightness and saturation across hues
```

## Setting it up

ColorTokensKit provides a flexible framework for defining your own color stops and extensions. You can start by defining your own color tokens in your project. Here's an example of how you might define these:

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

## Getting Started

#### Basic Example
Let's create a simple container with a name and a subtitle. An extension on `Color` offers ready-to-use design tokens with a `Color.proGray` color ramp.

You can use the pre-defined color tokens below (like `Color.backgroundPrimary`, `Color.foregroundTertiary`, `Color.outlinePrimary`), or create custom ones to your needs. The library integrates seamlessly with SwiftUI and UIKit, allowing you to use color tokens in your views and UI components with minimal effort. 

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
        .padding()
        .background(Color.backgroundPrimary) // Uses the primary background color available
        .cornerRadius(10)
        .shadow(color: Color.outlinePrimary, radius: 5) // Uses the primary outline color available as a shadow
    }
}
```

### Exceptions for Dark mode
Some things just translate 1:1 in dark mode. In that case, you can easily select a different design token for it.

For example, this approach below allows light mode to have themed green text, whereas dark mode would have dark gray text. The benefit of using the LCH system is that they'll offer the same levels of lightness to keep your UI looking beautiful.

```swift
struct CardView: View {
  @Environment(\.colorScheme) var colorScheme
  var body: some View {
    Text("Hello World")
      .foregroundStyle(colorScheme == .light ? Color.positive.foregroundPrimary : Color.foregroundSecondary)
  }
}
```

### Working with Themes
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
    // We have 22 pre-made `pro` colors available. 
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

### Interpolating Colors
Transitioning colors using LCH offer much smoother color values.

```swift
let color1 = LCHColor(l: 40, c: 30, h: 60)
let color2 = LCHColor(l: 60, c: 60, h: 90)
let interpolatedColor = color1.lerp(color2, t: 0.5)
print(interpolatedColor) // Output: LCHColor(l: 50, c: 45, h: 75)
```

### Convenience Functions
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

## Sample Application
Open `ColorGenerator.xcproject` from the File Explorer to explore the spectrum of colors.
[insert image of the application]

## Future Ideas
- [] Offer `.lighten()`, `.darken()`, `.saturate()` and `.desaturate()` for LCH Colors
- [] Create smooth gradients using LCH colors
- [] Add resource links to Read Me
- [] Basic Unit Tests
- [] UI Snapshot Tests
- [] Example Figma
- [] Custom Lightness, Chroma or Hue curves
- [] Any other feedback?

## License
The source code for the site is licensed under the MIT license, which you can find in the MIT-LICENSE.txt file.
