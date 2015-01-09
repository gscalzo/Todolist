//
//  ListsViewController.swift
//  Todolist
//
//  Created by Giordano Scalzo on 07/01/2015.
//  Copyright (c) 2015 Effective Code Ltd. All rights reserved.
//

import UIKit
import Cartography

class ListsViewController: UIViewController {
    private let tableView = UITableView()
    private let addButton = UIButton()
    
    private let todosDatastore: TodosDatastore
    private let onListSelected: (list: List) -> Void
    
    private override init() {
        fatalError("init() must not called")
    }
    
    required init(todosDatastore: TodosDatastore, onListSelected: (list: List) -> Void) {
        self.todosDatastore = todosDatastore
        self.onListSelected = onListSelected
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
        tableView.registerClass(ListViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 100, right: 0)
        view.addSubview(tableView)
        
        addButton.addTarget(self, action: "addListButtonPressed:", forControlEvents: .TouchUpInside)
        view.addSubview(addButton)
    }
}

// MARK: Layout
private extension ListsViewController{
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
private extension ListsViewController{
    func style(){
        view.backgroundColor = UIColor.whiteColor()
        addButton.setImage(UIImage(named: "add-button"), forState: .Normal)
    }
}

// MARK: UITableViewDataSource
extension ListsViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todosDatastore.lists().count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as ListViewCell
        let list = todosDatastore.lists()[indexPath.row]
        cell.render(list)
        cell.selectionStyle = .None
        return cell
    }
}

// MARK: UITableViewDelegate
extension ListsViewController : UITableViewDelegate {
    func tableView(tableView: UITableView,
        heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return 50
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let list = todosDatastore.lists()[indexPath.row]
        onListSelected(list: list)
        navigationController?.popViewControllerAnimated(true)        
    }
}

// MARK: Actions
extension ListsViewController {
    func addListButtonPressed(sender: UIButton!){
        let alertViewChangeName = UIAlertView(title: "Enter list name",
            message: "To create a new list, please enter the name of the list",
            delegate: self,
            cancelButtonTitle: "Cancel",
            otherButtonTitles: "OK")
        alertViewChangeName.alertViewStyle = .PlainTextInput
        alertViewChangeName.show()
    }
}

// MARK: UIAlertViewDelegate
extension ListsViewController: UIAlertViewDelegate {
    func alertView(alertView: UIAlertView,
        clickedButtonAtIndex buttonIndex: Int){
            if buttonIndex == 1 {
                let description = alertView.textFieldAtIndex(0)!.text
                todosDatastore.addListDescription(description)
                tableView.reloadData()
            }
    }
}

