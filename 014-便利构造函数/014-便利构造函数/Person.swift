//
//  Person.swift
//  014-便利构造函数
//
//  Created by lichuanjun on 2017/6/4.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class Person: NSObject {

    var name: String?
    var age: Int = 0
    
    // 重载构造函数
    /*
     1. 便利构造函数允许返回nil
        - 正常的构造函数一定会创建对象
        - ** 判断给定的参数是否符合条件，如果不符合条件，直接返回nil，不会创建对象，减少内存开销 **
     2. **只有** 便利构造函数中使用`self.init`构造当前对象
        - 没有convenience 关键字的构造函数是负责创建对象的，反之用来检查条件的，本身不负责对象的创建
     3. 如果要在便利构造函数中使用 当前对象的属性，移动要在 self.init 之后
     */
    convenience init?(name: String, age: Int) {
        
        if age > 100 {
            return nil
        }
        
        // Use of 'self' in property access 'name' before self.init initializes self
        // 使用 self 访问 name 之前，应该调用 self.init
//        self.name = name
        // 实例化当前对象
        self.init()
        // 执行至此 self 才允许被访问，才能够访问到对象的属性
        self.name = name
    }
    
    // 没有 func -> 不让调用
    // 没有 () -> 不让重载/重写/不允许带参数
    // 在对象被销毁前自动调用
    // 类似于 OC 的 dealloc
    deinit {
        // 1. 跟踪对象的销毁
        // 2. 必须释放的
        /*
            - 通知，不释放不会崩溃，但是会泄露
            - KVO，不释放会崩溃
            - NSTimer / CADisplayLink
         */
    }
}
