//
//  Book.m
//  010-构造函数(重载)
//
//  Created by lichuanjun on 2017/6/3.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "Book.h"


@interface Book()

@property(nonatomic, copy) NSString *bookName;

@end

@implementation Book

- (instancetype)init
{
    // 1. 调用父类的方法，给父类初始化
    self = [super init];
    
    // 2.为什么要有 if 呢？ -> 有可能初始化错误，无法创建父类
    if (self) {
        _bookName = @"iPhone";
    }
    return self;
}

@end
