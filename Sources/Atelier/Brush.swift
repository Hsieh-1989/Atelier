/// Declares that a type can generate a specific value.
public protocol Brush {
    /// The kind of values you want to generate.
    associatedtype Paint
    
    /// Generate the value
    /// - Returns: The generated value
    func loadColor() -> Paint
}
