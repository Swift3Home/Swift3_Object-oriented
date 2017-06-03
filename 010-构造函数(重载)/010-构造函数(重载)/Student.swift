//
//  Student.swift
//  010-构造函数(重载)
//
//  Created by lichuanjun on 2017/6/3.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

import UIKit

class Student: Person {
    
    var no: String
    
    init(name: String, no: String) {
        
        self.no = no
        
        // 调用父类的方法，给name初始化
        super.init(name: name)
        
    }
    
}
