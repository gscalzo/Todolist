//
//  Todo.swift
//  Todolist
//
//  Created by Giordano Scalzo on 05/01/2015.
//  Copyright (c) 2015 Effective Code Ltd. All rights reserved.
//

import Foundation

struct Todo {
    let description: String
    let list: List
    let dueDate: NSDate
    let done: Bool = false
    let doneDate: NSDate?
}