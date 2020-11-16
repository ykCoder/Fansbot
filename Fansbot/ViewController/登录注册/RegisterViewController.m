//
//  RegisterViewController.m
//  Fansbot
//
//  Created by 杨康 on 2020/11/16.
//

#import "RegisterViewController.h"
#import <CQCountDownButton.h>
@interface RegisterViewController ()
@property(nonatomic,strong)CQCountDownButton *countDownButton;
@property(nonatomic,strong)BlockTextField *phoneTF;
@property(nonatomic,strong)BlockTextField *passwordTF;
@property(nonatomic,strong)OptionalButton *agreeBT;


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"注册";
    
    
    UIImageView *topImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    [self.view addSubview:topImage];
    [topImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view);
            make.top.mas_equalTo(TOP_HEIGHT+20);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    
    self.phoneTF = [UIViewManage myTextFieldsecure:NO andkeyboardType:UIKeyboardTypeNumberPad andplaceholder:@"请输入手机号" andLeftView:nil andRightView:nil RequestSuccess:nil];
    [self.view addSubview:self.phoneTF];
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view);
            make.top.mas_equalTo(topImage.mas_bottom).mas_offset(20);
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
    
    
    
    BlockTextField *codeTF = [UIViewManage myTextFieldsecure:NO andkeyboardType:UIKeyboardTypeNumberPad andplaceholder:@"请输入验证码" andLeftView:nil andRightView:nil RequestSuccess:nil];
    [self.view addSubview:codeTF];
    [codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view);
            make.top.mas_equalTo(lineView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, 50));
    }];
    
    UIView *lineView2 = [[UIView alloc]init];
    [self.view addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(codeTF);
            make.top.mas_equalTo(codeTF.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, 1));
    }];
    lineView2.backgroundColor = [UIColor grayColor];
    
    
    
    
    self.passwordTF = [UIViewManage myTextFieldsecure:YES andkeyboardType:UIKeyboardTypeDefault andplaceholder:@"请输入密码" andLeftView:nil andRightView:nil RequestSuccess:nil];
    [self.view addSubview:self.passwordTF];
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view);
            make.top.mas_equalTo(lineView2.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, 50));
    }];
    
    UIView *lineView3 = [[UIView alloc]init];
    [self.view addSubview:lineView3];
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.passwordTF);
            make.top.mas_equalTo(self.passwordTF.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, 1));
    }];
    lineView3.backgroundColor = [UIColor grayColor];
    
    
    __weak typeof(self) weakSelf = self;
    //验证码按钮
    self.countDownButton = [[CQCountDownButton alloc]init];
    [codeTF addSubview:self.countDownButton];
    [self.countDownButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(codeTF);
        
        
    }];
    
    
    
    self.countDownButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.countDownButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.countDownButton setTitleColor:[UIColor colorWithHexString:@"c0c0c0"] forState:UIControlStateNormal];
    
    
    [self.countDownButton configDuration:60 buttonClicked:^{
        //========== 按钮点击 ==========//
        if ([NSString isBlankString:weakSelf.phoneTF.text]) {
            [weakSelf.view makeToast:@"请输入手机号"];
            weakSelf.countDownButton.enabled = YES;
        }else
        {
            [weakSelf.countDownButton startCountDown];
            [weakSelf getCodeNum];
        }
        
    } countDownStart:^{
        //========== 倒计时开始 ==========//
        NSLog(@"倒计时开始");
    } countDownUnderway:^(NSInteger restCountDownNum) {
        //========== 倒计时进行中 ==========//
        NSString *title = [NSString stringWithFormat:@"重新获取(%lds)", restCountDownNum];
        [weakSelf.countDownButton setTitle:title forState:UIControlStateNormal];
    } countDownCompletion:^{
        //========== 倒计时结束 ==========//
        [weakSelf.countDownButton setTitle:@"重新获取" forState:UIControlStateNormal];
        NSLog(@"倒计时结束");
    }];
    //    [self.countDownButton startCountDown];
    //========== 按钮点击 ==========//
    if ([NSString isBlankString:self.phoneTF.text]) {
        [self.view makeToast:@"请输入手机号"];
        self.countDownButton.enabled = YES;
    }else
    {
        [self.countDownButton startCountDown];
        [self getCodeNum];
    }
    
    
    //显示隐藏
    OptionalButton *showOrHide = [UIViewManage myButtonWithImageName:@"隐藏" andTitle:nil titleColor:nil titleFont:nil backGroundColor:nil cornerRadius:0 RequestSuccess:^(OptionalButton * _Nullable btn) {
        btn.selected = !btn.selected;
        self.passwordTF.secureTextEntry= btn.selected;
        
    }];
    [self.passwordTF addSubview:showOrHide];
    [showOrHide mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.passwordTF);
            make.centerX.mas_equalTo(self.countDownButton);
        
    }];
    [showOrHide setImage:[UIImage imageNamed:@"显示"] forState:UIControlStateSelected];
    
    
    
    //阅读并同意
    self.agreeBT = [UIViewManage myButtonWithImageName:@"同意" andTitle:nil titleColor:nil titleFont:nil backGroundColor:nil cornerRadius:0 RequestSuccess:^(OptionalButton * _Nullable btn) {
        btn.selected = !btn.selected;
        
        
    }];
    [self.view addSubview:self.agreeBT];
    [self.agreeBT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.passwordTF);
            make.top.mas_equalTo(self.passwordTF.mas_bottom).mas_offset(30);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [self.agreeBT setImage:[UIImage imageNamed:@"不同意"] forState:UIControlStateSelected];
    
    UILabel *textLab = [UIViewManage myLabel:[UIColor lightGrayColor] andTitle:@"我已阅读并同意" andFont:12];
    [self.view addSubview:textLab];
    [textLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.agreeBT.mas_right).mas_offset(5);
            make.centerY.mas_equalTo(self.agreeBT);
    }];
    
    
    OptionalButton *agreementBT = [UIViewManage myButtonWithImageName:nil andTitle:@"《凡尚用户协议》" titleColor:[UIColor redColor] titleFont:[UIFont systemFontOfSize:12] backGroundColor:nil cornerRadius:0 RequestSuccess:^(OptionalButton * _Nullable btn) {
        
    }];
    [self.view addSubview:agreementBT];
    [agreementBT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(textLab);
            make.left.mas_equalTo(textLab.mas_right);
    }];
    
    
    OptionalButton *regBT = [UIViewManage myButtonWithImageName:nil andTitle:@"注册" titleColor:[UIColor whiteColor] titleFont:[UIFont systemFontOfSize:16] backGroundColor:[UIColor redColor] cornerRadius:20 RequestSuccess:^(OptionalButton * _Nullable btn) {
        
    }];
    [self.view addSubview:regBT];
    [regBT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view);
            make.top.mas_equalTo(textLab.mas_bottom).mas_offset(50);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-60, 40));
            
    }];
    
    
    
    
    
}
-(void)getCodeNum
{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
