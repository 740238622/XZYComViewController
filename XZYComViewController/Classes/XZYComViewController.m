//
//  XZYComViewController.m
//  XZYComViewController
//
//  Created by 徐自由 on 2017/12/20.
//  Copyright © 2017年 徐自由. All rights reserved.
//

#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#import "XZYComViewController.h"

@interface XZYComViewController ()

@end

@implementation XZYComViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNavView];
    [self initNavTitleView];
    [self addNavBackBtn];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.tabBarController.tabBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)initNavView
{
    //先隐藏系统的导航栏
    self.navigationController.navigationBarHidden=YES;
    _navHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, iPhoneX?44:20)];
    _navHeadView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_navHeadView];
    
    _navView = [[UIView alloc] initWithFrame:CGRectMake(0, iPhoneX?44:20, ScreenWidth, 44)];
    _navView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_navView];
}

- (void)initNavTitleView
{
    navTitleLable = [[UILabel alloc] initWithFrame:CGRectMake(50, 2, ScreenWidth - 100, 40)];
    navTitleLable.textAlignment = NSTextAlignmentCenter;
    navTitleLable.textColor = [UIColor blackColor];
    navTitleLable.userInteractionEnabled = NO;
    navTitleLable.font = [UIFont systemFontOfSize:18.0f];
    [_navView addSubview:navTitleLable];
}

- (void)addNavBackBtn
{
    if (!isModal && self.navigationController.viewControllers[0] == self) {
        return;
    }
    else
    {
        [XZYMyUtil buttonWithRect:CGRectMake(0, 0, 33, 44) backgroundPhoto:@"导航栏_返回" hilPhoto:@"" title:@"" target:self select:@selector(actNavBack) tag:0 textColor:nil fontSize:0 backgroundColor:nil view:_navView];
    }
}

- (void)actNavBack
{
    if (!isModal && self.navigationController) {
        [self.navigationController popViewControllerAnimated:true];
    }else{
        [self dismissViewControllerAnimated:true completion:nil];
    }
}

#pragma mark - 设置Vc的title
- (void)setNavTitle:(NSString *)title
{
    navTitleLable.text = title;
}

#pragma mark - 添加导航栏左右按钮的方法(文本和图片)
- (void)addNavLeftBtnWithTitle:(NSString *)title
{
    navLeftBtn = [XZYMyUtil buttonWithRect:CGRectMake(10, 0, 66, 44) backgroundPhoto:@"" hilPhoto:@"" title:title target:self select:@selector(actNavLeftBtn) tag:0 textColor:[UIColor whiteColor] fontSize:16.0 backgroundColor:nil view:_navView];
}

- (void)addNavLeftBtnWithTitle:(NSString *)title rect:(CGRect)rect
{
    navLeftBtn = [XZYMyUtil buttonWithRect:rect backgroundPhoto:@"" hilPhoto:@"" title:title target:self select:@selector(actNavLeftBtn) tag:0 textColor:[UIColor whiteColor] fontSize:16.0 backgroundColor:nil view:_navView];

    
}

- (void)addNavRightBtnWithTitle:(NSString *)title
{
    navRightBtn = [XZYMyUtil buttonWithRect:CGRectMake(ScreenWidth - 66, 0, 66, 44) backgroundPhoto:@"" hilPhoto:@"" title:title target:self select:@selector(actNavRightBtn) tag:0 textColor:[UIColor whiteColor] fontSize:16.0 backgroundColor:nil view:_navView];
}
- (void)addNavRightBtnWithTitle:(NSString *)title color:(UIColor *)color
{
    navRightBtn = [XZYMyUtil buttonWithRect:CGRectMake(ScreenWidth - 66, 0, 66, 44) backgroundPhoto:@"" hilPhoto:@"" title:title target:self select:@selector(actNavRightBtn) tag:0 textColor:color fontSize:16.0 backgroundColor:nil view:_navView];
}

