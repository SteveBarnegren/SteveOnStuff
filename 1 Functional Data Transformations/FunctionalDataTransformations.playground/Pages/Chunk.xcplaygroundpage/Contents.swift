import Foundation

func todosByPriority() -> [[Todo]] {
    
    // Get the todos and sort them by priority
    let todos = getTodos().sorted { $0.priority.rawValue < $1.priority.rawValue }
    
    // Split in to a separate array for each priority
    var todosByPriority = [[Todo]]()
    var rawValue = 0
    while let priority = Todo.Priority(rawValue: rawValue) {
        let priorityTodos = todos.filter { $0.priority == priority }
        if !priorityTodos.isEmpty {
            todosByPriority.append(priorityTodos)
        }
        rawValue += 1
    }
    
    // Sort each array descending by date
    todosByPriority = todosByPriority.map {
        $0.sorted(by: {(todo1, todo2) in todo1.dueDate < todo2.dueDate})
    }
    
    // Return in reverse order so that the highest priority is first
    return todosByPriority.reversed()
}

// Print
printTodos(todosByPriority())
