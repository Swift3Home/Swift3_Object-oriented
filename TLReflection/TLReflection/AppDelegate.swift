//
//  AppDelegate.swift
//  TLReflection
//
//  Created by lichuanjun on 2017/6/8.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

/// Xcode 8.0 OC的NSLog 都不能在控制台输出，所有和OC相关的错误，控制台同样无法显示
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    /**
     1. 知道 Swift 中有命名空间
        - 在同一个命名空间，全局共享
        - 第三方框架使用 Swift 如果直接拖拽到项目中，从属于同一个命名空间，很有可能冲突
        - 以后尽量都要用 cocoapod
     2. 重点要知道 Swift 中 NSClassFromString(反射机制)的写法
        - 反射最重要的目的，就是为了解耦
        - 搜索`反射机制和工厂方法`
        - 提示：第一印象会发现一个简单的功能，写的很复杂
        - 但是，封装的很好，而且弹性很大
     */
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // 代码中的 ？都是 `可选`解包，发送消息，不参与计算
        // 1. 实例化 window
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        
        
        // 2. 设置 根控制器，需要添加命令空间 -> 默认就是`项目名称(最好不要有数字和特殊符号)`
        // 2.1 反射机制
        let clsName = "TLReflection.ViewController"
        // AnyClass? -> 视图控制器的类型
        let cls = NSClassFromString(clsName) as? UIViewController.Type
        
        // 使用类创建视图控制器
        // UIViewController?
        let vc = cls?.init()
        
        // 2.2常规用法
//        let vc = ViewController()
        window?.rootViewController = vc
        
        // 3. 显示 window
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

