//
//  ViewController.swift
//  011-构造函数(KVC)
//
//  Created by lichuanjun on 2017/6/3.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let p = Person(dict: ["name": "老张" as AnyObject])
        
        print(p.name ?? "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

