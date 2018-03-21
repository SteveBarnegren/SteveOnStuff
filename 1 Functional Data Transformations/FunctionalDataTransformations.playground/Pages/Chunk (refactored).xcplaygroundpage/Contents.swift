//: Playground - noun: a place where people can play

import Cocoa

import Cocoa

func todosByPriority() -> [[Todo]] {
    
    return getTodos()                                   // Get the todos
        .sortedDescendingBy { $0.priority.rawValue }    // sort by priority
        .chunk(atChangeTo: { $0.priority })             // make an array for each priority
        .map {                                          // sort each priority array by date
            $0.sortedAscendingBy({ todo in todo.dueDate })
    }
}

printTodos(todosByPriority())
