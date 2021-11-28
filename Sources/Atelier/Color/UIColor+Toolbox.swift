import UIKit

extension UIColor {
    /// Use a string of hex to generate the color.
    /// - Parameter hex: the color hex string
    /// - Returns: The Color according to the hex string
    public static func hex(_ hex: String) -> UIColor? {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        
        let length = hexSanitized.count
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
        
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
            
        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
            
        } else {
            return nil
        }
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    /// Create Dynamic Color
    /// - Parameters:
    ///   - light: The Color in the light mode
    ///   - dark: The Color in the dark mode
    /// - Returns: the color could dynamic change according to the userInterfaceStyle
    public static func dynamicColor(
        light: @autoclosure @escaping () -> UIColor,
        dark: @autoclosure @escaping () -> UIColor
    ) -> UIColor {
        UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .light, .unspecified:
                return light()
            case .dark:
                return dark()
            @unknown default:
                return light()
            }
        }
    }
}
