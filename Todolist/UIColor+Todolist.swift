//
//  UIColor+Todolist.swift
//  Todolist
//
//  Created by Giordano Scalzo on 08/01/2015.
//  Copyright (c) 2015 Effective Code Ltd. All rights reserved.
//

import UIKit

extension UIColor {
    class func separatorColor() -> UIColor {
        return UIColor.colorComponents((209, 209, 212))
    }
    
}

private extension UIColor {
    class func colorComponents(components: (CGFloat, CGFloat, CGFloat)) -> UIColor {
        return UIColor(red: components.0/255, green: components.1/255, blue: components.2/255, alpha: 1)
    }
}