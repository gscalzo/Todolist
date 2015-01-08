//
//  TodosDatastore.swift
//  Todolist
//
//  Created by Giordano Scalzo on 05/01/2015.
//  Copyright (c) 2015 Effective Code Ltd. All rights reserved.
//

import Foundation

class TodosDatastore {
    private var savedLists = [
        List(description: "List1"),
        List(description: "List2"),
        List(description: "List3"),
        List(description: "List4"),
    ]
    
    private var savedTodos = [
        Todo(description: "todo 1", list: List(description: "Personal"), dueDate: NSDate(), done: false, doneDate: nil),
        Todo(description: "todo 2", list: List(description: "Personal"), dueDate: NSDate(), done: false, doneDate: nil),
        Todo(description: "todo 3", list: List(description: "Personal"), dueDate: NSDate(), done: false, doneDate: nil),
    ]

    func defaultList() -> List {
        return List(description: "Personal")
    }
    
    func defaultDueDate() -> NSDate {
        let now = NSDate()
        let secondsInADay = NSTimeInterval(24 * 60 * 60)
        return now.dateByAddingTimeInterval(secondsInADay)
    }
    
    
    func todos() -> Array<Todo> {
        return savedTodos
    }
    
    func lists() -> Array<List> {
        return [defaultList()] + savedLists
    }
}

// MARK: Actions
extension TodosDatastore {
    func addListDescription(description: String) {
        if !description.isEmpty {
            savedLists = savedLists + [List(description: description)]
        }
    }
    
    func addTodo(todo: Todo) {
        savedTodos = savedTodos + [todo]
    }
}