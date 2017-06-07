//
//  OCViewController.m
//  017-懒加载与OC的区别
//
//  Created by lichuanjun on 2017/6/7.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "OCViewController.h"

@interface OCViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation OCViewController

-(UILabel *)label {
    
    // 如果 _label = nil，就会创建
    if (_label == nil) {
        _label = [[UILabel alloc] init];
        
        _label.text = @"My Label";
        [_label sizeToFit];
        _label.center = self.view.center;
    }
    
    return _label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.label];
    
    // 释放 label
    _label = nil;
    
    // 会再次调用懒加载的代码
    NSLog(@"%@",self.label);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    // 接收到内存警告，可以释放视图
    // On iOS 6.0 it will no longer clear the view by default.
    // iOS 6.0 之后，不会再清理视图，视图会始终保留
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
