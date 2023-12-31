//
//  ArrowSegmentSlider.swift
//  AdmiralSwiftUI
//
//  Created on 28.04.2021.
//

import AdmiralTheme
import SwiftUI
/**
 ArrowSegmentSlider - the view that presents the arrow image in informerTab..
 You can create a ArrowSegmentSlider by specifying the following parameters in the initializer
 ## Initializer parameters:
- scheme - Binding<ArrowSegmentSliderScheme?>.  - the visual scheme of ArrowSegmentSlider.
 ## Example to create ArrowSegmentSlider:
 # Code
 ```
 ArrowSegmentSlider()
 ```
*/
@available(iOS 14.0.0, *)
public struct ArrowSegmentSlider: View {

    // MARK: - Constants

    enum Constants {
        static let imageSize = CGSize(width: 32.0, height: 12.0)
        static let arrowImage = Images.Custom.Segment.arrowUp.image
        static let animationDuration: Double = 0.3
    }

    // MARK: - Private Properties

    @ObservedObject private var schemeProvider: SchemeProvider<ArrowSegmentSliderScheme>

    // MARK: - Initializer

    public init(
        schemeProvider: SchemeProvider<ArrowSegmentSliderScheme> = AppThemeSchemeProvider<ArrowSegmentSliderScheme>()
    ) {
        self.schemeProvider = schemeProvider
    }

    // MARK: - Body

    public var body: some View {
        let scheme = schemeProvider.scheme
        Image(uiImage: Constants.arrowImage)
            .frame(width: Constants.imageSize.width)
            .frame(height: Constants.imageSize.height)
            .animation(Animation.easeInOut(duration: Constants.animationDuration))
            .foregroundColor(scheme.imageTintColor.swiftUIColor)
    }

}
