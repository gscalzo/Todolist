//
//  StorageDatastore.swift
//  Todolist
//
//  Created by Giordano Scalzo on 14/01/2015.
//  Copyright (c) 2015 Effective Code Ltd. All rights reserved.
//

import Foundation

protocol StorageDatastore {
    func todos() -> Array<Todo>
    func lists() -> Array<List>
    
    func addTodo(todo: Todo)
    func deleteTodo(todo: Todo)
    func addList(list: List)
}
