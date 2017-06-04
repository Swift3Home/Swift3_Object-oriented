//
//  UITextField+extension.swift
//  015-AddingMachine
//
//  Created by lichuanjun on 2017/6/4.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

// extension 类似于 OC 中的 category
extension UITextField {
    
    convenience init(frame: CGRect, placeholder: String, fontSize: CGFloat = 14) {
        
        // 实例化对象
        self.init(frame: frame)
        
        // 访问属性
        self.borderStyle = .roundedRect
        self.placeholder = "0"
        self.font = UIFont.systemFont(ofSize: fontSize)
    }
}
