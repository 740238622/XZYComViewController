//
//  XZYComNavtionController.m
//  rainbow
//
//  Created by 徐自由 on 2017/11/18.
//  Copyright © 2017年 徐自由. All rights reserved.
//

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)//iPhoneX

#import "XZYComNavtionController.h"

@interface XZYComNavtionController ()

@end

@implementation XZYComNavtionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    // 重写super
    [super pushViewController:viewController animated:animated];
    
    // 修改tabBra的frame
    if(iPhoneX){
        CGRect frame = self.tabBarController.tabBar.frame;
        frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
        self.tabBarController.tabBar.frame = frame;
    }
    
}

@end
