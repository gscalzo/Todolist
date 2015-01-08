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
        Todo(description: "todo 4", list: List(description: "Personal"), dueDate: NSDate(), done: false, doneDate: nil),
        Todo(description: "todo 5", list: List(description: "Personal"), dueDate: NSDate(), done: false, doneDate: nil),
        Todo(description: "todo 6", list: List(description: "Personal"), dueDate: NSDate(), done: false, doneDate: nil),
        Todo(description: "todo 7", list: List(description: "Personal"), dueDate: NSDate(), done: false, doneDate: nil),
        Todo(description: "todo 8", list: List(description: "Personal"), dueDate: NSDate(), done: false, doneDate: nil),
        Todo(description: "todo 9", list: List(description: "Personal"), dueDate: NSDate(), done: false, doneDate: nil),
        Todo(description: "todo 10", list: List(description: "Personal"), dueDate: NSDate(), done: false, doneDate: nil),
        Todo(description: "todo 11", list: List(description: "Personal"), dueDate: NSDate(), done: false, doneDate: nil),
        Todo(description: "todo 12", list: List(description: "Personal"), dueDate: NSDate(), done: false, doneDate: nil),
        Todo(description: "todo 13", list: List(description: "Personal"), dueDate: NSDate(), done: false, doneDate: nil),
        Todo(description: "todo 14", list: List(description: "Personal"), dueDate: NSDate(), done: false, doneDate: nil),
        Todo(description: "todo 15", list: List(description: "Personal"), dueDate: NSDate(), done: false, doneDate: nil),
        Todo(description: "todo 16", list: List(description: "Personal"), dueDate: NSDate(), done: false, doneDate: nil),
        Todo(description: "todo 17", list: List(description: "Personal"), dueDate: NSDate(), done: false, doneDate: nil),
        Todo(description: "todo 18", list: List(description: "Personal"), dueDate: NSDate(), done: false, doneDate: nil),
    ]

    func defaultList() -> List {
        return List(description: "Personal")
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
        if countElements(description) > 0 {
            savedLists = savedLists + [List(description: description)]
        }
    }
}