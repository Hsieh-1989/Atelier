import UIKit

/// A closure the take a bush then generate a `UIColor`
public typealias ColorPalette<Brush: ColorBrush> = (Brush) -> UIColor
