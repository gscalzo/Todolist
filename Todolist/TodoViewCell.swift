//
//  TodoViewCell.swift
//  Todolist
//
//  Created by Giordano Scalzo on 05/01/2015.
//  Copyright (c) 2015 Effective Code Ltd. All rights reserved.
//

import UIKit
import Foundation
import Cartography
import LatoFont

class TodoViewCell: UITableViewCell {
    private let subtitle = UILabel()
    private let title = UILabel()
    private let checkMark = UIView()
    private let separatorSize = 5
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
        layoutView()
        style()
    }
}

// MARK: Setup
private extension TodoViewCell{
    func setup(){
        contentView.addSubview(subtitle)
        title.numberOfLines = 0
        contentView.addSubview(title)
        contentView.addSubview(checkMark)
    }
}

// MARK: Layout
private extension TodoViewCell{
    func layoutView(){
        layout(subtitle) { view in
            view.top == view.superview!.top + 10
            view.left == view.superview!.left + 10
            view.right == view.superview!.right - 10
        }
        
        layout(title, subtitle) { view, view2 in
            view.bottom == view.superview!.bottom - 10
            view.left == view.superview!.left + 30
            view.right == view.superview!.right
            view.top == view2.bottom
        }
    }
}

// MARK: Style
private extension TodoViewCell{
    func style(){
        contentView.backgroundColor = UIColor.clearColor()
        subtitle.textAlignment = .Left
        subtitle.font = UIFont.latoLightFontOfSize(17)
        title.textAlignment = .Left
        title.font = UIFont.latoFontOfSize(17)
    }
}

// MARK: render
extension TodoViewCell{
    func render(todo: Todo){
        subtitle.text = "10:00 | Personal"
        title.text = todo.description
    }
}