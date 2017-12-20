//
//  XZYComViewController.m
//  XZYComViewController
//
//  Created by 徐自由 on 2017/12/20.
//  Copyright © 2017年 徐自由. All rights reserved.
//
#pragma mark - 系统高度
#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height
#define NavigationHeight (iPhoneX?88:64)//导航
#define TabbarHeight (iPhoneX?34:0)//iPhoneX底部留34
#define StatusHeight (iPhoneX?44:20)//状态栏

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#import "XZYComViewController.h"

@interface XZYComViewController ()

@end

@implementation XZYComViewController
//button
- (UIButton*)buttonPhotoAlignment:(NSString*)photo hilPhoto:(NSString*)Hphoto rect:(CGRect)rect  title:(NSString*)title  select:(SEL)sel Tag:(NSInteger)tag View:(UIView*)ViewA textColor:(UIColor*)textcolor Size:(UIFont*)size background:(UIColor *)background {
    UIButton* button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = rect;
    [button setBackgroundImage:[UIImage imageNamed:photo] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:Hphoto] forState:UIControlStateHighlighted];
    [button addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal];
    button.tag = tag;
    [button setTitleColor:textcolor forState:UIControlStateNormal];
    button.titleLabel.font = size;
    button.backgroundColor = background;
    
    [ViewA addSubview:button];
    return button;
}

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
    _navView = [[UIView alloc] initWithFrame:CGRectMake(0, StatusHeight, Screen_Width, 44)];
    _navView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_navView];
}

- (void)initNavTitleView
{
    navTitleLable = [[UILabel alloc] initWithFrame:CGRectMake(50, 2, Screen_Width - 100, 40)];
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
        [self buttonPhotoAlignment:@"导航栏_返回" hilPhoto:@"" rect:CGRectMake(0, 0, 33, 44) title:@"" select:@selector(actNavBack) Tag:0 View:_navView textColor:nil Size:nil background:nil];
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
    navLeftBtn = [self buttonPhotoAlignment:nil hilPhoto:nil rect:CGRectMake(10, 0, 66, 44) title:title select:@selector(actNavLeftBtn) Tag:0 View:_navView textColor:[UIColor whiteColor] Size:[UIFont systemFontOfSize:16.0] background:nil];
}

- (void)addNavLeftBtnWithTitle:(NSString *)title rect:(CGRect)rect
{
    navLeftBtn = [self buttonPhotoAlignment:nil hilPhoto:nil rect:rect title:title select:@selector(actNavLeftBtn) Tag:0 View:_navView textColor:[UIColor whiteColor] Size:[UIFont systemFontOfSize:16.0] background:nil];
}

- (void)addNavRightBtnWithTitle:(NSString *)title
{
    navRightBtn = [self buttonPhotoAlignment:nil hilPhoto:nil rect:CGRectMake(Screen_Width - 66, 0, 66, 44) title:title select:@selector(actNavRightBtn) Tag:0 View:_navView textColor:[UIColor blackColor] Size:[UIFont systemFontOfSize:16.0] background:nil];
}
- (void)addNavRightBtnWithTitle:(NSString *)title color:(UIColor *)color
{
    navRightBtn = [self buttonPhotoAlignment:nil hilPhoto:nil rect:CGRectMake(Screen_Width-66,0, 66, 44) title:title select:@selector(actNavRightBtn) Tag:0 View:_navView textColor:color Size:[UIFont systemFontOfSize:16.0] background:nil];
}

- (void)addNavRightBtnWithTitle:(NSString *)title color:(UIColor *)color rect:(CGRect)rect

{
    navRightBtn = [self buttonPhotoAlignment:nil hilPhoto:nil rect:rect title:title select:@selector(actNavRightBtn) Tag:0 View:_navView textColor:color Size:[UIFont systemFontOfSize:16.0] background:nil];
    
}
- (void)addNavRightBtnWithTitle:(NSString *)title rect:(CGRect)rect
{
    navRightBtn = [self buttonPhotoAlignment:nil hilPhoto:nil rect:rect title:title select:@selector(actNavRightBtn) Tag:0 View:_navView textColor:[UIColor orangeColor] Size:[UIFont systemFontOfSize:16.0] background:nil];
}

- (void)addNavLeftBtnWithImage:(NSString *)image rect:(CGRect)rect
{
    navLeftBtn = [self buttonPhotoAlignment:image hilPhoto:image rect:rect title:nil select:@selector(actNavLeftBtn) Tag:0 View:_navView textColor:nil Size:nil background:nil];
    
}
- (void)addNavLeftBtnWithImage:(NSString *)image
{
    navLeftBtn = [self buttonPhotoAlignment:image hilPhoto:image rect:CGRectMake(10, 11, 44, 44) title:nil select:@selector(actNavLeftBtn) Tag:0 View:_navView textColor:nil Size:nil background:nil];
}
- (void)addNavRightBtnWithImage:(NSString *)image rect:(CGRect)rect
{
    navRightBtn = [self buttonPhotoAlignment:image hilPhoto:image rect:rect title:nil select:@selector(actNavRightBtn) Tag:0 View:_navView textColor:nil Size:nil background:nil];
    
}
- (void)addNavRightBtnWithImage:(NSString *)image
{
    navRightBtn = [self buttonPhotoAlignment:image hilPhoto:image rect:CGRectMake(Screen_Width-44-10, 11, 44, 44) title:nil select:@selector(actNavRightBtn) Tag:0 View:_navView textColor:nil Size:nil background:nil];
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


@end
