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
    // 基本数据类型，在OC中没有可选，如果定义成可选，运行时同样获取不到，使用KVC就会崩溃
    var age: Int = 0
    // private 的属性，使用运行时，同样获取不到属性(可以获取到 ivar)，同样会让KVC崩溃
    private var title: String?
    
    // 目标：[使用运行时]获取当前类所有属性的数组
    // 运行时是加钱项，不需要会写，但是一定要会说
    // 获取 ivar 列表是所有第三方框架字典转模型的基础
    class func propertyList() -> [String] {
        
        var count: UInt32 = 0
        
        // 1. 获取`类`的属性列表，返回属性列表的数组，可选项
        let list = class_copyPropertyList(self, &count)
        print("属性的数量 \(count)")
        
        // 2. 遍历数组 方法一
//        for i in 0..<Int(count) {
//            // 3. 更加下标获取属性
//            // objc_property_t? 从可选的数组中提取下标对应的结果，可能为nil
//            let pty = list?[i]
//            
//            // 4. 获取`属性`的名称，C语言字符串
//            // Int8 -> Byte -> Char => C语言的字符串
//            // pty! 需要用属性获取名称，属性必须存在，用了强行解包!
//            let cName =  property_getName(pty!)
//            
//            // 5. 转换成String的字符串
//            // cName! 必须用C语言字符串转换成String
//            let name = String(utf8String: cName!)
//            print(name)
//        }
        
        // 2. 遍历数组 方法二
        for i in 0..<Int(count) {
            // 3. 更加下标获取属性
            // 使用 guard 语法，依次判断每一项是否有值，只要有一项为nil，就不再执行后续的代码
            guard let pty = list?[i],
                let cName =  property_getName(pty),
                let name = String(utf8String: cName)
                else {
                    // 继续遍历下一个
                    continue
            }
            print(name)
        }
        
        // 6. 释放 C 语言的对象
        free(list)
        
        return []
    }
}
