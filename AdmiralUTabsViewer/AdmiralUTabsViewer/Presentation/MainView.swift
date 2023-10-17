//  MainView.swift
//  ExampleiOS
//
//  Created on 15.06.2022.

import SwiftUI
import AdmiralTheme

struct MainView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(TabsSwiftUIItem.allCases, id: \.id) { item in
                    NavigationLink(destination: view(for: item)) {
                        HStack(alignment: .center) {
                            Text(item.title)
                                .font(.headline)
                            Spacer()
                        }
                    }
                }
            }
        }
        .navigationTitle("Список элементов")
    }
    
    @ViewBuilder
    func view(for type: TabsSwiftUIItem) -> some View {
        switch type {
        case .standard:
            StandardTabSwiftUIView()
        case .underlineSlider:
            UnderlineTabsUIView()
        case .logo:
            LogoTabSwiftUIView()
        case .outlineSlider:
            OutlineSliderTabSwiftUITab()
        case .informer:
            InformerTabSwiftUIView()
        case .icon:
            IconTabsSwiftUI()
        }
    }
}
