//
//  BlockTextField.h
//  Fansbot
//
//  Created by 杨康 on 2020/11/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlockTextField : UITextField
/**
 输入框输入回调
 */
@property(nonatomic,copy) void(^block)(BlockTextField *textField,NSRange range,NSString *string);
@property(nonatomic,copy) BOOL(^startBlock)(BlockTextField *textField);

/**
 输入框左边视图
 */
@property(nonatomic,copy)UIView* (^TextFieldLeftView)(BlockTextField *textField);
@end

NS_ASSUME_NONNULL_END
