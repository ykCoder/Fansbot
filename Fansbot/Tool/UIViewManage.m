//
//  UIViewManage.m
//  KTVManage
//
//  Created by 杨康 on 2020/11/5.
//

#import "UIViewManage.h"

@implementation UIViewManage
+(OptionalButton *)myButtonWithImageName:(NSString *)imageStr
                                andTitle:(NSString *)titleStr
                              titleColor:(UIColor *)color
                               titleFont:(UIFont *)font
                         backGroundColor:(UIColor *)backColor
                            cornerRadius:(CGFloat)radius
                    RequestSuccess:(btnAction)requestSuccess
{
    OptionalButton *button=[OptionalButton buttonWithType:UIButtonTypeCustom];
    if (imageStr) {
        [button setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    }
    if (titleStr) {
        [button setTitle:titleStr forState:UIControlStateNormal];
    }
    button.layer.masksToBounds=YES;
    button.layer.cornerRadius=radius;
    if (color) {
        [button setTitleColor:color forState:UIControlStateNormal];
    }
    if (font) {
        button.titleLabel.font=font;
    }
    
    
    if (backColor) {
      button.backgroundColor = backColor;
    }
    
    button.block=requestSuccess;
    [button addTarget:self action:@selector(endAction:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}
-(void)endAction:(OptionalButton *)btn
{
    
    [[self parentController:btn].view endEditing:YES];
    if (btn.block) {
        btn.block(btn);
    }
}
- (UIViewController *)parentController:(UIView *)view {
    UIResponder *responder = [view nextResponder];
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}
@end
