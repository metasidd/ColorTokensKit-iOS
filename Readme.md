# ColorTokensKit
Built by designers, for developers. 

ColorTokensKit is a powerful design library that extends Swift's native capabilities. It offers ergonomic access to 1000's of pre-defined colors built using the LCH color system. 

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
Design tokens are a way to store design-related information such as colors, typography, spacing, and more in a reusable and scalable manner. They help create a consistent design language across different platforms and ensure that design changes can be easily managed and propagated.

Imagine you have a primary color used for your brand. This color is used in various levels of brightness and saturation in various areas.  Instead of hardcoding each of the color values in multiple places, you define a design token named `primaryColor`. Now, whenever the primary color needs to change, you update just one token value, and all instances of `primaryColor` in your app automatically update. Design tokens ensure consistency and make it easier to maintain and update your design system.


## Why LCH is better than RGB, or the HSL system
The LCH color space (Lightness, Chroma, Hue) aligns more closely with human vision compared to RGB or HSL. This makes it ideal for tasks requiring color manipulation and accessibility. LCH colors are perceptually uniform, meaning, changes in lightness, chroma, or hue result in predictable visual changes. It keeps the yellows, and sky blues accessible and respectable.

- **RGB Values:** Setting colors with RGB can be unintuitive because it doesn't align well with human color perception. It can be challenging to predict the result of mixing or adjusting colors.
- **HEX Codes:** Using HEX codes can be convenient for web development but offers no insight into the relationships between colors or how they will be perceived.
- **HSL Values:** HSL allows for some manipulation of color properties, but it still doesn't offer perceptual uniformity, leading to unpredictable results when adjusting colors for design consistency and accessibility.

## What does the code look like in practice?
Using ColorTokensKit, you can define and use colors in a way that aligns with modern design practices. Here’s a quick example of how it looks in code:

```swift
import ColorTokensKit

let primaryColor = ColorTokens.primaryColor
let backgroundColor = ColorTokens.backgroundColor
let textColor = ColorTokens.textColor
```

## Introduction
The LCH color space (Lightness, Chroma, Hue) is a representation of colors that aligns more closely with human vision compared to other color spaces like RGB or HSL. This makes it an excellent choice for tasks requiring color manipulation and accessibility.

ColorKit provides a comprehensive set of tools to convert between various color spaces, interpolate colors, and use dynamic colors in SwiftUI and UIKit.
                                                                                                                            
In traditional approaches, developers often assign colors using RGB values (`Color(red: 0.5, green: 0.4, blue: 0.3)`), HEX codes (`#FF0045`), or HSL values (`H: 30, S: 20, L: 90`). This method can be less intuitive when trying to achieve consistent and accessible color palettes, as RGB doesn't align well with human color perception.

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
