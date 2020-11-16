//
//  OptionalButton.m
//  Fansbot
//
//  Created by 杨康 on 2020/11/16.
//

#import "OptionalButton.h"

@implementation OptionalButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithImageName:(NSString *)imageStr andTitle:(NSString *)titleStr RequestSuccess:(clickAction)requestSuccess
{
    self = [super init];
    if (self) {
        if (imageStr) {
            [self setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
        }
        if (titleStr) {
            [self setTitle:titleStr forState:UIControlStateNormal];
        }
        self.block=requestSuccess;
        [self addTarget:self action:@selector(endAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

-(void)endAction:(OptionalButton *)btn
{
    [[btn getMyparentController].view endEditing:YES];

    if (btn.block) {
        btn.block(btn);
    }
}
@end
