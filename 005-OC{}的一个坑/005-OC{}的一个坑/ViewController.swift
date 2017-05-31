//
//  ViewController.swift
//  005-OC{}的一个坑
//
//  Created by lichuanjun on 2017/5/31.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let lbl = UILabel()
        // (lbl) 参数结束 { 尾随闭包 }
        view.addSubview(lbl);
        
        //Extra argument in call：调用了额外的参数
        // {
            let lbl = UILabel()
            view.addSubview(lbl)
        // }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

