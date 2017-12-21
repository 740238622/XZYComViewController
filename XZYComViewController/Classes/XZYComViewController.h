//
//  XZYComViewController.h
//  XZYComViewController
//
//  Created by 徐自由 on 2017/12/20.
//  Copyright © 2017年 徐自由. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>

@interface XZYComViewController : UIViewController <UIGestureRecognizerDelegate,MBProgressHUDDelegate>
{
    UIButton *navLeftBtn;
    UIButton *navRightBtn;
    UILabel *navTitleLable;
    
    MBProgressHUD *HUD;
    UIColor *loadingColor;
    
    BOOL isModal;//是否是模态视图    
}

@property (nonatomic,retain)UIView *navView;
@property (nonatomic,retain)UIView *navHeadView;

#pragma mark - 回调
@property (nonatomic,copy)  void(^completeBlock)(NSString *completeStr);//字符串
@property (nonatomic,copy)  void(^completeBlock1)(NSArray *ary);//数组
@property (nonatomic,copy)  void(^completeBlockDic)(NSDictionary *dic);//字典

#pragma mark - 设置Vc的title
/**
 设置Vc的title

 @param title title
 */
- (void)setNavTitle:(NSString *)title;

#pragma mark - 添加导航栏左右按钮的方法(文本和图片)
- (void)addNavLeftBtnWithTitle:(NSString *)title;
- (void)addNavLeftBtnWithTitle:(NSString *)title rect:(CGRect)rect;

- (void)addNavRightBtnWithTitle:(NSString *)title;
- (void)addNavRightBtnWithTitle:(NSString *)title color:(UIColor *)color;
- (void)addNavRightBtnWithTitle:(NSString *)title rect:(CGRect)rect;
- (void)addNavRightBtnWithTitle:(NSString *)title color:(UIColor *)color rect:(CGRect)rect;

- (void)addNavLeftBtnWithImage:(NSString *)image;
- (void)addNavLeftBtnWithImage:(NSString *)image rect:(CGRect)rect;
- (void)addNavRightBtnWithImage:(NSString *)image;
- (void)addNavRightBtnWithImage:(NSString *)image rect:(CGRect)rect;

#pragma mark - 导航栏2边按钮的响应处理方法
- (void)actNavLeftBtn;
- (void)actNavRightBtn;

#pragma mark - 通知的相关方法
- (void)postNotification:(NSString *)notificationName;
//支付前添加 观察者
- (void)initialPayObserver;
//退出界面后移除观察者
- (void)removePayObserver;

#pragma mark - 通知的回调方法
//子类重写
- (void)paymentDone;
//子类重写
- (void)paymentFalse;

#pragma mark - 支付的处理方法
//微信支付
- (void)wechatpay:(NSString *)data;
//支付宝支付
- (void)alipay:(NSString *)data;

#pragma mark - 拨打电话
- (void)phonecall:(NSString *)tel;

#pragma mark - App跳转
- (void)openWebview:(NSString *)url;

#pragma mark - 延迟调用
- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

#pragma mark - 窗体加载进度
- (void)showLoadingView;
- (void)closeLoadingView;
- (void)showMessage:(NSString *)message;

@end
