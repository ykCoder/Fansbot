//
//  LoginViewController.m
//  Fansbot
//
//  Created by 杨康 on 2020/11/16.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property(nonatomic,strong)BlockTextField *phoneTF;
@property(nonatomic,strong)BlockTextField *passwordTF;
@end

@implementation LoginViewController
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
    
    
    UIImageView *logoImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    [self.view addSubview:logoImage];
    [logoImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view);
            make.top.mas_equalTo(TOP_HEIGHT+20);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    self.phoneTF = [UIViewManage myTextFieldsecure:NO andkeyboardType:UIKeyboardTypeNumberPad andplaceholder:@"请输入手机号" andLeftView:nil andRightView:nil RequestSuccess:nil];
    [self.view addSubview:self.phoneTF];
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view);
            make.top.mas_equalTo(logoImage.mas_bottom).mas_offset(20);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, 50));
    }];
    
    UIView *lineView = [[UIView alloc]init];
    [self.view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.phoneTF);
            make.top.mas_equalTo(self.phoneTF.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, 1));
    }];
    lineView.backgroundColor = [UIColor grayColor];
    
    
    
    
    
    
    
    
    self.passwordTF = [UIViewManage myTextFieldsecure:YES andkeyboardType:UIKeyboardTypeDefault andplaceholder:@"请输入密码" andLeftView:nil andRightView:nil RequestSuccess:nil];
    [self.view addSubview:self.passwordTF];
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view);
            make.top.mas_equalTo(lineView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, 50));
    }];
    
    UIView *lineView2 = [[UIView alloc]init];
    [self.view addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.passwordTF);
            make.top.mas_equalTo(self.passwordTF.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, 1));
    }];
    lineView2.backgroundColor = [UIColor grayColor];
    
    //显示隐藏
    OptionalButton *showOrHide = [UIViewManage myButtonWithImageName:@"隐藏" andTitle:nil titleColor:nil titleFont:nil backGroundColor:nil cornerRadius:0 RequestSuccess:^(OptionalButton * _Nullable btn) {
    
         
        btn.selected = !btn.selected;
        self.passwordTF.secureTextEntry= btn.selected;
        
    }];
    [self.passwordTF addSubview:showOrHide];
    [showOrHide mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.passwordTF);
            make.right.mas_equalTo(-50);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        
    }];
    showOrHide.backgroundColor = [UIColor redColor];
    [showOrHide setImage:[UIImage imageNamed:@"显示"] forState:UIControlStateSelected];
    
    
    //忘记密码
    OptionalButton *forgetPassWord = [UIViewManage myButtonWithImageName:nil andTitle:@"忘记密码" titleColor:[UIColor redColor] titleFont:[UIFont systemFontOfSize:14] backGroundColor:nil cornerRadius:0 RequestSuccess:^(OptionalButton * _Nullable btn) {
        
    }];
    [self.view addSubview:forgetPassWord];
    [forgetPassWord mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.passwordTF);
            make.top.mas_equalTo(self.passwordTF.mas_bottom).mas_offset(20);
            
    }];
    
    
    
    OptionalButton *logBT = [UIViewManage myButtonWithImageName:nil andTitle:@"登录" titleColor:[UIColor whiteColor] titleFont:[UIFont systemFontOfSize:16] backGroundColor:[UIColor redColor] cornerRadius:20 RequestSuccess:^(OptionalButton * _Nullable btn) {
        
    }];
    [self.view addSubview:logBT];
    [logBT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view);
            make.top.mas_equalTo(forgetPassWord.mas_bottom).mas_offset(50);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-60, 40));
            
    }];
    
    
    
    OptionalButton *regBT = [UIViewManage myButtonWithImageName:nil andTitle:nil titleColor:nil titleFont:nil backGroundColor:nil cornerRadius:0 RequestSuccess:^(OptionalButton * _Nullable btn) {
        
    }];
    [self.view addSubview:regBT];
    [regBT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view);
            make.top.mas_equalTo(logBT.mas_bottom).mas_offset(30);
            
    }];
    NSString *str1 = @"没有账号？";
    NSString *str2 = @"注册";
    [regBT setAttributedTitle:[NSString setRichText:str1 withFont:12 withColor:[UIColor grayColor] andOtherText:str2 withFont:12 withColor:[UIColor redColor] atIndex:str1.length] forState:UIControlStateNormal];
    
    
    
    UIView *lineView3 = [[UIView alloc]init];
    [self.view addSubview:lineView3];
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view);
            make.top.mas_equalTo(regBT.mas_bottom).mas_offset(20);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, 1));
    }];
    lineView3.backgroundColor = [UIColor grayColor];
    
    
    UILabel *orLab = [UIViewManage myLabel:[UIColor blackColor] andTitle:@"  OR  " andFont:25];
    [lineView3 addSubview:orLab];
    [orLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(lineView3);
            
    }];
    orLab.backgroundColor = [UIColor whiteColor];
    
    
    
    OptionalButton *wxBT = [UIViewManage myButtonWithImageName:@"微信" andTitle:@"微信账号登录" titleColor:[UIColor blackColor] titleFont:[UIFont systemFontOfSize:14] backGroundColor:[UIColor whiteColor] cornerRadius:20 RequestSuccess:^(OptionalButton * _Nullable btn) {
        
    }];
    [self.view addSubview:wxBT];
    [wxBT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view);
            make.top.mas_equalTo(lineView3.mas_bottom).mas_offset(30);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, 40));
    }];
    
    wxBT.layer.borderColor = [UIColor lightGrayColor].CGColor;
    wxBT.layer.borderWidth = 1;
    
    
    
    
}



@end
