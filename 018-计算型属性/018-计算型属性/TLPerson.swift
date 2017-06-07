//
//  TLPerson.swift
//  018-计算型属性
//
//  Created by lichuanjun on 2017/6/7.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class TLPerson: NSObject {

    // getter & setter 仅用演示，日志开发不用
    
    private var _name :String?
    
    // Swift 中一般不会重写 getter 方法和 setter 方法
    var name: String? {
        get {
            // 返回 _成员变量
            return _name
        }
        set {
            // 使用 _成员变量 记录 值
            _name = newValue
        }
    }
    
    // OC 中定义属性的时候，有一个 readonly -> 重写 getter 方法
    var title: String {
        // 只重写了 getter 方法，没有重写 setter 方法
        // 就是只读属性
        get {
            return "Mr. " + (name ?? "")
        }
    }
    
    // 只读属性的简写
    var title2: String {
        return "Mr XXX. " + (name ?? "")
    }
}
