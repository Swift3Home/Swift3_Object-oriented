//
//  ViewController.swift
//  009-构造函数
//
//  Created by lichuanjun on 2017/6/2.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

/*
 在swift中，默认同一个项目中(同一个命名空间下)，所有的类都是共享的，可以直接访问，不需要 import
 所有对象的属性 var，也可以直接访问到
 */
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 实例化Person
        // () -> alloc / init
        // Swift 中对应的一个函数， init() 构造函数
        // 作用：给成员变量分配空间，初始化成员变量
//        let p = Person()
//        print(p.name)
        
        let s = Student()
        print(s.name + "----" + s.no)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

