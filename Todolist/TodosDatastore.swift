//
//  TodosDatastore.swift
//  Todolist
//
//  Created by Giordano Scalzo on 05/01/2015.
//  Copyright (c) 2015 Effective Code Ltd. All rights reserved.
//

import Foundation

class TodosDatastore {
    private var savedLists = Array<List>()
    private var savedTodos = Array<Todo>()

    init(){
        savedLists = [
            List(description: "Personal"),
            List(description: "Work"),
            List(description: "Family")
        ]
        savedTodos = [
            Todo(description: "Remenber the Milk",
                list: List(description: "Family") , dueDate: NSDate(),
                done: false,
                doneDate: nil),
            Todo(description: "Buy Spider Man Comics",
                list: List(description: "Personal") , dueDate: NSDate(),
                done: true,
                doneDate: NSDate()),
            Todo(description: "Release build",
                list: List(description: "Work") , dueDate: NSDate(),
                done: false,
                doneDate: nil),
        ]
    }
    
    
    func todos() -> Array<Todo> {
        return savedTodos
    }
    
    func lists() -> Array<List> {
        return savedLists
    }
}

// MARK: Actions
extension TodosDatastore {
    func addTodo(todo: Todo) {
        println("addTodo")
    }
    
    func deleteTodo(todo: Todo?) {
        println("deleteTodo")
    }

    func doneTodo(todo: Todo) {
        println("doneTodo")
    }
}