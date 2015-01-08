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
import FontAwesomeKit

class TodoViewCell: UITableViewCell {
    private let subtitle = UILabel()
    private let title = UILabel()
    private let checkMark = UILabel()
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
            view.top   == view.superview!.top   + 10
            view.left  == view.superview!.left  + 10
            view.right == view.superview!.right - 10
            view.height == 20
        }
        
        layout(checkMark) { view in
            view.left == view.superview!.left + 10
            view.width == view.height
        }
        
        layout(title, subtitle) { view, view2 in
            view.top == view2.bottom
            return
        }

        layout(title, checkMark) { view, view2 in
            view.bottom == view.superview!.bottom - 5
            view.left == view2.right + 5
            view.right == view.superview!.right - 10
            view.centerY == view2.centerY
        }
    }
}

// MARK: Style
private extension TodoViewCell{
    func style(){
        contentView.backgroundColor = UIColor.clearColor()
        subtitle.textAlignment = .Left
        subtitle.font = UIFont.latoLightFontOfSize(14)
        title.textAlignment = .Left
        title.font = UIFont.latoFontOfSize(18)
        checkMark.textAlignment = .Center
    }
}

// MARK: render
extension TodoViewCell{
    private func checkmarkAttributedStringTodo(todo: Todo) -> NSAttributedString{
        if todo.done {
            return FAKFontAwesome.checkSquareOIconWithSize(20).attributedString()
        } else {
            return FAKFontAwesome.squareOIconWithSize(20).attributedString()
        }
    }
    
    func render(todo: Todo){
        subtitle.text = "10:00 | Personal"
        title.text = todo.description
        
        checkMark.attributedText = checkmarkAttributedStringTodo(todo)
    }
}