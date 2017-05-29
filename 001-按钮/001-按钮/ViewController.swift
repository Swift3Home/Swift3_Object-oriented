//
//  ViewController.swift
//  001-按钮
//
//  Created by lichuanjun on 2017/5/28.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let btn = UIButton()
        // raw 原始的，使用一个值调用枚举的构造函数，创建一个枚举值
        btn.setTitle("come on", for: UIControlState(rawValue: 0))
        btn.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: UIControlState(rawValue: 0))
//        btn.setTitle("come on", for: .normal)
//        btn.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: .normal)
        btn.sizeToFit()
        
        btn.center = view.center
        
        view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

