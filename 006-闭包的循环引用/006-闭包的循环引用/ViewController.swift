//
//  ViewController.swift
//  006-闭包的循环引用
//
//  Created by lichuanjun on 2017/5/31.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 属性就是一个 var
    var completionCallBack: (()->())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // block 中如果出现 self. 要特别小心
        // `循环`引用 单方向对引用是不会产生循环引用
        // - 只是闭包对 self. 进行了copy， 闭包执行完成之后，会自动销毁，同时释放对 self 的引用
        // - 同时需要 self 对闭包引用
        loadData {
            print(self.view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
        在loadData函数有通过智能提示出现了一个@escaping的关键词,@escaping(逃逸闭包):如果一个闭包被作为一个参数传递给一个函数,并且在函数return之后才被唤起执行,那么这个闭包是逃逸闭包.并且这个闭包的参数是可以“逃出”这个函数体外的.
        
        在swift2中，可以标记一个函数参数@noescape属性,来告诉编译器传递给这个函数的闭包不允许“逃逸”出函数体外.但是在在swift3.0中,@noescape已经被移除了.引入了@escaping.
        
        创建默认不可逃逸闭包的好处:最明显的好处就是编译器优化你的代码的性能和能力.如果编译器知道这个闭包是不可逃逸的,它可以关注内存管理的关键细节.
        
        而且可以在不可逃逸闭包里放心的使用self关键字,因为这个闭包总是在函数return之前执行,你不需要去使用一个弱引用去引用self.
     */
    func loadData(completion: @escaping ()->()) -> () {
        // 使用属性记录闭包 -> self 对闭包引用了
        completionCallBack = completion
        
        // 异步
        DispatchQueue.global().async { 
            print("耗时操作")
            
            DispatchQueue.main.async {
                // 回调，执行闭包
                completion()
            }
        }
    }
    
    // 类似于 OC 的 dealloc
    deinit {
        print("我去了")
    }
}

