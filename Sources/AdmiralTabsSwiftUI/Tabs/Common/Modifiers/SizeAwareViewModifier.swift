//
//  SizeAwareViewModifier.swift
//  AdmiralSwiftUI
//
//  Created on 19.04.2021.
//

import SwiftUI

@available(iOS 14.0.0, *)
public struct BackgroundGeometryReader: View {
    public var body: some View {
        GeometryReader { geometry in
            return Color
                    .clear
                    .preference(key: SizePreferenceKey.self, value: geometry.size)
        }
    }
}

@available(iOS 14.0.0, *)
public struct SizeAwareViewModifier: ViewModifier {

    @Binding private var viewSize: CGSize

    init(viewSize: Binding<CGSize>) {
        self._viewSize = viewSize
    }

    public func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            return content
                .background(BackgroundGeometryReader())
                .onPreferenceChange(
                    SizePreferenceKey.self,
                    perform: {
                        if self.viewSize != $0 {
                            self.viewSize = $0
                        }
                    }
                )
                .eraseToAnyView()
        } else {
            return content
                .background(
                    GeometryReader { geometry -> Color in
                        guard self.viewSize != geometry.size else {
                            return Color.clear
                        }
                        DispatchQueue.main.async {
                            self.viewSize = geometry.size
                        }
                        return Color.clear
                    }
                )
                .eraseToAnyView()
        }
    }
}
