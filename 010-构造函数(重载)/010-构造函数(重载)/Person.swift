//
//  Person.swift
//  009-构造函数
//
//  Created by lichuanjun on 2017/6/2.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

/*
 1. 构造函数的目的：给自己的属性分配空间并且设置初始值
 2. 调用父类构造函数之前，需要先给本类的属性设置初始值
 3. 调用父类的`构造函数`，给父类的属性分配空间设置初始值
    NSObject 没有属性，只有一个成员变量 `isa`
 4. 如果重载了构造函数，并且没有实现父类 init 方法，系统不再提供 init() 构造函数(默认是会有的)
    - 因为 默认的构造函数，不能给父类的属性分配空间
 */
class Person: NSObject {
    
    var name: String

    // 重写，父类有这个方法
    override init() {
        print("Person init")
        
        // 问题：name 确实有初始值，但是所有的初始值是 zhang
        name = "zhang"
        
        super.init()
    }
    
    // 重载：函数名相同，参数和个数不同
    // 重载可以给自己的属性从外部设置初始值
    // 提问：OC 有重载吗？没有 initWithXXX
    init(name: String) {
        
        // 使用参数的 name 设置给属性
        self.name = name
        
        // 调用父类的构造函数
        super.init()
    }
}
