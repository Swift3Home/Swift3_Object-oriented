//
//  ViewController.swift
//  016-懒加载
//
//  Created by lichuanjun on 2017/6/7.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    var label: TLLabel?
    // 初始化并分配空间，会提前创建
    // var label = TLLabel()
    // 移动端开发，`延迟加载`减少内存消耗
    // 懒加载 - lazy
    /*
        1. 能够延迟创建
        2. 最大的好处 -> 解除解包的烦恼
     */
    lazy var label: TLLabel = TLLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setupUI() {
//        // 1. 创建控件
//        label = TLLabel()
//        
//        // 2. 添加到视图
//        // ! -- 解包，为了参与计算，addSubView 用 subviews数组记录控件，数组中不允许插入nil
//        // ? -- 可选解包，调用方法，如果为nil，不调用方法，但是不能参与计算
//        view.addSubview(label!)
//        
//        label?.text = "hello"
//        label?.sizeToFit()
//        label?.center = view.center
        
        view.addSubview(label)
        
        label.text = "hello"
        label.sizeToFit()
        label.center = view.center
    }
    
    
}

