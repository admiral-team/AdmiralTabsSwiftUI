//
//  UnderlineTabsUIView.swift
//  ExampleiOS
//
//  Created on 23.05.2022.
//

import SwiftUI
import AdmiralTheme

@available(iOS 14.0.0, *)
struct UnderlineTabsUIView: View {
    
    @State private var selection: Int?
    @ObservedObject private var schemeProvider = AppThemeSchemeProvider<SwiftUIContentViewScheme>()
    
    var body: some View {
        let scheme = schemeProvider.scheme
        NavigationContentView(navigationTitle: "UnderlineTabs") {
            scheme.backgroundColor.swiftUIColor
                .edgesIgnoringSafeArea(.all)
            List {
                ForEach(UnderlineTabsItem.allCases, id: \.self) { item in
                    NavigationLink(destination: view(for: item)) {
                        HStack(alignment: .center) {
                            Text(item.title)
                                .font(.headline)
                            Spacer()
                        }
                    }
                    .onTapGesture {
                        withAnimation {
                            self.selection = item.rawValue
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func view(for type: UnderlineTabsItem) -> some View {
        switch type {
        case .slider:
            UnderlineSliderTabSwiftUIView()
        case .center:
            UnderlineCenterTabSwiftUIView()
        }
    }
}
