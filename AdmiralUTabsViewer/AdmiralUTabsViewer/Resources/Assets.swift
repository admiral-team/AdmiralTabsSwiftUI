// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum Assets {
  public enum Card {
    public static let applePay = ImageAsset(name: "Card/applePay")
    public static let appleWallet = ImageAsset(name: "Card/appleWallet")
    public static let googlePay = ImageAsset(name: "Card/googlePay")
    public static let info = ImageAsset(name: "Card/info")
    public static let mir = ImageAsset(name: "Card/mir")
    public static let rnb = ImageAsset(name: "Card/rnb")
    public static let union = ImageAsset(name: "Card/union")
    public static let visa = ImageAsset(name: "Card/visa")
    public static let visaLabel = ImageAsset(name: "Card/visaLabel")
  }
  public enum IconTabs {
    public static let account = ImageAsset(name: "IconTabs/Account")
    public static let card = ImageAsset(name: "IconTabs/Card")
    public static let mobile = ImageAsset(name: "IconTabs/Mobile")
  }
  public enum Info {
    public static let helpSolid = ImageAsset(name: "Info/helpSolid")
  }
  public enum Tabs {
    public static let masterCardLogo = ImageAsset(name: "Tabs/masterCardLogo")
    public static let mirLogo = ImageAsset(name: "Tabs/mirLogo")
    public static let visaLogo = ImageAsset(name: "Tabs/visaLogo")
  }

  // swiftlint:disable trailing_comma
  public static let allImages: [ImageAsset] = [
    Card.applePay,
    Card.appleWallet,
    Card.googlePay,
    Card.info,
    Card.mir,
    Card.rnb,
    Card.union,
    Card.visa,
    Card.visaLabel,
    IconTabs.account,
    IconTabs.card,
    IconTabs.mobile,
    Info.helpSolid,
    Tabs.masterCardLogo,
    Tabs.mirLogo,
    Tabs.visaLogo,
  ]
  // swiftlint:enable trailing_comma
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public struct ImageAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  public var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  public func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

public extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
