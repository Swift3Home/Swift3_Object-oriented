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

// 1. Class 'Person' has no initializers
// Person 类没有`初始化`s，构造函数，可以有多个，默认是 init
class Person: NSObject {
    
    var name: String
    
    // 2. Overriding declaration requires an 'override' keyword
    // 重`写` -> 父类有这个方法，子类重新实现，需要 override 关键字
    // 3. Property 'self.name' not initialized at implicitly generated super.init call
    // implicitly(隐式生成的 super.init) 调用父类的构造函数之前，属性 self.name 没有被初始化
    override init() {
        print("Person init")
        
        name = "zhang"
        
        // 4. Property 'self.name' not initialized at super.init call
        // 再调用父类 super.init 的时候，没有给 self.name 初始化 -> 分配空间，设置初始值
        super.init()
        
//        name = "li"
    }
}
