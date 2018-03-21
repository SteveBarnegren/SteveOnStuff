import Foundation

public struct Todo {
    
    public enum Priority: Int {
        case low
        case regular
        case high
    }
    
    public let text: String
    public let dueDate: Date
    public let priority: Priority
}

public func getTodos() -> [Todo] {
    
    let todos: [Todo] = [
        Todo(text: "Buy milk",  dueDate: Date(day: 4, month: 1, year: 2000), priority: .regular),
        Todo(text: "Book Haircut",  dueDate: Date(day: 5, month: 1, year: 2000), priority: .regular),
        Todo(text: "Email Boss",  dueDate: Date(day: 8, month: 1, year: 2000), priority: .high),
        Todo(text: "Mow Lawn",  dueDate: Date(day: 2, month: 1, year: 2000), priority: .regular),
        Todo(text: "Write blog post",  dueDate: Date(day: 6, month: 1, year: 2000), priority: .regular),
        Todo(text: "Buy bread",  dueDate: Date(day: 3, month: 1, year: 2000), priority: .low),
        Todo(text: "Call Parents",  dueDate: Date(day: 1, month: 1, year: 2000), priority: .regular),
        Todo(text: "Service Car",  dueDate: Date(day: 7, month: 1, year: 2000), priority: .high)
    ]
    
    return todos
}

// ******** Printing *********

public func printTodos(_ todos: [[Todo]]) {
    
    let separator = "---------------------------------------------------"
    
    for todosList in todos {
        print(separator)
        printTodos(todosList)
    }
    
    print(separator)
}

public func printTodos(_ todos: [Todo]) {
    
    func boolDescription(_ bool: Bool) -> String {
        return bool == true ? "true " : "false"
    }
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    
    for (index, todo) in todos.enumerated() {
        
        var description = "\(index+1)."
        description += " \(dateFormatter.string(from: todo.dueDate))"
        description += " | priority: \(todo.priority.description)"
        description += " | \(todo.text)"
        
        print(description)
    }
}

public extension Todo.Priority {
    
    public var description: String {
        switch self {
        case .low: return "low    "
        case .regular: return "regular"
        case .high: return "high   "
        }
    }
    
}

