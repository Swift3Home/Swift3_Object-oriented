//
//  Person.swift
//  009-构造函数
//
//  Created by lichuanjun on 2017/6/2.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

/*
 1. 给自己的属性分配空间并且设置初始值
 2. 调用父类的`构造函数`，给父类的属性分配空间设置初始值
    NSObject 没有属性，只有一个成员变量 `isa`
 */
class Person: NSObject {
    
    var name: String

    override init() {
        print("Person init")
        
        name = "zhang"
        
        super.init()
    }
}
