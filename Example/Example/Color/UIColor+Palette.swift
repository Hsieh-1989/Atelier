import UIKit
import Atelier

// MARK: - Basic Color Group
enum DefaultColors: CaseIterable, ColorBrush {
    case red
    case orange
    case yellow
    case green
    case cyan
    case blue
    case purple
    case brown
    
    func loadColor() -> UIColor {
        switch self {
        case .red: return .red
        case .orange: return .orange
        case .yellow: return .yellow
        case .green: return .green
        case .cyan: return .cyan
        case .blue: return .blue
        case .purple: return .purple
        case .brown: return .brown
        }
    }
}

// MARK: - Hex Color
enum DefaultHexColors: String, CaseIterable, HexColorBrush {
    case red = "#FF0000FF"
    case orange = "#FF8000FF"
    case yellow = "#FFFF00FF"
    case green = "#00FF00FF"
    case cyan = "#00FFFFFF"
    case blue = "#0000FFFF"
    case purple = "#800080FF"
    case brown = "#996633FF"
}

// MARK: - DynamicColor
enum Gray: CaseIterable, DynamicColorBrush {
    case one
    case two
    case three
    case four
    case five
    case six
    
    func loadLightColor() -> UIColor {
        switch self {
        case .one: return .systemGray
        case .two: return .systemGray2
        case .three: return .systemGray3
        case .four: return .systemGray4
        case .five: return .systemGray5
        case .six: return .systemGray6
        }
    }
    
    func loadDarkColor() -> UIColor {
        switch self {
        case .one: return .systemGray
        case .two: return .systemGray2
        case .three: return .systemGray3
        case .four: return .systemGray4
        case .five: return .systemGray5
        case .six: return .systemGray6
        }
    }
}

// MARK: - DynamicHexColor
enum SystemColors: String, CaseIterable, DynamicHexColorBrush {
    case red = "#FF3B30FF, #FF453AFF"
    case orange = "#FF9500FF, #FF9F0AFF"
    case yellow = "#FFCC00FF, #FFD60AFF"
    case green = "#34C759FF, #30D158FF"
    case mint = "#00C7BEFF, #63E6E2FF"
    case teal = "#30B0C7FF, #40C8E0FF"
    case cyan = "#32ADE6FF, #64D2FFFF"
    case blue = "#007AFFFF, #0A84FFFF"
    case indigo = "#5856D6FF, #5E5CE6FF"
    case purple = "#AF52DEFF, #BF5AF2FF"
    case pink = "#FF2D55FF, #FF375FFF"
    case brown = "#A2845EFF, #AC8E68FF"
}

// MARK: - Color Palette
extension UIColor {
    
    @Palette(DefaultColors.self)
    static var `default`: ColorPalette
    
    @Palette(DefaultColors.self)
    static var defaultHex: ColorPalette
    
    @Palette(Gray.self)
    static var gray: ColorPalette
    
    @Palette(SystemColors.self)
    static var system: ColorPalette
}
