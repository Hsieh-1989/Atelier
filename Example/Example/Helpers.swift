import UIKit
import Atelier

// MARK: - AnyColorBrush
struct AnyColorBrush: Hashable, Identifiable {
    var id: String { name }
    let name: String
    let color: UIColor
}

extension AnyColorBrush {
    init<Brush: ColorBrush>(_ brush: Brush) {
        self.name = String(describing: brush)
        self.color = brush.loadColor()
    }
}

// MARK: - AnyImageBrush
struct AnyImageBrush: Identifiable {
    var id: String { name }
    let name: String
    let image: () -> UIImage
}

extension AnyImageBrush {
    init<Brush: ImageBrush>(_ brush: Brush) {
        self.name = String(describing: brush)
        self.image = brush.loadColor
    }
}

// MARK: - UIColor => Hex
extension UIColor {
    func hexString() -> String  {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return String(
            format: "#%02X%02X%02X%02X",
            Int(round(r * 255)),
            Int(round(g * 255)),
            Int(round(b * 255)),
            Int(round(a * 255))
        )
    }
}

// MARK: - Default Image Bundle
extension ImageBrush {
    var bundle: Bundle { .main }
}
