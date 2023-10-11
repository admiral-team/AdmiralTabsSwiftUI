//
//  SizePreferenceKey.swift
//  AdmiralSwiftUI
//
//  Created on 19.04.2021.
//

import SwiftUI

public struct SizePreferenceKey: PreferenceKey {
    public typealias Value = CGSize
    public static var defaultValue: CGSize = .zero
    public static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        let next = nextValue()
        value.width = value.width.rounded()
        if next == .zero {
            return
        }
        value = next
    }
}
