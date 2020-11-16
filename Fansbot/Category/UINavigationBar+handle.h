//
//  UINavigationBar+handle.h
//  Funny
//
//  Created by 谢兴达 on 2018/4/6.
//  Copyright © 2018年 谢兴达. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (handle)

typedef NS_ENUM(NSInteger, titleAndBackColor)
{
    blackBackWhiteTitle = 0,  //黑色背景白色字体
    whiteBackBlackTitle,      //白色背景黑色字体
    clearBackBlackTitle,      //透明背景黑色字体
    clearBackWhiteTitle,       //透明背景白色字体
    blueBackWhiteTitle         //蓝色背景白色字体
};

/**
 更改导航栏和字体

 @param type 样式
 */
-(void)navBarTitleColorWithBackGroundColor:(titleAndBackColor)type;

/**
 更改导航栏颜色和图片

 @param color 颜色
 @param barImage 图片
 */
- (void)navBarBackGroundColor:(UIColor *_Nullable)color image:(UIImage *_Nullable)barImage;

/**
 更改透明度

 @param alpha 导航栏透明度
 */
- (void)navBarAlpha:(CGFloat)alpha;

/**
 导航栏背景高度
 注意*这里并没有改导航栏高度，只是改了自定义背景报读

 @param height 高度
 */
- (void)navBarMyLayerHeight:(CGFloat)height;

/**
 隐藏底线
 */
- (void)navBarBottomLineHidden:(BOOL)hidden;

//还原回系统导航栏
- (void)navBarToBeSystem;
@end

#pragma mark -- 自定义导航栏层
@interface MyNavLayer :CALayer
@property (nonatomic, assign) CGFloat   alpha;
@property (nonatomic, assign) BOOL      hiddenBottomLine;
@property (nonatomic, strong) UIColor   * _Nullable backColor;
@property (nonatomic, strong) UIImage   * _Nullable backImage;

- (instancetype _Nullable )initWithFrame:(CGRect)frame;
@end
