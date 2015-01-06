//
//  TodosDatastore.swift
//  Todolist
//
//  Created by Giordano Scalzo on 05/01/2015.
//  Copyright (c) 2015 Effective Code Ltd. All rights reserved.
//

import Foundation

class TodosDatastore {
    func todos() -> Array<Todo> {
        
        return [
            Todo(description: "todo 1", dueDate: NSDate(), done: false, doneDate: nil),
            Todo(description: "todo 2", dueDate: NSDate(), done: false, doneDate: nil),
            Todo(description: "todo 3", dueDate: NSDate(), done: false, doneDate: nil),
            Todo(description: "todo 4", dueDate: NSDate(), done: false, doneDate: nil),
            Todo(description: "todo 5", dueDate: NSDate(), done: false, doneDate: nil),
            Todo(description: "todo 6", dueDate: NSDate(), done: false, doneDate: nil),
            Todo(description: "todo 7", dueDate: NSDate(), done: false, doneDate: nil),
            Todo(description: "todo 8", dueDate: NSDate(), done: false, doneDate: nil),
            Todo(description: "todo 9", dueDate: NSDate(), done: false, doneDate: nil),
            Todo(description: "todo 10", dueDate: NSDate(), done: false, doneDate: nil),
            Todo(description: "todo 11", dueDate: NSDate(), done: false, doneDate: nil),
            Todo(description: "todo 12", dueDate: NSDate(), done: false, doneDate: nil),
            Todo(description: "todo 13", dueDate: NSDate(), done: false, doneDate: nil),
            Todo(description: "todo 14", dueDate: NSDate(), done: false, doneDate: nil),
            Todo(description: "todo 15", dueDate: NSDate(), done: false, doneDate: nil),
            Todo(description: "todo 16", dueDate: NSDate(), done: false, doneDate: nil),
            Todo(description: "todo 17", dueDate: NSDate(), done: false, doneDate: nil),
            Todo(description: "todo 18", dueDate: NSDate(), done: false, doneDate: nil),
        ]
    }
}