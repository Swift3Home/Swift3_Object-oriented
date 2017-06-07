//
//  ViewController.swift
//  018-计算型属性
//
//  Created by lichuanjun on 2017/6/7.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var p = TLPerson()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let p = TLPerson()
        
        // setter
        p.name = "老王"
        // getter
        print(p.name ?? "")
        
        print(p.title)
        // Cannot assign to property: 'title' is a get-only property
        // 不能给 get-only 属性设置值
//        p.title = "XXX"
        
        // 不允许修改只读属性
//        p.title2 = "XXX"
        print(p.title2)
        
        print(p.title3)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        p.name = "花花"
        print(p.title2)
        print(p.title3)
    }

}

