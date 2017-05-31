//
//  ViewController.swift
//  007-解除循环引用
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
        
        // 解除循环应用，需要打断链条
        // 方法1：OC 的方式
        // 细节1 var,weak只能修饰var，不能修饰let
        // 'weak' must be a mutable variable, because it may change at runtime，解释：weak 可能会被在运行时修改 -> 指向的对象一旦被释放，会被自动设置为 nil
//        weak var weakSelf = self
//        loadData {
//            // 细节2 
//            // 解包有两种方式
//            // ? 可选解包 - 如果self 已经被释放，不会向对象发送getter的消息，更加安全
//            // ! 强行解包 - 如果self 已经被释放，强行解包会导致崩溃
//            /*
//             weakSelf?.view as Any - 只是单纯的发送消息，没有计算
//             强行解包，因为需要计算，可选项不能直接参与到计算
//             */
//            print(weakSelf?.view as Any)
//        }
        
        // 方法2 - swift 的推荐方法
        // [weak self] 表示 {} 中的所有self都是弱引用，需要注意解包
        loadData { [weak self] in
            print(self?.view as Any)
        }
        
        // 方法3 - swift 的另外方法
        // [unowned self] 表示 {} 中的所有self 都是assign 的，不会强引用，但是，如果对象释放，指针不会变化
        // 如果对象被释放，继续调用，就会出现野指针的问题
//        loadData { [unowned self] in
//            print(self.view)
//        }
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

