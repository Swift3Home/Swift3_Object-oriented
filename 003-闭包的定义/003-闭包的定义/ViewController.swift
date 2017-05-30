//
//  ViewController.swift
//  003-闭包的定义
//
//  Created by lichuanjun on 2017/5/30.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /*
     闭包
     1、提前准备好的代码
     2、在需要的时候执行
     3、可以当作参数传递
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        print(sum(x: 10, y: 20))
//        
//        demo()
        
        // 1> 最简单的闭包
        // () -> () 没有参数，没有返回值的函数
        // 如果没有参数，没有返回值，可以省略，连 in 都一起省略
        let b1 = {
            print("hello")
        }
        // 执行闭包
        b1()
        
        // 2> 带参数的闭包
        // 闭包中，参数，返回值，实现代码都是写在 {} 里
        // 需要使用一个关键字 `in` 分隔定义和实现
        // { 参数列表 -> 返回值类型 // 实现代码 }
        let b2 = { (x: Int) -> () in
            print(x)
        }
        
        b2(100)
        
        // 3> 带参数/返回值的闭包
        // (Int) -> Int
        let b3 = { (x: Int) -> Int in
            return x + 250
        }
        print(b3(111))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 使用常量记录函数的演练
    func demo() {
        // 1> 定义一个常量记录 函数
        // (x: Int, y: Int) -> Int
        let f = sum
        
        // 2> 在需要的时候执行
        print(f(20, 40))
    }

    func sum(x: Int, y: Int) -> Int {
        return x + y
    }
}

