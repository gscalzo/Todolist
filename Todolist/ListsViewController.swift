//
//  ListsViewController.swift
//  Todolist
//
//  Created by Giordano Scalzo on 07/01/2015.
//  Copyright (c) 2015 Effective Code Ltd. All rights reserved.
//

import UIKit

class ListsViewController: UIViewController {
    private let todosDatastore: TodosDatastore
    private let todoToEdit: Todo
    
    private override init() {
        fatalError("init() must not called")
    }
    
    required init(todosDatastore: TodosDatastore, todoToEdit: Todo) {
        self.todosDatastore = todosDatastore
        self.todoToEdit = todoToEdit
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layoutView()
        style()
    }
}

// MARK: Setup
private extension ListsViewController{
    func setup(){
        title = "Lists"
//        descriptionTextField.placeholder = "Description of Todo"
//        view.addSubview(descriptionTextField)
//        view.addSubview(descriptionSeparator)
//        
//        descriptionTextField.becomeFirstResponder()
    }
}

// MARK: Layout
private extension ListsViewController{
    func layoutView(){
//        layout(descriptionTextField) { view in
//            view.top == view.superview!.top + 50
//            view.left == view.superview!.left + 10
//            view.right == view.superview!.right - 10
//            view.height == 40
//        }
//        
//        layout(descriptionSeparator, descriptionTextField) {view, view2 in
//            view.left == view.superview!.left
//            view.right == view.superview!.right
//            view.top == view2.bottom
//            view.height == 1
//        }
    }
}

// MARK: Style
private extension ListsViewController{
    func style(){
        view.backgroundColor = UIColor.redColor()
//        descriptionTextField.font = UIFont.latoLightFontOfSize(20)
//        descriptionTextField.backgroundColor = UIColor.whiteColor()
//        descriptionSeparator.backgroundColor = UIColor.lightGrayColor()
    }
}

