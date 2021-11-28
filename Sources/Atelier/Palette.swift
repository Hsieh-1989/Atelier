import UIKit
/// A property wrapper type that just wrap the `Brush` type.
///
///  `Palette` makes it easy to define your style sheet:
///
///
///     // define your color brush
///     enum Colors: String, HexColorBrush {
///         case red = "#FF0000FF"
///         case orange = "#FF8000FF"
///         case yellow = "#FFFF00FF"
///         case green = "#00FF00FF"
///         case cyan = "#00FFFFFF"
///         case blue = "#0000FFFF"
///         case purple = "#800080FF"
///         case brown = "#996633FF"
///     }
///
///     // wrapped it to the palette
///     extension UIColor {
///         @Palette(Colors.self)
///         static var palette: ColorPalette
///     }
///
///     // usage
///     view.backgroundColor = .palette(.red)
///
@propertyWrapper
public struct Palette<B: Brush> {
    public let wrappedValue: (B) -> B.Paint
    public init(_ brushType: B.Type) {
        self.wrappedValue = { $0.loadColor() }
    }
}
