//
//  UIViewManage.h
//  KTVManage
//
//  Created by 杨康 on 2020/11/5.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "OptionalButton.h"

typedef  void(^btnAction)(OptionalButton * _Nullable btn);
NS_ASSUME_NONNULL_BEGIN

//视图三部曲
/*
 1.创建
 2.添加
 3.布局
 */


@interface UIViewManage : NSObject
/**
 创建按钮

 @param imageStr 图片
 @param titleStr 文字
 @param color    字体颜色
 @param font     字体大小
 @param radius   圆角
 @return 按钮实例
 */
+(OptionalButton *)myButtonWithImageName:(nullable NSString *)imageStr
                                andTitle:(nullable NSString *)titleStr
                              titleColor:(UIColor *)color
                               titleFont:(UIFont *)font
                         backGroundColor:(nullable UIColor *)backColor
                            cornerRadius:(CGFloat)radius
                    RequestSuccess:(btnAction)requestSuccess;
@end

NS_ASSUME_NONNULL_END
