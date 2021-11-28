import UIKit
import Atelier

// MARK: - ImageBrush
enum Weather: CaseIterable, ImageBrush {
    case sun
    case cloud
    case rain
    case bolt
    
    func loadColor() -> UIImage {
        switch self {
        case .sun: return UIImage(systemName: "sun.min")!
        case .cloud: return UIImage(systemName: "cloud")!
        case .rain: return UIImage(systemName: "cloud.rain")!
        case .bolt: return UIImage(systemName: "cloud.bolt")!
        }
    }
}

// MARK: - SystemImageBrush
enum Shape: String, CaseIterable, SystemImageBrush {
    case seal
    case circle
    case capsule
    case oval
    case square
    case triangle
    case diamond
    case octagon
    case hexagon
}

// MARK: - NamedImageBrush
enum Bird: String, CaseIterable, NamedImageBrush {
    case budgie
    case dove
    case duck
    case falcon
    case flamingo
    case stork
}

// MARK: - DynamicImageBrush
enum Dog: String, CaseIterable, DynamicImageBrush {
    case borderCollie = "border-collie"
    case corgi = "corgi"
    case germanShepherd = "german-shepherd"
    case papillonDog = "papillon-dog"
    case poodle = "poodle"
    case shibaInu = "shiba-inu"
    
    func loadLightImage() -> UIImage {
        UIImage(named: rawValue)!
    }
    
    func loadDarkImage() -> UIImage {
        UIImage(named: "\(rawValue)-dark")!
    }
}

// MARK: - DynamicNamedImageBrush
enum Inset: String, CaseIterable, DynamicNamedImageBrush {
    case bee         = "bee,         bee-dark"
    case bug         = "bug,         bug-dark"
    case butterfly   = "butterfly,   butterfly-dark"
    case phasmatodea = "phasmatodea, phasmatodea-dark"
}

enum Inset2: String, CaseIterable, DynamicNamedImageBrush {
    case bee
    case bug
    case butterfly
    case phasmatodea
    
    var lightImageName: String { rawValue }
    var darkImageName: String { rawValue + "-dark" }
}

// MARK: - Image Palette
extension UIImage {
    @Palette(Weather.self)
    static var weather: ImagePalette
    
    @Palette(Shape.self)
    static var shape: ImagePalette
    
    @Palette(Bird.self)
    static var bird: ImagePalette
    
    @Palette(Dog.self)
    static var dog: ImagePalette
    
    @Palette(Inset.self)
    static var inset: ImagePalette
    
    @Palette(Inset2.self)
    static var inset2: ImagePalette
}
