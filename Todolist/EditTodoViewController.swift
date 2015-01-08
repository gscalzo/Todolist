//
//  EditTodoViewController.swift
//  Todolist
//
//  Created by Giordano Scalzo on 06/01/2015.
//  Copyright (c) 2015 Effective Code Ltd. All rights reserved.
//

import UIKit
import Cartography
import FontAwesomeKit

class EditTodoViewController: UIViewController {
    private let descriptionTextField = UITextField()
    private let descriptionSeparator = UIView()
    private let listAssociatedName = UILabel()
    private let listButton = UIButton()
    private let listSeparator = UIView()
    
    private let todosDatastore: TodosDatastore
    private let todoToEdit: Todo?
    private var list: List
    
    private override init() {
        fatalError("init() must not called")
    }
    
    required init(todosDatastore: TodosDatastore, todoToEdit: Todo?) {
        self.todosDatastore = todosDatastore
        self.todoToEdit = todoToEdit
        if self.todoToEdit != nil {
            //            list = self.todoToEdit.list
            list = self.todosDatastore.defaultList()
        } else {
            list = self.todosDatastore.defaultList()
        }
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
private extension EditTodoViewController{
    func setup(){
        descriptionTextField.placeholder = "Description of Todo"
        descriptionTextField.becomeFirstResponder()
        view.addSubview(descriptionTextField)
        view.addSubview(descriptionSeparator)
        view.addSubview(listAssociatedName)
        view.addSubview(listButton)
        listButton.addTarget(self, action: "listButtonPressed:", forControlEvents: .TouchUpInside)
        
        view.addSubview(listSeparator)
        
        listButton.setAttributedTitle(FAKFontAwesome.listIconWithSize(20).attributedString(), forState: .Normal)
        
        // mettere in metodo a parte per render todo
        listAssociatedName.text = "List: \(list.description)"
    }
}

// MARK: Layout
private extension EditTodoViewController{
    func layoutView(){
        layout(descriptionTextField) { view in
            view.top == view.superview!.top + 70
            view.left == view.superview!.left + 10
            view.right == view.superview!.right - 10
            view.height == 50
        }
        
        layout(descriptionSeparator, descriptionTextField) {view, view2 in
            view.left == view.superview!.left
            view.right == view.superview!.right
            view.top == view2.bottom
            view.height == 1
        }
        
        layout(listAssociatedName, descriptionSeparator) {view, view2 in
            view.top == view2.bottom
            return
        }
        
        layout(listAssociatedName, descriptionTextField) {view, view2 in
            view.left == view2.left
            view.height == view2.height
        }
        
        layout(listAssociatedName, listButton) {view, view2 in
            view.right == view2.left
            view.top == view2.top
            view.height == view2.height
            view2.height == view2.width
            view2.right == view2.superview!.right
        }
        
        layout(listSeparator, listAssociatedName) {view, view2 in
            view.left == view.superview!.left
            view.right == view.superview!.right
            view.top == view2.bottom
            view.height == 1
        }
        
    }
}

// MARK: Style
private extension EditTodoViewController{
    func style(){
        view.backgroundColor = UIColor.whiteColor()
        descriptionTextField.font = UIFont.latoLightFontOfSize(20)
        descriptionTextField.backgroundColor = UIColor.whiteColor()
        descriptionSeparator.backgroundColor = UIColor.separatorColor()
        
        listAssociatedName.font = UIFont.latoBoldFontOfSize(16)
        listAssociatedName.backgroundColor = UIColor.whiteColor()
        listSeparator.backgroundColor = UIColor.separatorColor()
    }
}


// MARK: Actions
extension EditTodoViewController {
    func listButtonPressed(sender: UIButton!){
        let listsVC = ListsViewController(todosDatastore: todosDatastore, todoToEdit: Todo(description: "sddd", dueDate: NSDate(), done: false, doneDate: nil))
        navigationController!.pushViewController(listsVC, animated: true)
    }
}
