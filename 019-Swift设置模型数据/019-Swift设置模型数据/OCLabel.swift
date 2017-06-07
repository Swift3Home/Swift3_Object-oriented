//
//  OCLabel.swift
//  019-Swift设置模型数据
//
//  Created by lichuanjun on 2017/6/7.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class OCLabel: UILabel {

    // 模型 -> 给视图设置模型，由视图自己根据模型的数据，决定显示内容
    var person: TLPerson? {
        // *** 替代 OC 中重写 setter 方法
        // 区别： 不需要考虑 _成员变量 = 值
        // OC 中如果是copy属性，应该 _成员变量 = 值.copy
        didSet {
            // 此时 name 属性已经有值，可以直接使用UI内容
            text = person?.name
        }
    }
   
}
