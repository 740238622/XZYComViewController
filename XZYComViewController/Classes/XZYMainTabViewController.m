//
//  XZYMainTabViewController.m
//  XZYComViewController
//
//  Created by 徐自由 on 2017/12/20.
//  Copyright © 2017年 徐自由. All rights reserved.
//

#import "XZYMainTabViewController.h"
#import "XZYComNavtionController.h"

@interface XZYMainTabViewController ()

@end

@implementation XZYMainTabViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBar.translucent = NO;
        [self addChildViewController];
        
    }
    return self;
}
-(void)addChildViewController{
//    [self setViewControllers:@[[self WYVC],[self ...]] animated:YES];
}
//- (CommonNavtionController*)WYVC{
//
//    CDHomePageViewController *wyVC = [[CDHomePageViewController alloc]init];
//
//    XZYComNavtionController *nav = [[XZYComNavtionController alloc]initWithRootViewController:wyVC];
//    nav.navigationBarHidden=YES;
//
//    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"工具栏_首页（未选中）"] tag:0];
//    item.selectedImage = [[UIImage imageNamed:@"工具栏_首页（选中）"]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//
//    NSMutableDictionary *normalText = [NSMutableDictionary dictionary];
//    normalText[NSForegroundColorAttributeName] = [UIColor grayColor];
//    [item setTitleTextAttributes:normalText forState:UIControlStateNormal];
//
//    //选中状态
//    NSMutableDictionary *selectedText = [NSMutableDictionary dictionary];
//    selectedText[NSForegroundColorAttributeName] = MS_RGB(250,82,2);
//    [item setTitleTextAttributes:selectedText forState:UIControlStateSelected];
//
//    wyVC.tabBarItem = item;
//
//    return nav;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
