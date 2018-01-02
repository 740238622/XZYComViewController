//
//  OnewViewController.m
//  XZYComViewController
//
//  Created by 徐自由 on 2017/12/21.
//  Copyright © 2017年 徐自由. All rights reserved.
//

#import "OnewViewController.h"

@interface OnewViewController ()

@end

@implementation OnewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavTitle:@"第一个"];
    [self showMessage:@"测试测试测试测试测试测试测试测试测试测试测试测试"];
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
