//
//  ViewController.swift
//  004-GCD
//
//  Created by lichuanjun on 2017/5/30.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadData { (result) in
            print("获取的新闻数据 \(result)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
     在异步执行任务，获取结果，通过block/ 闭包 回调
     Swift 中闭包的应用场景和block完全一致
     */
    func loadData(completion: @escaping (_ result: [String])->()) -> () {
        // 将任务添加到列表，指定执行任务函数
        // 翻译：队列调度任务(block/闭包)，以同步/异步的方式执行
        DispatchQueue.global().async {
            print("耗时操作 \(Thread.current)")
            
            // 休眠
            Thread.sleep(forTimeInterval: 1.0)

            // 获取结果
            let json = ["头条", "八卦", "出大事了"]
            
            // 主队列回调
            DispatchQueue.main.async(execute: {
                print("主线程更新 UI \(Thread.current)")
                
                // 回调 -> 执行 闭包(通过参数传递的)
                // 传递异步获取结果
                completion(json)
            })
        }
        
    }
}

