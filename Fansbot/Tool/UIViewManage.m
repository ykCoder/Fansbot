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
    [button addTarget:[UIViewManage parentController:button] action:@selector(endAction:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}
-(void)endAction:(OptionalButton *)btn
{
    
    [[UIViewManage parentController:btn].view endEditing:YES];
    if (btn.block) {
        btn.block(btn);
    }
}

#pragma mark --UITextField
+(BlockTextField *)myTextFieldsecure:(BOOL)secureTextEntry
                     andkeyboardType:(UIKeyboardType)kt
                      andplaceholder:(NSString *)str
                         andLeftView:(TextFieldLeftView)leftView
                        andRightView:(TextFieldRightView)rightView
                      RequestSuccess:(TFAction)requestSuccess
{
    BlockTextField *text = [[BlockTextField alloc]init];
    text.delegate = self;
    text.returnKeyType =UIReturnKeyDone;
    text.clearButtonMode = UITextFieldViewModeWhileEditing;
    text.autocorrectionType = UITextAutocorrectionTypeNo;
    text.secureTextEntry = secureTextEntry;
    text.placeholder = str;
//    text.backgroundColor=[UIColor whiteColor];
    text.layer.masksToBounds=YES;
    //字体大小(不设置默认是17)
    text.font = [UIFont systemFontOfSize:16];
    if (leftView) {
        text.leftView = leftView(text);
        text.leftViewMode = UITextFieldViewModeAlways;
    }
    if (rightView) {
        text.rightView = rightView(text);
        text.rightViewMode = UITextFieldViewModeAlways;
    }
    /*
     UIKeyboardTypeNumberPad 纯数字
     UIKeyboardTypeDefault 默认键盘
     UIKeyboardTypeDecimalPad 金额
     */
    text.keyboardType = kt;
    //    text.textColor = [UIColor redColor];
    //    //键盘外观
    //    text.keyboardAppearance=UIKeyboardAppearanceDefault;
    //    //系统默认透明
    //    text.backgroundColor=[UIColor whiteColor];
    //    //光标颜色
    //    text.tintColor=[UIColor redColor];
    
    //解决Placeholder 不居中问题(用的14）
    //    NSMutableParagraphStyle *style = [text.defaultTextAttributes[NSParagraphStyleAttributeName] mutableCopy];
    //    style.minimumLineHeight = text.font.lineHeight-(text.font.lineHeight-[UIFont systemFontOfSize:14.0].lineHeight)/2.0;
    //    text.attributedPlaceholder = [[NSAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14.0],NSParagraphStyleAttributeName : style}];
    text.block=requestSuccess;
    return text;
}
//1
- (BOOL)textFieldShouldBeginEditing:(BlockTextField *)textField
{
//    LRLog(@"将要开始编辑");
    if (textField.startBlock) {
        return  textField.startBlock(textField);
    }else
    {
        return YES;
    }
}
//2
- (void)textFieldDidBeginEditing:(BlockTextField *)textField
{
//    LRLog(@"已经开始编辑");
}
//3
- (BOOL)textFieldShouldEndEditing:(BlockTextField *)textField{
    
//    LRLog(@"将要结束编辑");
    return YES;
}
//4
- (void)textFieldDidEndEditing:(BlockTextField *)textField
{
//    LRLog(@"已经结束编辑");
}
//5  这个代理里面的textField.text不可取  可能有部分等待转化的数据
//string记录的是每步输入的字符 range表示每步输入的字符(串)的位置和长度
//stringByReplacingCharactersInRange 方法可以得到屏幕输入框内显示的所有字符
-(BOOL)textField:(BlockTextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    //得到输入框的内容
    //    NSString *toBeString=[textField.text stringByReplacingCharactersInRange:range withString:string];
    //        NSString* number= Knum;
    //        NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];
    //        return [numberPre evaluateWithObject:string];
    
    
    if (textField.block) {
        textField.block(textField,range,string);
    }
    return YES;
}
//6
- (BOOL)textFieldShouldClear:(BlockTextField *)textField{
    
//    LRLog(@"点击清除");
    textField.text=@"";
    
    if (textField.block) {
        textField.block(textField,NSMakeRange(0, 0),@"");
    }
    return YES;
}
//7
- (BOOL)textFieldShouldReturn:(BlockTextField *)textField
{
    
//    LRLog(@"点击结束");
    return [textField resignFirstResponder];
    
}

#pragma mark UILabel
+(UILabel *)myLabel:(UIColor *)color andTitle:(NSString *)str andFont:(CGFloat )font
{
    UILabel *lab=[[UILabel alloc]init];
    lab.numberOfLines=0;
    lab.text=str;
    lab.font=[UIFont systemFontOfSize:font];
    
    lab.textColor=color;
    //    lab.textAlignment = NSTextAlignmentCenter;
    return lab;
}
+(UILabel *)myLabel:(UIColor *)color
           andTextAlignment:(NSTextAlignment)aligment
            andFont:(UIFont *)font
{
    UILabel *lab=[[UILabel alloc]init];
    lab.numberOfLines=0;
    lab.font=font;
    lab.textColor=color;
    lab.textAlignment = aligment;
    return lab;
}
+(UIViewController *)parentController:(UIView *)view {
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
