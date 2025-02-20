//
//  Constants.swift
//
//
//  Created by Siddhant Mehta on 2024-06-10.
//

import Foundation

public enum ColorConstants {
    // Color space constants
    static let RAD_TO_DEG = 180 / Double.pi
    static let LAB_E: CGFloat = 0.008856
    static let LAB_16_116: CGFloat = 0.1379310
    static let LAB_K_116: CGFloat = 7.787036
    static let LAB_X: CGFloat = 0.95047
    static let LAB_Y: CGFloat = 1
    static let LAB_Z: CGFloat = 1.08883
    
    // Color ramp constants
    static let DEFAULT_ALPHA: CGFloat = 1.0
    static let HUE_RANGE: ClosedRange<Double> = 0...360
    static let LIGHTNESS_RANGE: ClosedRange<Double> = 0...100
    static let CHROMA_RANGE: ClosedRange<Double> = 0...128
}
