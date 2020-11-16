//
//  OptionalButton.h
//  Fansbot
//
//  Created by 杨康 on 2020/11/16.
//

#import <UIKit/UIKit.h>
@class OptionalButton;
typedef  void(^clickAction)(OptionalButton * _Nullable btn);
NS_ASSUME_NONNULL_BEGIN

@interface OptionalButton : UIButton
@property(nonatomic,copy) void(^block)(OptionalButton*btn);
-(id)initWithImageName:(NSString *)imageStr
              andTitle:(NSString *)titleStr
        RequestSuccess:(clickAction)requestSuccess;
@end

NS_ASSUME_NONNULL_END
