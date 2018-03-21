import Foundation

func todosByPriority() -> [[Todo]] {
    
    return getTodos()
        .chunkDescendingBy { $0.priority.rawValue }
        .map { $0.sortedDescendingBy({ todo in todo.dueDate }) }
}

printTodos(todosByPriority())


func mostCommonPriority() -> Todo.Priority? {

    return getTodos()
        .chunkDescendingBy { $0.priority.rawValue }
        .sortedDescendingBy { $0.count }
        .first?.first?.priority
}

print("\nMost common priority: \(mostCommonPriority()!)")
