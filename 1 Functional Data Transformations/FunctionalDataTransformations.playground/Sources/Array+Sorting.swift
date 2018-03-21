import Foundation

public extension Array where Element: Comparable {
    
    public func sortedAscending() -> [Element] {
        return sorted { $0 < $1 }
    }
    
    public func sortedDescending() -> [Element] {
        return sorted { $0 > $1 }
    }
    
    public mutating func sortAscending() {
        sort { $0 < $1 }
    }
    
    public mutating func sortDescending() {
        sort { $0 > $1 }
    }
}

public extension Array {
    
    public func sortedAscendingBy<T: Comparable>(_ key: (Element) -> T) -> [Element] {
        return sorted { key($0) < key($1) }
    }
    
    public func sortedDescendingBy<T: Comparable>(_ key: (Element) -> T) -> [Element] {
        return sorted { key($0) > key($1) }
    }
    
    public mutating func sortAscendingBy<T: Comparable>(_ key: (Element) -> T) {
        sort { key($0) < key($1) }
    }
    
    public mutating func sortDescendingBy<T: Comparable>(_ key: (Element) -> T) {
        sort { key($0) > key($1) }
    }
}
