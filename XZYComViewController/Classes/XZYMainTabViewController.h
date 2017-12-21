//
//  XZYMainTabViewController.h
//  XZYComViewController
//
//  Created by 徐自由 on 2017/12/20.
//  Copyright © 2017年 徐自由. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XZYMainTabViewController : UITabBarController

/**
 初始化

 @param images 默认图片
 @param selectImg 选中图片
 @param titles titles
 @param color 选中颜色
 @param viewControllers 控制器数组
 @return return value description
 */
- (id)initWithTabbarImages:(NSArray *)images selectImg:(NSArray *)selectImg titles:(NSArray *)titles selectTitleColor:(UIColor *)color viewControllers:(NSArray *)viewControllers;

@end
