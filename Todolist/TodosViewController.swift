//
//  TodosViewController.swift
//  Todolist
//
//  Created by Giordano Scalzo on 05/01/2015.
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
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: Setup
private extension TodosViewController{
    func setup(){
        view.backgroundColor = UIColor.grayColor()
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        view.addSubview(tableView)
        
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
        view.backgroundColor = UIColor.grayColor()
        addButton.setImage(UIImage(named: "add-button"), forState: .Normal)
    }
}

// MARK: UITableViewDataSource
extension TodosViewController : UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        cell.textLabel!.text = "dasdasdad"
        cell.textLabel!.font = UIFont.latoFontOfSize(17)
        return cell
    }

}
