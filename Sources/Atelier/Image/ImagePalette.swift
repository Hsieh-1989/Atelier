import UIKit

/// A closure the take a bush then generate a `UIImage`
public typealias ImagePalette<Brush: ImageBrush> = (Brush) -> UIImage
