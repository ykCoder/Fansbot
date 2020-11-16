//
//  BaseNavigationController.m
//  YbkRepairman
//
//  Created by 杨康 on 2018/6/11.
//  Copyright © 2018年 杨康. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count == 0) {
        return [super pushViewController:viewController animated:animated];
    }else if (self.viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
//    //设置右滑返回手势的代理为自身
//    __weak typeof(self) weakself = self;
//    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.interactivePopGestureRecognizer.delegate = (id)weakself;
//    }
}
//#pragma mark - UIGestureRecognizerDelegate
////这个方法是在手势将要激活前调用：返回YES允许右滑手势的激活，返回NO不允许右滑手势的激活
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
//{
//    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
//        //屏蔽调用rootViewController的滑动返回手势，避免右滑返回手势引起死机问题
//        if (self.viewControllers.count < 2 ||
// self.visibleViewController == [self.viewControllers objectAtIndex:0]) {
//            return NO;
//        }
//    }
//    //这里就是非右滑手势调用的方法啦，统一允许激活
//    return YES;
//}



//设置样式
//1、plist View controller-based status bar appearance 设置为 YES 或者默认(不设置)
- (UIStatusBarStyle)preferredStatusBarStyle {
//    UIViewController *topVC = self.topViewController;
//    return [topVC preferredStatusBarStyle];
    return UIStatusBarStyleDefault;
}
//设置是否隐藏
- (BOOL)prefersStatusBarHidden {
    
    return NO;
}

//设置隐藏动画
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationNone;
}
#pragma mark - 控制屏幕旋转方法
- (BOOL)shouldAutorotate{
    return [[self.viewControllers lastObject]shouldAutorotate];
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return [[self.viewControllers lastObject]supportedInterfaceOrientations];
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
}
@end
