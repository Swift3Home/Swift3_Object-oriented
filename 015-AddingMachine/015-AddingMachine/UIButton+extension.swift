//
//  UIButton+extension.swift
//  015-AddingMachine
//
//  Created by lichuanjun on 2017/6/4.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

extension UIButton {
    
    convenience init(title: String, color: UIColor = UIColor.darkGray) {
        
        // 实例化对象
        self.init()
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(color, for: .normal)
        
        self.sizeToFit()
    }
}
