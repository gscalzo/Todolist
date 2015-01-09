//
//  TodosViewController.swift
//  Todolist
//
//  Created by Giordano Scalzo on 05/01/2015.
//  Copyright (c) 2015 Effective Code Ltd. All rights reserved.
//

import UIKit
import Cartography
import MGSwipeTableCell

class TodosViewController: UIViewController {
    private let tableView = UITableView()
    private let addButton = UIButton()
    private let todosDatastore: TodosDatastore
    private var todos: Array<Todo>
    
    private override init() {
        fatalError("init() must not called")
    }
    
    required init(todosDatastore: TodosDatastore) {
        self.todosDatastore = todosDatastore
        self.todos = todosDatastore.todos()
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        refresh()
    }
    
    private func refresh() {
        todos = todosDatastore.todos().sorted { $0.dueDate.compare($1.dueDate) == NSComparisonResult.OrderedAscending}
        tableView.reloadData()
    }
}

// MARK: Setup
private extension TodosViewController{
    func setup(){
        title = "Todos"
        view.backgroundColor = UIColor.grayColor()
        tableView.registerClass(TodoViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        view.addSubview(tableView)
        
        addButton.addTarget(self, action: "addTodoButtonPressed:", forControlEvents: .TouchUpInside)
        view.addSubview(addButton)
    }
}

// MARK: Layout
private extension TodosViewController{
    func layoutView(){
        layout(tableView) { view in
            view.top == view.superview!.top
            view.bottom == view.superview!.bottom
            view.left == view.superview!.left
            view.right == view.superview!.right
        }
        layout(addButton) { view in
            view.bottom == view.superview!.bottom - 5
            view.centerX == view.superview!.centerX
            view.width == view.height
            view.height == 60
        }
    }
}

// MARK: Style
private extension TodosViewController{
    func style(){
        view.backgroundColor = UIColor.whiteColor()
        addButton.setImage(UIImage(named: "add-button"), forState: .Normal)
    }
}

// MARK: UITableViewDataSource
extension TodosViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as TodoViewCell
        let todo = todos[indexPath.row]
        cell.render(todo)
        cell.selectionStyle = .None
        
        cell.rightButtons = [
            MGSwipeButton(title: "Edit", backgroundColor: UIColor.sunflower(), padding: 30) {
                [weak self] sender in
                self?.editButtonPressed(todo)
                return true
            },
            MGSwipeButton(title: "Delete", backgroundColor: UIColor.alizarin(), padding: 30) {
                [weak self] sender in
                self?.deleteButtonPressed(todo)
                return true
            }
        ]
        cell.leftButtons = [
            MGSwipeButton(title: "Done", backgroundColor: UIColor.emerald(), padding: 30) {
                [weak self] sender in
                self?.doneButtonPressed(todo)
                return true
            }
        ]
        
        return cell
    }
}

// MARK: UITableViewDelegate
extension TodosViewController : UITableViewDelegate {
    func tableView(tableView: UITableView,
        heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return 80
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
}

// MARK: Actions
 extension TodosViewController {
    func addTodoButtonPressed(sender: UIButton!){
        let editTodoVC = EditTodoViewController(todosDatastore: self.todosDatastore, todoToEdit: nil)
        editTodoVC.title = "New Todo"
        navigationController!.pushViewController(editTodoVC, animated: true)
    }
    
    func editButtonPressed(todo: Todo){
        let editTodoVC = EditTodoViewController(todosDatastore: self.todosDatastore, todoToEdit: todo)
        editTodoVC.title = "Edit Todo"
        navigationController!.pushViewController(editTodoVC, animated: true)
    }
    
    func deleteButtonPressed(todo: Todo){
        todosDatastore.deleteTodo(todo)
        refresh()
    }

    func doneButtonPressed(todo: Todo){
        todosDatastore.doneTodo(todo)
        refresh()
    }
}
