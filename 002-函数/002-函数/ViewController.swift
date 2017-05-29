//
//  ViewController.swift
//  002-函数
//
//  Created by lichuanjun on 2017/5/29.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Swift 1.0: sum(10, 50),所有的形参都会省略，其他的程序员非常喜欢！
        // Swift 2.0: sum(10, y:50),第一个形参的名称省略
        // Swift 3.0: 调用的方式 -> OC的程序员非常喜欢
//        print(sum(x: 10, y: 50))
        
        // 测试外部参数
//        print(sum1(num1: 30, num2: 60))
//        print(40, 60)
        
        // 测试默认值
        print(sum3())
        print(sum3(x: 10, y: 20))
        print(sum3(x: 10))
        print(sum3(y: 80))
        
        demo1()
        demo2()
        demo3()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - 无返回值
    /**
     知道就行，主要用在闭包，在阅读第三方框架代码时，保证能够看懂
     
     - 直接省略
     - () 
     - Void
     */
    func demo1() {
        print("哈哈")
    }
    
    func demo2() -> () {
        print("呵呵")
    }
    
    func demo3() -> Void {
        print("嘻嘻")
    }
    
    // MARK: - 默认值
    // 通过给参数设置默认值，在调用的时候，可以任意组合参数，如果不指定，就使用默认值
    // OC 中需要定义很多的方法，以及方法实现，最终调用包含所有参数的那个函数
    func sum3(x: Int = 1, y: Int = 2) -> Int {
        return x + y
    }
    // MARK: - 外部参数
    // - 外部参数就是在形参前加一个名称
    // - 外部参数不会影响函数内部的细节
    // - 外部参数会让外部调用方看起来更加的直观
    // - 外部参数如果使用_, 在外部调用函数里，会忽略形参的名字
    func sum2(_ x: Int, _ y: Int) -> Int {
    
        // 在swift中，_就是可以忽略任意不感兴趣的内容
        // Immutable value 'i' was never used; consider replacing with '_' or removing it
        // i 从来没有被使用，建议使用 _ 替代
        for _ in 0..<10 {
            print("Hello world")
        }
        return x+y
    }
    
    func sum1(num1 x: Int, num2 y: Int) -> Int {
        return x + y
    }
    
    // MARK: - 函数定义
    /// 函数定义，格式 函数名(形参列表) -> 返回值类型
    func sum(x: Int, y: Int) -> Int {
        return x + y
    }
}

