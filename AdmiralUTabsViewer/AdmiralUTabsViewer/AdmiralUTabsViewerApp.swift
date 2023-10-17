//
//  AdmiralUTabsViewerApp.swift
//  AdmiralUTabsViewer
//
//  Created by Leonardo Vapagini on 11.10.2023.
//

import AdmiralTheme
import SwiftUI

@main
struct AdmiralUTabsViewerApp: App {
    init() {
        AdmiralTheme.Appearance.prepare()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
