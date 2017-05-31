//
//  OCViewController.m
//  005-OC{}的一个坑
//
//  Created by lichuanjun on 2017/5/31.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "OCViewController.h"

@interface OCViewController ()

@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *lbl = [[UILabel alloc] init];
    [self.view addSubview:lbl];
    
    // 区分变量的作用域
    {
        UILabel *lbl = [[UILabel alloc] init];
        [self.view addSubview:lbl];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
