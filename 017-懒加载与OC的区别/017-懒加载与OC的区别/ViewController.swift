//
//  ViewController.swift
//  017-懒加载与OC的区别
//
//  Created by lichuanjun on 2017/6/7.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 注意：和 OC 不同
    // 一旦 label 被设置为nil，懒加载也不会再次执行
    // 懒加载的代码只会在第一次调用的时候，执行闭包，然后将闭包的结果保存在 label 的属性中
    private lazy var label: UILabel? = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label?.text = "hello"
        label?.sizeToFit()
        
        print(label ?? "")
        
        // 释放label
        label = nil
        
        print(label ?? "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        // Swift 中一定注意不要主动清理视图或者控件
        // 因为懒加载不会再次创建
    }


}

