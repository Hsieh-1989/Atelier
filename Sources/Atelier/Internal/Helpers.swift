// MARK: Optional
infix operator !?

func !? <T>(wrapped: T?, nilDefault: @autoclosure () -> T) -> T {
    guard let value = wrapped else {
        assertionFailure()
        return nilDefault()
    }
    return value
}
