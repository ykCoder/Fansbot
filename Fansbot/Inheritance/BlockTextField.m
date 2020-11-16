//
//  BlockTextField.m
//  Fansbot
//
//  Created by 杨康 on 2020/11/16.
//

#import "BlockTextField.h"

@implementation BlockTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    [UIMenuController sharedMenuController].menuVisible = NO;
    if (action == @selector(copy:)) {
        return NO;
    } else if (action == @selector(selectAll:)) {
        return NO;
    }else if (action == @selector(cut:)) {
        return NO;
    }else if (action == @selector(paste:)) {
        return NO;
    }else if (action == @selector(select:)) {
        return NO;
    }
    
    return NO;
}
@end