- (void)addNavRightBtnWithTitle:(NSString *)title color:(UIColor *)color rect:(CGRect)rect

{
    navRightBtn = [XZYMyUtil buttonWithRect:rect backgroundPhoto:@"" hilPhoto:@"" title:title target:self select:@selector(actNavRightBtn) tag:0 textColor:color fontSize:16.0 backgroundColor:nil view:_navView];
    
}
- (void)addNavRightBtnWithTitle:(NSString *)title rect:(CGRect)rect
{
    navRightBtn = [XZYMyUtil buttonWithRect:rect backgroundPhoto:@"" hilPhoto:@"" title:title target:self select:@selector(actNavRightBtn) tag:0 textColor:[UIColor whiteColor] fontSize:16.0 backgroundColor:nil view:_navView];
}

- (void)addNavLeftBtnWithImage:(NSString *)image rect:(CGRect)rect
{
    navRightBtn = [XZYMyUtil buttonWithRect:rect backgroundPhoto:image hilPhoto:@"" title:@"" target:self select:@selector(actNavRightBtn) tag:0 textColor:[UIColor whiteColor] fontSize:16.0 backgroundColor:nil view:_navView];

    
}
- (void)addNavLeftBtnWithImage:(NSString *)image
{
    navRightBtn = [XZYMyUtil buttonWithRect:CGRectMake(10, 11, 44, 44) backgroundPhoto:image hilPhoto:@"" title:@"" target:self select:@selector(actNavRightBtn) tag:0 textColor:[UIColor whiteColor] fontSize:16.0 backgroundColor:nil view:_navView];

}
- (void)addNavRightBtnWithImage:(NSString *)image rect:(CGRect)rect
{
    navRightBtn = [XZYMyUtil buttonWithRect:rect backgroundPhoto:image hilPhoto:@"" title:@"" target:self select:@selector(actNavRightBtn) tag:0 textColor:[UIColor whiteColor] fontSize:16.0 backgroundColor:nil view:_navView];
    
}
- (void)addNavRightBtnWithImage:(NSString *)image
{
    navRightBtn = [XZYMyUtil buttonWithRect:CGRectMake(ScreenWidth-44-10, 11, 44, 44) backgroundPhoto:image hilPhoto:@"" title:@"" target:self select:@selector(actNavRightBtn) tag:0 textColor:[UIColor whiteColor] fontSize:16.0 backgroundColor:nil view:_navView];

}

#pragma mark - 导航栏2边按钮的响应处理方法
- (void)actNavLeftBtn
{
    //子类去实现
}

- (void)actNavRightBtn
{
    //子类去实现
}

#pragma mark - 通知的相关方法
- (void)postNotification:(NSString *)notificationName
{
    NSLog(@"notification:%@", notificationName);
    NSNotificationCenter * notifyCenter = [NSNotificationCenter defaultCenter];
    NSNotification *nnf = [NSNotification notificationWithName:notificationName object:nil];
    [notifyCenter postNotification:nnf];
}
//支付前添加 观察者
- (void)initialPayObserver
{
    NSLog(@"initialPayObserver");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(paymentDone) name:@"payment.done" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(paymentFalse) name:@"payment.false" object:nil];
}
//退出界面后移除观察者
- (void)removePayObserver
{
    NSLog(@"removePayObserver");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"payment.done" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"payment.false" object:nil];
}

#pragma mark - 通知的回调方法
- (void)paymentDone
{
    //子类重写
}
- (void)paymentFalse
{
    //子类重写
}

