//
//  TodosViewController.swift
//  Todolist
//
//  Created by Giordano Scalzo on 12/01/2015.
//  Copyright (c) 2015 Effective Code Ltd. All rights reserved.
//

import UIKit
import Cartography
import LatoFont

class TodosViewController: UIViewController {
    private let tableView = UITableView()
    private let addButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layoutView()
        style()
    }
}

// MARK: Setup
private extension TodosViewController{
    func setup(){
        title = "Todos"
        view.backgroundColor = UIColor.grayColor()
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
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
        return 10
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        cell.selectionStyle = .None
        cell.textLabel?.font = UIFont.latoLightFontOfSize(14)
        cell.textLabel?.text = "Todo number \(indexPath.row)"
        
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
        println("addTodoButtonPressed")
    }
}
