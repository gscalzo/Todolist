//
//  FileSystemDataStore.swift
//  Todolist
//
//  Created by Giordano Scalzo on 14/01/2015.
//  Copyright (c) 2015 Effective Code Ltd. All rights reserved.
//

import Foundation

class FileSystemDataStore: StorageDatastore {
    func todos() -> Array<Todo> {
        let path = fileNameEntity("todo")
        let data = NSArray(contentsOfFile: path)
        let todos = data.map { todoFromDictionary($0 as Dictionary)}
//        if todos != nil  {
//            return todos!
//        } else {
            return Array<Todo>()
//        }
    }
    
    func lists() -> Array<List>{
        return Array<List>()
    }
    
    func addTodo(todo: Todo){
        
    }
    func deleteTodo(todo: Todo){
        
    }
    func addList(list: List){
        
    }
    
    private func fileNameEntity(entityName: String) -> String{
    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
    let documentsDirectory = paths.objectAtIndex(0) as NSString
    let path = documentsDirectory.stringByAppendingPathComponent("\(entityName).plist")
    
    return path
    }
    
}