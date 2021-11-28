import UIKit

// MARK: - ImageBrush

/// Declares that a type can generate a specific `UIImage`.
public protocol ImageBrush: Brush {
    func loadColor() -> UIImage
}

extension UIImage: ImageBrush {
    public func loadColor() -> UIImage { self }
}

// MARK: - SystemImageBrush

/// Declares that a type can generate system image by the `systemName`.
public protocol SystemImageBrush: ImageBrush {
    var systemName: String { get }
}

extension SystemImageBrush {
    public func loadColor() -> UIImage {
        UIImage(systemName: systemName) !? UIImage()
    }
}

extension SystemImageBrush where Self: RawRepresentable, RawValue == String {
    public var systemName: String { rawValue }
}

// MARK: - NamedImageBrush

/// Declares that a type can generate image in the specific bundle by it's name.
public protocol NamedImageBrush: ImageBrush {
    var imageName: String { get }
    var bundle: Bundle { get }
}

extension NamedImageBrush {
    public func loadColor() -> UIImage {
        UIImage(named: imageName, in: bundle, with: nil) !? UIImage()
    }
}

extension NamedImageBrush where Self: RawRepresentable, RawValue == String {
    public var imageName: String { rawValue }
}

// MARK: DynamicImageBrush

/// Declares that a type can generate different image according to the `UIUserInterfaceStyle`.
public protocol DynamicImageBrush: ImageBrush {
    func loadLightImage() -> UIImage
    func loadDarkImage() -> UIImage
}

extension DynamicImageBrush {
    public func loadColor() -> UIImage {
        .dynamic(light: loadLightImage(), dark: loadDarkImage())
    }
}

// MARK: DynamicNamedImageBrush

/// Declares that a type can generate different image by it's name in the specific bundle according to the `UIUserInterfaceStyle`.
public protocol DynamicNamedImageBrush: DynamicImageBrush {
    var lightImageName: String { get }
    var darkImageName: String { get }
    var bundle: Bundle { get }
}

extension DynamicNamedImageBrush {
    public func loadLightImage() -> UIImage {
        UIImage(named: lightImageName, in: bundle, with: nil) !? UIImage()
    }
    
    public func loadDarkImage() -> UIImage {
        UIImage(named: darkImageName, in: bundle, with: nil) !? UIImage()
    }
}

extension DynamicImageBrush where Self: RawRepresentable, RawValue == String {
    public var lightImageName: String {
        rawValue.split(separator: ",").first?.trimmingCharacters(in: .whitespaces) !? ""
    }
    
    public var darkImageName: String {
        rawValue.split(separator: ",").first?.trimmingCharacters(in: .whitespaces) !? ""
    }
}
