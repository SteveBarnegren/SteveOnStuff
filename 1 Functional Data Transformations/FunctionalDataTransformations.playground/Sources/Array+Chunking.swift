import Foundation

public extension Array {
    
    public func chunk<T: Equatable>(atChangeTo key: (Element) -> T) -> [[Element]] {
        
        // We want to create an array of arrays
        var groups = [[Element]]()
        
        // addGroup will add a new array, but only if it contains values
        func addGroup(_ groupToAdd: [Element]) {
            if groupToAdd.isEmpty == false {
                groups.append(groupToAdd)
            }
        }
        
        // Loop though all of our items saving lastKey on each iteration
        // When lastKey changes, add the existing group to groups and create a new one
        var lastKey: T?
        var currentGroup = [Element]()
        
        for item in self {
            let itemKey = key(item)
            if itemKey == lastKey {
                currentGroup.append(item)
            } else {
                addGroup(currentGroup)
                currentGroup.removeAll()
                currentGroup.append(item)
            }
            lastKey = itemKey
        }
        
        addGroup(currentGroup)
        return groups
    }
    
    public func chunkAscendingBy<T: Comparable>(key: (Element) -> T) -> [[Element]] {
        return self.sortedAscendingBy(key).chunk(atChangeTo: key)
    }
    
    public func chunkDescendingBy<T: Comparable>(key: (Element) -> T) -> [[Element]] {
        return self.sortedDescendingBy(key).chunk(atChangeTo: key)
    }
}
