import UIKit

extension UIImage {
    /// Create an image by light & dark image, according to the userInterfaceStyle
    /// - Parameters:
    ///   - lightModeImageNamed: The name of the image used in the light mode
    ///   - darkModeImageNamed: The name of the image used in the dark mode
    ///   - bundle: The bundle that stored the image
    /// - Returns: An image according to the userInterfaceStyle
    public static func dynamic(
        light lightModeImageNamed: String,
        dark darkModeImageNamed: String,
        in bundle: Bundle
    ) -> UIImage {
        guard let lightImage = UIImage(named: lightModeImageNamed, in: bundle, with: nil) else {
            return UIImage(named: darkModeImageNamed, in: bundle, with: nil) !? UIImage()
        }
        
        guard let darkImage = UIImage(named: darkModeImageNamed, in: bundle, with: nil) else {
            return lightImage
        }
        
        return .dynamic(light: lightImage, dark: darkImage)
    }
    
    /// Create an image by light & dark image, according to the userInterfaceStyle
    /// - Parameters:
    ///   - lightModeImage: The image used in the light mode
    ///   - darkModeImage: The image used in the dark mode
    /// - Returns: An image according to the userInterfaceStyle
    public static func dynamic(
        light lightModeImage: UIImage,
        dark darkModeImage: UIImage
    ) -> UIImage {
        let asset = UIImageAsset()
        asset.register(lightModeImage, with: .init(userInterfaceStyle: .light))
        asset.register(darkModeImage, with: .init(userInterfaceStyle: .dark))
        return asset.image(with: .current)
    }
}
