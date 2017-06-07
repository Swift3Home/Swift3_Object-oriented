//
//  ViewController.swift
//  018-计算型属性
//
//  Created by lichuanjun on 2017/6/7.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p = TLPerson()
        
        // setter
        p.name = "老王"
        // getter
        print(p.name ?? "")
        
        print(p.title)
        // Cannot assign to property: 'title' is a get-only property
//        p.title = ""
        
        print(p.title2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

