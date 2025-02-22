import SwiftUI

public enum ImageSize {
    static let width: CGFloat = 1920
    static let height: CGFloat = 1080
    static var size: CGSize { CGSize(width: width, height: height) }
}

public enum MarketingStyle {
    static let pagePadding: CGFloat = 64
    static let backgroundColor = Color.black.opacity(0.05)
}
