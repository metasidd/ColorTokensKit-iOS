//
//  Fonts+Ext.swift
//  ColorGenerator
//
//  Created by Siddhant Mehta on 2024-06-08.
//

import Foundation
import SwiftUI

enum FontConstants {
    static let fontStyle: Font.Design = .monospaced
}

public extension Font {
    /// Font size: 34 pts
    static func appXXXLargeBody(weight: Font.Weight = .heavy) -> Font {
        Font.system(Font.TextStyle.largeTitle, design: FontConstants.fontStyle, weight: weight)
    }

    /// Font size: 28 pts
    static func appXXLargeBody(weight: Font.Weight = .heavy) -> Font {
        Font.system(Font.TextStyle.title, design: FontConstants.fontStyle, weight: weight)
    }

    /// Font size: 22 pts
    static func appXLargeBody(weight: Font.Weight = .bold) -> Font {
        Font.system(Font.TextStyle.title2, design: FontConstants.fontStyle, weight: weight)
    }

    /// Font size: 20 pts
    static func appLargeBody(weight: Font.Weight = .bold) -> Font {
        Font.system(Font.TextStyle.title3, design: FontConstants.fontStyle, weight: weight)
    }

    /// Font size: 17 pts
    static func appBody(weight: Font.Weight = .regular) -> Font {
        Font.system(Font.TextStyle.body, design: FontConstants.fontStyle, weight: weight)
    }

    /// Font size: 15 pts
    static func appSmallBody(weight: Font.Weight = .medium) -> Font {
        Font.system(Font.TextStyle.subheadline, design: FontConstants.fontStyle, weight: weight)
    }

    /// Font size: 13 pts
    static func appCaption(weight: Font.Weight = .medium) -> Font {
        Font.system(Font.TextStyle.footnote, design: FontConstants.fontStyle, weight: weight)
    }

    /// Font size: 12 pts
    static func appMiniCaption(weight: Font.Weight = .medium) -> Font {
        Font.system(Font.TextStyle.caption, design: FontConstants.fontStyle, weight: weight)
    }

    /// Font size: 11 pts
    static func appXMiniCaption(weight: Font.Weight = .medium) -> Font {
        Font.system(Font.TextStyle.caption2, design: FontConstants.fontStyle, weight: weight)
    }
}
