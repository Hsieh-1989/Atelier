import UIKit

// MARK: - ColorBrush

/// Declares that a type can generate a specific `UIColor`.
public protocol ColorBrush: Brush {
    func loadColor() -> UIColor
}

extension UIColor: ColorBrush {
    public func loadColor() -> UIColor { self }
}

// MARK: - HexBrush

/// Declares that a type can represent it's color by hex value.
public protocol HexColorBrush: ColorBrush {
    var hexString: String { get }
}

extension HexColorBrush {
    public func loadColor() -> UIColor {
        .hex(hexString) !? .clear
    }
}

extension HexColorBrush where Self: RawRepresentable, RawValue == String {
    public var hexString: String { rawValue }
}

// MARK: - DynamicColorBrush

/// Declares that a type can generate different `UIColor` according to the `UIUserInterfaceStyle`.
public protocol DynamicColorBrush: ColorBrush {
    func loadLightColor() -> UIColor
    func loadDarkColor() -> UIColor
}

extension DynamicColorBrush {
    public func loadColor() -> UIColor {
        .dynamicColor(light: loadLightColor(), dark: loadDarkColor())
    }
}

// MARK: - DynamicHexColorBrush

/// Declares that a type can generate different color hex value according to the `UIUserInterfaceStyle`.
public protocol DynamicHexColorBrush: DynamicColorBrush {
    var lightHexString: String { get }
    var darkHexString: String { get }
}

extension DynamicHexColorBrush {
    public func loadLightColor() -> UIColor {
        .hex(lightHexString) !? .clear
    }
    
    public func loadDarkColor() -> UIColor {
        .hex(darkHexString) !? .clear
    }
}

extension DynamicHexColorBrush where Self: RawRepresentable, RawValue == String {
    public var lightHexString: String {
        rawValue.split(separator: ",").first?.trimmingCharacters(in: .whitespaces) !? ""
    }
    
    public var darkHexString: String {
        rawValue.split(separator: ",").last?.trimmingCharacters(in: .whitespaces) !? ""
    }
}
