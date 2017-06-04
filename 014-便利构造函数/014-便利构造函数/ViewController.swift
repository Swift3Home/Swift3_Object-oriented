//
//  ViewController.swift
//  014-便利构造函数
//
//  Created by lichuanjun on 2017/6/4.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let p = Person(name: "老王", age: 10)
        print(p?.name)
        
/*
        // URL 的构造函数可以返回nil
        // 构造函数就是实例化对象的
        // init?(string: String) -> 构造函数可以返回 nil
        let url = URL(string: "http://www.baidu.com")
        
        // 发起网络请求
        // - 和 OC 的区别：Swift-闭包的所有参数，需要自己写；
        //               OC-是直接带入
        // - 优点：如果不关心的值，可以直接`_`忽略
        URLSession.shared.dataTask(with: url!) { (data, _, error) in
            
            //            if(error != nil) {
            //                print("网络请求失败")
            //                return
            //            }
            
            guard let data = data else {
                print("网络请求失败 \(String(describing: error))")
                
                return
            }
            
            // 将 data 转换为 String
            let html = String(data: data, encoding: .utf8)
            
            print(html ?? "")
            
            }.resume()
*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

