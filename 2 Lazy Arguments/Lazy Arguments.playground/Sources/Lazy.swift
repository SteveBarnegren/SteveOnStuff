import Foundation

/*
public class Lazy<T> {
    
    private let calculateValue: () -> (T)
    private var cachedValue: T?
    
    public init(calculate: @escaping () -> (T)) {
        self.calculateValue = calculate
    }
    
    public var value : T {
        get {
            if cachedValue == nil {
                cachedValue = calculateValue()
            }
            return cachedValue!
        }
    }
}
 */

// Refactored
public class Lazy<T> {
    
    private indirect enum State<T> {
        case closure( () -> (T) )
        case value(T)
    }
    
    private var state: State<T>
    
    public init(calculate: @escaping () -> (T)) {
        self.state = .closure(calculate)
    }
    
    public var value : T {
        get {
            switch state {
            case .value(let value):
                return value
            case .closure(let closure):
                let result = closure()
                self.state = .value(result)
                return result
            }
        }
    }
}

