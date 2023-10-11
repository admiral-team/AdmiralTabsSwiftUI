//
//  NavigationContentViewScheme.swift
//  ExampleiOS
//
//  Created on 04.12.2021.
//

import AdmiralTheme

struct NavigationContentViewScheme: AppThemeScheme {
    var backButtonColor: AColor
    
    init(theme: AppTheme) {
        backButtonColor = theme.colors.elementAccent
    }
}
