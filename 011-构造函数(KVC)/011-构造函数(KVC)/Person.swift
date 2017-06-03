//
//  Person.swift
//  011-构造函数(KVC)
//
//  Created by lichuanjun on 2017/6/3.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

/*
 1. 定义模型属性的时候，如果是对象，通常都是可选的
    - 在需要的时候创建
    - 避免写构造函数，可以简化代码
 2. 使用 KVC 方法之前，应该调用 super.init 保证对象实例化完成
 */
class Person: NSObject {

    // name 属性是可选的，在 OC 中很多的属性都是在需要的时候创建的
    // 例如：vc.view / tableview.textLable / detailLabel / imageView
    // 因为在手机开发，内存很宝贵，有些属性并不是一定需要分配空间的
    // 延迟加载，在需要的时候再创建
    var name: String?
    
    // 重载构造函数，使用字典为本类设置初始值
    init(dict: [String: AnyObject]) {
        
        // 保证对象已经完全初始化完成
        super.init()
        
        // Use of 'self' in method call 'setValuesForKeys' before super.init initializes self
        // 使用 self 的方法 'setValuesForKeys' 之前，应该调用 super.init
        // KVC 的方法，是 OC 的方法，在运行时给对象发送消息**
        // ***要求对象已经实例化完成
        setValuesForKeys(dict)
        
    }
}
