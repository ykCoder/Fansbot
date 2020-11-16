//
//  UIViewManage.h
//  KTVManage
//
//  Created by 杨康 on 2020/11/5.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "OptionalButton.h"
#import "BlockTextField.h"

typedef  void(^btnAction)(OptionalButton * _Nullable btn);
typedef  UIView * _Nullable (^TextFieldLeftView)(BlockTextField * _Nonnull textField);
typedef  UIView * _Nullable (^TextFieldRightView)(BlockTextField * _Nonnull textField);
typedef  void(^TFAction)(BlockTextField * _Nonnull textField,NSRange range,NSString * _Nullable string);
NS_ASSUME_NONNULL_BEGIN

//视图三部曲
/*
 1.创建
 2.添加
 3.布局
 */


@interface UIViewManage : NSObject<UITextFieldDelegate>
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

/**
 创建一个输入框

 @param secureTextEntry 是否开启安全输入
 @param kt 键盘样式
 @param str 占位文字（提示文字）
 @param leftView 左边View
 @param rightView 右边View
 @param requestSuccess 输入时的回调
 @return 返回一个输入框实例
 */
+(BlockTextField *)myTextFieldsecure:(BOOL)secureTextEntry
                     andkeyboardType:(UIKeyboardType)kt
                      andplaceholder:(NSString *)str
                         andLeftView:(TextFieldLeftView)leftView
                        andRightView:(TextFieldRightView)rightView
                      RequestSuccess:(TFAction)requestSuccess;



/**
 创建一个文字标签（UILabel）

 @param color 字体颜色
 @param str 文本内容
 @param font 字体大小
 @return 返回Label实例
 */
+(UILabel *)myLabel:(UIColor *)color
           andTitle:(NSString *)str
            andFont:(CGFloat )font;


/**
 创建一个文字标签（UILabel）
 
 @param color 字体颜色
 @param font 字体大小
 @return 返回Label实例
 */
+(UILabel *)myLabel:(UIColor *)color
           andTextAlignment:(NSTextAlignment)aligment
            andFont:(UIFont * )font;





@end

NS_ASSUME_NONNULL_END
