//
//  OCViewController.m
//  007-解除循环引用
//
//  Created by lichuanjun on 2017/5/31.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "OCViewController.h"

@interface OCViewController ()

@property (nonatomic, copy) void (^completionCallBack)();

@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    // 解除引用1：__weak
//    __weak typeof(self) weakSelf = self;
//    [self loadData:^{
//        NSLog(@"%@",weakSelf.view);
//    }];
    
    // 解除引用2：__unsafe_unretained
    // 高级 iOS 程序员如果需要自行管理内存，可以考虑使用，但是不建议使用
    __unsafe_unretained typeof(self) weakSelf = self;
    // EXC_BAD_ACCESS 坏内存访问，野指针访问
    // __unsafe_unretained 同样是 assgin 的引用（MRC中没有weak）
    // 在MRC中如果要弱引用对象都是使用 assgin，不会增加引用计数，但是一旦对象被释放，地址不会改变，继续访问，出现野指针
    // 在MRC weak, 本质上是一个观察者模式，一旦发现对象被释放，会自动将地址设置为nil，更加安全
    // 效率：weak 的效率会略差一些
    [self loadData:^{
        NSLog(@"%@",weakSelf.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadData:(void (^)())completion {
    
    // 使用属性记录 block
    self.completionCallBack = completion;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"耗时操作%@", [NSThread currentThread]);
        
        [NSThread sleepForTimeInterval:2.0];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            // 执行block
            completion();
        });
    });
}

@end
