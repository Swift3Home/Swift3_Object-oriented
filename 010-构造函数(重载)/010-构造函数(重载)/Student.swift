//
//  Student.swift
//  009-构造函数
//
//  Created by lichuanjun on 2017/6/2.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class Student: Person {
    //学号
    var no: String
    // `重写` person 的构造函数，父类方法不能满足需求
    override init() {
        print("Student init")
        
        no = "001"
        
        super.init()
    }
}
