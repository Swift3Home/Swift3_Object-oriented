//
//  ViewController.swift
//  008-加法计算器
//
//  Created by lichuanjun on 2017/6/2.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numText1: UITextField?
    var numText2: UITextField?
    var resultLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 计算结果
    func calc() -> () {
        // 将文本框内容转换为数值
        // Int? 如果文本框内容不是数字 Int 之后是 nil
        guard let num1 = Int(numText1?.text ?? ""),
            let num2 = Int(numText2?.text ?? "") else {
                
                print("必须都是输入数字才能计算")
                return
        }
        
        // 处理结果
        resultLabel?.text = "\(num1 + num2)"
    }
    
    func setupUI() -> () {
        // 1.两个 UITextField
        let tf1 = UITextField(frame: CGRect(x: 20, y: 20, width: 100, height: 30))
        tf1.borderStyle = .roundedRect
        tf1.text = "0"
        view.addSubview(tf1)
        
        let tf2 = UITextField(frame: CGRect(x: 140, y: 20, width: 100, height: 30))
        tf2.borderStyle = .roundedRect
        tf2.text = "0"
        view.addSubview(tf2)

        // 记录属性
        numText1 = tf1
        numText2 = tf2
        
        // 2.三个 UILable
        let lbl1 = UILabel(frame: CGRect(x: 120, y: 20, width: 20, height: 30))
        lbl1.text = "+"
        lbl1.textAlignment = .center
        view.addSubview(lbl1)
        
        let lbl2 = UILabel(frame: CGRect(x: 240, y: 20, width: 20, height: 30))
        lbl2.text = "="
        lbl2.textAlignment = .center
        view.addSubview(lbl2)
        
        let lbl3 = UILabel(frame: CGRect(x: 240, y: 20, width: 60, height: 30))
        lbl3.text = "0"
        lbl3.textAlignment = .right
        view.addSubview(lbl3)
        
        resultLabel = lbl3
        // 3.一个 UIButton
        let btn = UIButton()
        btn.setTitle("计算", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.sizeToFit()
        btn.center = view.center
        view.addSubview(btn)
        
        btn.addTarget(self, action: #selector(calc), for: .touchUpInside)
    }

}

