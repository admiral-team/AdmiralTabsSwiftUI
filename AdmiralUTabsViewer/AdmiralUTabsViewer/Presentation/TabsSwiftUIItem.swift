//
//  TabsSwiftUIItem.swift
//  ExampleiOS
//
//  Created on 20.04.2021.
//

import SwiftUI

enum TabsSwiftUIItem: Int, CaseIterable {
    case standard
    case logo
    case informer
    case outlineSlider
    case underlineSlider
    case icon
    
    var title: String {
        switch self {
        case .standard:
            return "Standard Tabs"
        case .logo:
            return "Logo Tabs"
        case .informer:
            return "Informer Tabs"
        case .outlineSlider:
            return "Outline Slider Tabs"
        case .underlineSlider:
            return "Underline Tabs"
        case .icon:
            return "Icon Tabs"
        }
    }
    
    var id: UUID {
        return UUID()
    }
}
