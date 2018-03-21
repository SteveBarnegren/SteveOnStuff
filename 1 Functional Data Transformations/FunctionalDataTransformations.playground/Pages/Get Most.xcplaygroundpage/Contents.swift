import Foundation

func mostCommonPriority() -> Todo.Priority? {
    
    // Get the todos
    let todos = getTodos()
    
    // Get the most common priority
    var highestCount = 0
    var mostCommonPriority: Todo.Priority?
    var rawValue = 0
    while let priority = Todo.Priority(rawValue: rawValue) {
        let count = todos.filter { $0.priority == priority }.count
        if count >= highestCount {
            highestCount = count
            mostCommonPriority = priority
        }
        rawValue += 1
    }
    
    // Return the most common priority
    return mostCommonPriority
}

print("Most common priority: \(mostCommonPriority()!)")