#pragma mark - 支付的处理方法
- (void)wechatpay:(NSDictionary *)payinfo
{
    //    NSDictionary* payinfo=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    //    NSDictionary* payinfo = [requestData JSONValue];
    //
    //    NSLog(@"payinfo:%@", payinfo);
    //
    //    NSString* noncestr = [payinfo objectForKey:@"noncestr"];
    //    NSString* partnerid = [payinfo objectForKey:@"partnerid"];
    //    NSString* prepayid = [payinfo objectForKey:@"prepayid"];
    //    NSNumber* timestamp = [payinfo objectForKey:@"timestamp"];
    //    NSString* sign = [payinfo objectForKey:@"sign"];
    //    NSString* packageValue = [payinfo objectForKey:@"package"];
    //
    //    PayReq *request = [[PayReq alloc] init];
    //    request.partnerId = partnerid;
    //    request.prepayId= prepayid;
    //    request.package = packageValue;
    //    request.nonceStr= noncestr;
    //    request.timeStamp= [timestamp intValue];
    //
    //    request.sign= sign;
    //
    //    //会跳转到微信界面
    //    [WXApi sendReq:request];
    //
    //    [AppDelegate sharedAppDelegate].isWeiPay=YES;
}

- (void)alipay:(NSString*)data
{
    //    NSString *appScheme = @"123"; //自己定义
    //
    //    [[AlipaySDK defaultService] payOrder:data fromScheme:appScheme callback:^(NSDictionary *resultDic) {
    //        NSLog(@"reslut = %@",resultDic);
    //        //支付宝支付完成以后的工作
    //        NSNumber* resultStatus = [resultDic objectForKey:@"resultStatus"];
    //
    //        if(resultStatus && [resultStatus intValue]==9000) {
    //
    //            NSLog(@"支付成功:客户端");
    //            [self postNotification:@"payment.done"];
    //        }
    //        else
    //        {
    //            [self postNotification:@"payment.false"];
    //        }
    //    }];
}

#pragma mark - 拨打电话
- (void)phonecall:(NSString *)tel
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",tel]];
    [[UIApplication sharedApplication] openURL:url];
}

#pragma mark - App跳转
- (void)openWebview:(NSString *)url
{
    NSURL * currentURL = [NSURL URLWithString:url];
    UIApplication * app = [UIApplication sharedApplication];
    if([app canOpenURL:currentURL]) {
        [app openURL:currentURL];
    }
}

#pragma mark - 延迟调用
- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay
{
    int64_t delta = (int64_t)(1.0e9 * delay);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), dispatch_get_main_queue(), block);
}

#pragma mark - 窗体加载进度
- (void)showLoadingView
{
    HUD = [[MBProgressHUD alloc] init];
    HUD.frame = self.view.bounds;
    [self.view addSubview:HUD];
    
    // Set the hud to display with a color
//    if(loadingColor){
//        HUD.bezelView.color = loadingColor;
//    }else{
////        HUD.bezelView.color = [UIColor colorWithRed:64/255.0f green:64/255.0f blue:64/255.0f alpha:0.7];
//        HUD.bezelView.color = [UIColor clearColor];
//    }
    HUD.bezelView.color = [UIColor clearColor];
    HUD.delegate = self;
    HUD.label.text = @"加载中…";
    
    [HUD showAnimated:true];
    
    //    UIView *mView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    //
    //    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    //    view1.backgroundColor = [UIColor blackColor];
    //    view1.alpha = 0.3;
    //    view1.layer.cornerRadius = 15.0f;
    //    [mView addSubview:view1];
    //    UIImage  *image = [UIImage sd_animatedGIFNamed:@"ios加载动效"];
    //    UIImageView  *gifview=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,80, 80)];
    //    gifview.image=image;
    //    [mView addSubview:gifview];
    //    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //    HUD.color=[UIColor clearColor];//默认颜色太深了
    //    HUD.mode = MBProgressHUDModeCustomView;
    //    HUD.customView=mView;
}

- (void)closeLoadingView
{
    if (HUD) {
        [HUD hideAnimated:true];
    }
}

- (void)showMessage:(NSString *)message
{
    NSLog(@"showMessage:%@", message);
    if(self) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.detailsLabel.text = message;
        hud.detailsLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        hud.bezelView.color = [UIColor clearColor];

        [hud hideAnimated:YES afterDelay:2];
    }
}

@end
