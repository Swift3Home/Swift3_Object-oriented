//
//  TLLabel.swift
//  016-懒加载
//
//  Created by lichuanjun on 2017/6/7.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class TLLabel: UILabel {

    // 重写构造函数
    // XIB 不会调用
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    // initWithCoder -> 是使用 xib / Storyboard 开发的入口
    // 提示：所有UIView 及子类在开发是，以保证两个构造函数
    // 必须实现 initWithCoder 函数，以保证两个构造函数
    // 方法的添加 Xcode 有只能提示
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupUI()
        
        // fatalError ：如果用 XIB 开发，会直接崩溃
        // 禁止 XIB 使用本类
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        print("设置界面")
    }
}
