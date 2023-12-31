//
//  InformerTabSwiftUIView.swift
//  ExampleiOS
//
//  Created on 27.04.2021.
//

import SwiftUI
import AdmiralCore
import AdmiralTheme
import AdmiralTabsSwiftUI

@available(iOS 14.0.0, *)
struct InformerTabSwiftUIView: View {

    enum Constants {
        static let tabFormatAccessibilityValue = "%@. Page %i of %i"
    }
    
    @State private var isEnabledControlsState: Int = 0
    @State private var isTwoItemControlsState: Int = 0
    @State private var isThreeItemControlsState: Int = 0
    @ObservedObject private var schemeProvider = AppThemeSchemeProvider<SwiftUIContentViewScheme>()
    
    public var body: some View {
        let scheme = schemeProvider.scheme
        NavigationContentView(navigationTitle: "Informer Tabs") {
            scheme.backgroundColor.swiftUIColor
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    Spacer()
                }
                StandardTab(items: [StandartTabItem(text: "Default", accessibilityId: "SegmentControlDefault"),
                                    StandartTabItem(text: "Disabled", accessibilityId: "SegmentControlDisabled")],
                            selection: $isEnabledControlsState)
                .padding()
                Spacer()
                    .frame(height: LayoutGrid.doubleModule)
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: LayoutGrid.doubleModule) {
                        Text("Two controls")
                            .padding(.horizontal, LayoutGrid.doubleModule)
                            .foregroundColor(scheme.textColor.swiftUIColor)
                            .font(scheme.textFont.swiftUIFont)
                        VStack(alignment: .leading) {
                            InformerTab(
                                items: [InformerSegmentedItem(title: "2 900 ₽", subtitle: "в месяц", accessibilityId: "TwoControlsFirst"),
                                        InformerSegmentedItem(title: "2 900 ₽", subtitle: "в месяц", accessibilityId: "TwoControlsSecond")],
                                customView: AnyView(InfoSwiftUIView(
                                                        title: .constant("то получу в страховом случае"),
                                                        subtitle: .constant("до 1 500 000 ₽"),
                                                        description: .constant("Выгодный вариант для  двухкомнатной квартиры или дачного дома"
                                                        ))),
                                selection: $isTwoItemControlsState,
                                offsetSegment: .constant(LayoutGrid.doubleModule)
                            )
                                .disabled(isEnabledControlsState != 0)
                            Spacer()
                        }
                    }
                    Spacer()
                        .frame(height: LayoutGrid.tripleModule)
                    
                    
                    VStack(alignment: .leading, spacing: 16.0) {
                        Text("Three controls")
                            .padding(.horizontal, 16.0)
                            .font(scheme.textFont.swiftUIFont)
                            .foregroundColor(scheme.textColor.swiftUIColor)
                        VStack(alignment: .leading) {
                            InformerTab(items: [InformerSegmentedItem(title: "2 900 ₽", subtitle: "в месяц", accessibilityId: "ThreeControlsFirst"),
                                                InformerSegmentedItem(title: "2 900 ₽", subtitle: "в месяц", accessibilityId: "ThreeControlsSecond"),
                                                InformerSegmentedItem(title: "2 900 ₽", subtitle: "в месяц", accessibilityId: "ThreeControlsThird")],
                                        customView: AnyView(InfoSwiftUIView(
                                            title: .constant("то получу в страховом случае"),
                                            subtitle: .constant("до 1 500 000 ₽"),
                                            description:
                                                    .constant("Выгодный вариант для  двухкомнатной квартиры или дачного дома"
                                                             ))),
                                        selection: $isThreeItemControlsState,
                                        offsetSegment: .constant(16.0)
                            )
                                .disabled(isEnabledControlsState != 0)
                            Spacer()
                        }
                    }
                }
                Spacer()
            }
        }
    }
    
}
