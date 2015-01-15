//
//  ListViewCell.swift
//  Todolist
//
//  Created by Giordano Scalzo on 08/01/2015.
//  Copyright (c) 2015 Effective Code Ltd. All rights reserved.
//

import UIKit
import Foundation
import Cartography
import FontAwesomeKit

class ListViewCell: UITableViewCell {
    private let title = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
        layoutView()
        style()
    }
}

// MARK: Setup
private extension ListViewCell{
    func setup(){
        title.numberOfLines = 0
        contentView.addSubview(title)
    }
}

// MARK: Layout
private extension ListViewCell{
    func layoutView(){
        layout(title) { view in
            view.top == view.superview!.top + 5
            view.bottom == view.superview!.bottom - 5
            view.left == view.superview!.left + 15
            view.right == view.superview!.right - 10
        }
    }
}

// MARK: Style
private extension ListViewCell{
    func style(){
        contentView.backgroundColor = UIColor.clearColor()
        title.textAlignment = .Left
        title.font = UIFont.latoLightFontOfSize(18)
    }
}

// MARK: render
extension ListViewCell{
    func render(list: List){
        title.text = list.description
    }
}