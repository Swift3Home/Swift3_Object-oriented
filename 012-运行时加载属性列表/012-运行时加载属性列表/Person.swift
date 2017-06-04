//
//  Person.swift
//  012-运行时加载属性列表
//
//  Created by lichuanjun on 2017/6/4.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name: String?
    var age: Int = 0
    var title: String?
    
    // 目标：[使用运行时]获取当前类所有属性的数组
    class func propertyList() -> [String] {
        
        var count: UInt32 = 0
        
        // 1. 获取`类`的属性列表，返回属性列表的数组，可选项
        let list = class_copyPropertyList(self, &count)
        print("属性的数量 \(count)")
        
        // 2. 遍历数组
        for i in 0..<Int(count) {
            // 3. 更加下标获取属性
            let pty = list?[i]
            
            // 4. 获取`属性`的名称，C语言字符串
            // Int8 -> Byte -> Char => C语言的字符串
            let cName =  property_getName(pty!)
            
            // 5. 转换成String的字符串
            let name = String(utf8String: cName!)
            print(name)
        }
        
        // 6. 释放 C 语言的对象
        free(list)
        
        return []
    }
}
