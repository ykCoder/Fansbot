//
//  BaseViewController.h
//  WLJ
//
//  Created by 杨康 on 2018/5/5.
//  Copyright © 2018年 杨康. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "BaseNavigationController.h"





//全局变量
static NSString *identifier=@"yangkang";
@interface BaseViewController : UIViewController
//@property(nonatomic,strong)BlockTableView *tableView;
@property(nonatomic,strong)UIView *windowView;
@property(nonatomic,strong)UIView *scbgView;







@property(nonatomic,strong)WKWebView *webView;
@property(nonatomic,strong)UIImageView *baseBgView;
@property(nonatomic,strong)UIButton *leftButton;



/**
 返回方法  子类可以通过重写这个方法来自定义导航左边按钮逻辑
 */
- (void)backBarButtonPressed;
@end

