//
//  BaseViewController.m
//  WLJ
//
//  Created by 杨康 on 2018/5/5.
//  Copyright © 2018年 杨康. All rights reserved.
//

#import "BaseViewController.h"
#import "UINavigationBar+handle.h"
@interface BaseViewController ()
@end

@implementation BaseViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault; //白色
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"当前控制器%@",[self class]);
//    self.view.backgroundColor=[UIColor colorWithHexString:@"#090c15"];
    
//    [[UITabBar appearance]setTranslucent:NO];
    //    self.navigationController.navigationBar.translucent = NO;
    //    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    
    //    self.title = @"红色导航栏";
            
    //    [self.navigationController.navigationBar navBarMyLayerHeight:90];//背景高度
    //    [self.navigationController.navigationBar navBarAlpha:0.5];//透明度
    [self.navigationController.navigationBar navBarTitleColorWithBackGroundColor:clearBackBlackTitle];
//    [self.navigationController.navigationBar navBarBackGroundColor:[UIColor colorWithHexString:@"222222"] image:nil];//颜色
    
    
    //1.完全用系统的返回   特定页面停用右滑手势或左侧新添按钮
//        self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    //2.自定义返回按钮的视图，如细化返回图标。（还是系统的）
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"返回黑"]];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"返回黑"]];
    //设置tintColor 改变自定图片颜色
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    //设置自定义的返回按钮
    self.navigationItem.backBarButtonItem = backItem;
    
    
    if (self.navigationController.viewControllers.count > 1) {
                
        //3.自己写左按钮 左按钮优先级比back按钮高，会覆盖系统的返回手势和返回按钮
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftButton];
//        [self.navigationController.navigationBar navBarBottomLineHidden:NO];//隐藏底线
        
        
        
    }else
    {
//            [self.navigationController.navigationBar navBarBottomLineHidden:YES];//隐藏底线
    }
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    
}
-(UIButton *)leftButton{
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton setImage:[UIImage imageNamed:@"返回白"] forState:UIControlStateNormal];
        _leftButton.imageView.contentMode = UIViewContentModeCenter;
        [_leftButton addTarget:self action:@selector(backBarButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        _leftButton.frame = CGRectMake(0, 0, 44, 44);
        _leftButton.contentEdgeInsets = UIEdgeInsetsMake(0, -25, 0,0);
        
    }
    return _leftButton;
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    //[[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    //[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    [super touchesBegan:touches withEvent:event];
}
/// 返回按钮事件处理
- (void)backBarButtonPressed
{
    
    /// 可以返回到上一个网页，就返回到上一个网页
    if (self.webView.canGoBack) {
        
        [self.webView goBack];
    }
    else{/// 不能返回上一个网页，就返回到上一个界面
        /// 判断 是Push还是Present进来的，
        if (self.presentingViewController) {
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
        } else {
            [self.navigationController popViewControllerAnimated:YES];
            
        }
    }
    
    
    
    
    
}
//1. 将main interface设置为空 2.可以清除掉某些控制器这方面的设置
#pragma mark - 控制屏幕旋转方法
//是否自动旋转,返回YES可以自动旋转,返回NO禁止旋转
- (BOOL)shouldAutorotate{
    
    return YES;
}
//返回支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    return UIInterfaceOrientationMaskPortrait;
}
//由模态推出的视图控制器 优先支持的屏幕方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}

//需要横屏的地方加上这个 只有在当前viewController是window的rootViewController。或者是通过presentModalViewController而显示出来的.才会生效。
//支持旋转
//-(BOOL)shouldAutorotate{
//    return YES;
//}
//
////支持的方向
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    return UIInterfaceOrientationMaskLandscapeRight;
//}
//
////一开始的方向  很重要
//-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
//    return UIInterfaceOrientationLandscapeRight;
//}
@end

