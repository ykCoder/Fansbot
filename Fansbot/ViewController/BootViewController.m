//
//  BootViewController.m
//  Fansbot
//
//  Created by 杨康 on 2020/11/14.
//

#import "BootViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
@interface BootViewController ()
@property(nonatomic,strong)UIImageView *bgView;
@property(nonatomic,strong)OptionalButton *skipBT;
@property(nonatomic,strong)NSTimer *timer;


@end

@implementation BootViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar navBarBottomLineHidden:YES];//隐藏底线
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar navBarBottomLineHidden:NO];//不隐藏底线
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [UDF setObject:@"has" forKey:@"hasGuide"];
    [UDF synchronize];
    
    self.bgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"测试"]];
    [self.view addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(self.view.bounds.size);
        
    }];
    
    /*
     UIViewContentModeScaleToFill,通过缩放来填满view，也就是说图片会变形
     UIViewContentModeScaleAspectFit,按比例缩放并且图片要完全显示出来，意味着view可能会留有空白
     UIViewContentModeScaleAspectFill,按比例缩放并且填满view，意味着图片可能超出view，可能被裁减掉
     */
    self.bgView.contentMode = UIViewContentModeScaleAspectFill;
    
    
    
    self.skipBT = [UIViewManage myButtonWithImageName:nil andTitle:@"跳过 3s" titleColor:[UIColor grayColor] titleFont:[UIFont systemFontOfSize:12] backGroundColor:nil cornerRadius:10 RequestSuccess:^(OptionalButton * _Nullable btn) {
        [self skipAction];
    }];
    [self.view addSubview:self.skipBT];
    [self.skipBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 25));
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom).mas_offset(-10);
        } else {
            // Fallback on earlier versions
            make.bottom.mas_equalTo(-10);
        }
        make.right.mas_equalTo(-10);
    }];
    
    self.skipBT.layer.borderWidth = 1;
    self.skipBT.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    
    

    static int total = 3;
    __weak typeof(self) weakSelf = self;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        if (total<0) {
            [timer invalidate];
            timer = nil;
            [weakSelf skipAction];
            
        }else
        {
            [weakSelf.skipBT setTitle:[NSString stringWithFormat:@"跳过 %ds",total--] forState:UIControlStateNormal];
        }
        
    }];
    
    
    
    

}

-(void)skipAction
{
    
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
//    [self.navigationController pushViewController:[LoginViewController new] animated:YES];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate switchController];
}


@end
