//
//  ViewController.swift
//  019-Swift设置模型数据
//
//  Created by lichuanjun on 2017/6/7.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let p = TLPerson()
        p.name = "小花"
        
        let label = OCLabel(frame: CGRect(x: 20, y: 40, width: 100, height: 40))
        view.addSubview(label)
        
        // 将模型设置给 label
        label.person = p
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

