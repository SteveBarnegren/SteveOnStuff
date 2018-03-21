import Foundation

func mostCommonPriority() -> Todo.Priority? {
    
    return getTodos()
        .sortedAscendingBy { $0.priority.rawValue }  // Sort ascending by priority
        .chunk(atChangeTo: { $0.priority })          // Chunk in to separate arrays of each priority
        .sortedDescendingBy { $0.count }             // Sort arrays descending by count (most common first)
        .first?.first?.priority                      // Most common = the first item of the first array
}

print("Most common priority: \(mostCommonPriority()!)")
