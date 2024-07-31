# 🌈 ColorTokensKit 🌈
By designers, for developers. 

ColorTokensKit is a powerful design library that extends Swift's native capabilities by offering ergonomic access to the LCH color system, and 1000's of pre-defined colors built using the LCH color system. 

## Table of Contents
- [What are design tokens?](#what-are-design-tokens)
- [Why LCH is better than RGB, or the HSL system](#why-lch-is-better-than-rgb-or-the-hsl-system)
- [What does the code look like in practice?](#what-does-the-code-look-like-in-practice)
- [Setting them up](#setting-them-up)
  - [Step 1: Define a color ramp for your brand](#step-1-define-a-color-ramp-for-your-brand)
  - [Step 2: Pick your custom design tokens](#step-2-pick-your-custom-design-tokens)
  - [Step 3: Using them for UI](#step-3-using-them-for-ui)
- [Going beyond the basics](#going-beyond-the-basics)
  - [Defining your own tokens](#defining-your-own-tokens)
  - [Working with themes](#working-with-themes)
  - [Making exceptions for dark mode](#making-exceptions-for-dark-mode)
  - [Interpolating Colors](#interpolating-colors)
- [Sample Application](#sample-application)
- [Future ideas](#future-ideas)
- [License](#license)

<!-- Table of contents look good. Rest needs work. -->

## What are design tokens?
Design tokens are the fundamental building blocks of a design system. They represent the smallest, atomic decisions in your UI, such as colors, typography, spacing, and more. In the context of ColorTokensKit, we focus on color tokens. These tokens allow designers and developers to maintain consistency across an application, making it easier to update and maintain the visual language of your iOS app.

Imagine you have a primary color used for your brand. This color is used in various levels of brightness and saturation in various areas (backgrounds, text, hovers, buttons, onpress states etc).  Instead of hardcoding each of the color values in multiple places, you define a design token named `brandColor`. Now, whenever the brand color needs to be used, you just use `brandColor.backgroundPrimary`. If it needs to change, you update just one token value, and all instances of `brandColor` in your app automatically update. Design tokens ensure consistency and make it easier to maintain and update your design system.

```swift
Text("Hello to ColorTokensKit")
  .background(Color(red: 0.5, green: 0.5, blue: 1.0)) // Messy: Defining colors inline
  .background(Color.brandColorBackground) // Defining variables per application: Often hardcoded. Changing various values associated with brandColor is hard and impractical.
  .background(Color.brandColor.backgroundPrimary) // New way: Semantic naming that enables reusabusability, predictability and enables accessible colors. 
  // Behind the scenes, brandColor uses an LCH color system to get a specific color. It gets the "hue" value from `brandColor` and calculates an accessibile background according to a few defined primitives.
```

## How does LCH work? Why is it better than RGB, or the HSL system?
The LCH (_L_ightness, _C_hroma, _H_ue) color system offers significant advantages over RGB and HSL based initializers. LCH is "perceptually uniform", meaning changes in color values correspond more closely to how humans perceive color differences. This makes it easier to create harmonious color palettes, ensure proper contrast for accessibility, and make predictable color adjustments. Unlike RGB or HSL, LCH also supports a wider gamut of colors and provides more intuitive control over color properties, making it an excellent choice for modern iOS app development.

```swift
Text("Hello to ColorTokensKit")
    .background(Color("#8080FF")) // HEX: Handpicked colors that aren't easy to scale to various usecases. Lots of room for error
    .background(Color(red: 0.5, green: 0.5, blue: 1.0)) // RGB: Intuitive for computers, less so for humans; inconsistent brightness across colors
    .background(Color(h: 0.24, s: 0.32, l: 0.44)) // HSL: Better than RGB, but still inconsistent in perceived color intensity. Some colors like yellow are brighter than others, making it hard to read
    .background(Color(l: 0.32, c: 0.44, h: 0.9)) // LCH: Perceptually uniform; consistent brightness and saturation across hues
```

#### Example of an RGB color ramp
[Insert image]
#### Example of an LCH color ramp
[Insert image]


## Ok, show me how the ColorTokens kit works
ColorTokensKit is designed to be intuitive and easy to use in your Swift code. You can access pre-defined colors or create custom ones using a simple, expressive syntax. The library integrates seamlessly with SwiftUI and UIKit, allowing you to use color tokens in your views and UI components with minimal effort. Code example:

```swift
// A simple container with a name and a subtitle
// An extension on `Color` offers ready to use design tokens with a `Color.gray` color ramp
VStack {
  Text("Title")
    .foregroundStyle(Color.foregroundPrimary) // Uses the darkest text color available
  Text("Subtitle")
    .foregroundStyle(Color.foregroundSecondary) // Since it's a secondary piece of text, it uses a lighter shade available
}
.background(
  RoundedRectangle(cornerRadius: 16) // Creates a rounded rectangle container that works in light & dark mode
    .fill(Color.backgroundPrimary) // Uses `backgroundPrimary` as its base, resulting in a white background
    .stroke(Color.outlineTertiary, lineWidth: 1) // Uses the lightest gray outline for a border
)
```

```swift
import ColorTokensKit

let primaryColor = ColorTokens.primaryColor
let backgroundColor = ColorTokens.backgroundColor
let textColor = ColorTokens.textColor
```

## Introduction
The LCH color space (Lightness, Chroma, Hue) is a representation of colors that aligns more closely with human vision compared to other color spaces like RGB or HSL. This makes it an excellent choice for tasks requiring color manipulation and accessibility.

ColorKit provides a comprehensive set of tools to convert between various color spaces, interpolate colors, and use dynamic colors in SwiftUI and UIKit.

```swift
Text("Hello, World!")
    .padding()
    .background(Color(red: 0.5, green: 0.4, blue: 0.3))
    .foregroundColor(Color(red: 1.0, green: 1.0, blue: 1.0))
    .background(Color(red: 0.9, green: 0.9, blue: 0.9))
```

## Benefits of LCH Colors
- **Perceptual Uniformity:** LCH colors are designed to reflect how humans perceive color differences, making them ideal for ensuring color contrast and accessibility.
- **Better Color Manipulation:** Adjusting lightness, chroma, and hue in the LCH color space results in more predictable and visually consistent changes.
- **Improved Accessibility:** By using LCH colors, developers can create designs that are more accessible to users with color vision deficiencies.

## Usage Examples

### Converting Colors
ColorKit allows you to convert between different color spaces with ease. Here are some examples:

#### Convert RGB to LCH
```swift
import ColorKit

let rgbColor = RGBColor(r: 0.5, g: 0.4, b: 0.3, alpha: 1.0)
let lchColor = rgbColor.toLCH()
print(lchColor) // Output: LCHColor(l: 42.33, c: 29.65, h: 59.53, alpha: 1.0)
```

#### Convert LCH to UIColor
```swift
let lchColor = LCHColor(l: 42.33, c: 29.65, h: 59.53, alpha: 1.0)
let uiColor = lchColor.toColor()
print(uiColor) // Output: UIDeviceRGBColorSpace 0.5 0.4 0.3 1
```

### Interpolating Color
ColorKit also supports color interpolation, which can be useful for animations or generating color gradients.

#### Interpolate Between Two LCH Colors
```swift
let color1 = LCHColor(l: 42.33, c: 29.65, h: 59.53, alpha: 1.0)
let color2 = LCHColor(l: 52.33, c: 39.65, h: 69.53, alpha: 1.0)
let interpolatedColor = color1.lerp(color2, t: 0.5)
print(interpolatedColor) // Output: LCHColor(l: 47.33, c: 34.65, h: 64.53, alpha: 1.0)
```


### Setting Up Design Tokens
Design tokens are a great way to manage and apply consistent colors throughout your app. Here's how you can set up design tokens using ColorKit.
