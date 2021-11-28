# Atelier

A library that makes defines your style sheet like a breeze.

## Requirements

- iOS 13.0+
- Xcode 12.0+
- Swift 5.3+

## Installation

You can add Atelier to an Xcode project by adding it as a package dependency.

> https://github.com/Hsieh-1989/Atelier.git

If you want to use HSLayout in a [SwiftPM](https://swift.org/package-manager/) project, it's as simple as adding a `dependencies` clause to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Hsieh-1989/Atelier.git", from: "0.1.0")
]
```

## Examples

### Colors

Define your color palette:

```swift
// define your color brush
enum Colors: String, HexColorBrush {
    case red = "#FF0000FF"
    case orange = "#FF8000FF"
    case yellow = "#FFFF00FF"
    case green = "#00FF00FF"
    case cyan = "#00FFFFFF"
    case blue = "#0000FFFF"
    case purple = "#800080FF"
    case brown = "#996633FF"
}

// wrapped it to the palette
extension UIColor {
    @Palette(Colors.self)
    static var palette: ColorPalette
}

// usage
view.backgroundColor = .palette(.red)
```

### Image

Define your image palette:

```swift
// define your image brush
enum Shape: String, SystemImageBrush {
    case seal
    case circle
    case capsule
    case oval
}

// wrapped it to the palette
extension UIImage {
    @Palette(Shape.self)
    static var shape: ImagePalette
}

// usage
imageView.image = .shape(.seal)
```

### Categorize your assets!

One of the benefits of defining your own type to represent your assets is your can categorize them!

```swift
enum Bird: String, CaseIterable, NamedImageBrush {
    case budgie
    case dove
    ...
}

enum Dog: String, CaseIterable, NamedImageBrush {
    case corgi
    case poodle
    ...
}

enum Inset: String, CaseIterable, DynamicNamedImageBrush {
    case bee
    case bug
    ...
}

extension UIImage {
    @Palette(Bird.self)
    static var bird: ImagePalette
    
    @Palette(Dog.self)
    static var dog: ImagePalette
    
    @Palette(Inset.self)
    static var inset: ImagePalette
}
// usage
birdImageView.image = .bird(.budgie)
dogImageView.image = .dob(.corgi)
insetImageView.image = .inset(.bee)
```

### More Advanced Usage
You can check the `Example` App to see more examples!