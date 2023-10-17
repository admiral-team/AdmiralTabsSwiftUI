//
//  RectPreferenceKey.swift
//  AdmiralSwiftUI
//
//  Created on 23.04.2021.
//

import SwiftUI

public struct RectPreferenceKey: PreferenceKey {
    public typealias Value = CGRect
    public static var defaultValue: CGRect = .zero
    public static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
