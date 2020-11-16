//
//  AppDelegate.m
//  Fansbot
//
//  Created by 杨康 on 2020/11/14.
//

#import "AppDelegate.h"
#import "BootViewController.h"
#import "LoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    //切换根视图
    [self switchController];
    [self.window makeKeyAndVisible];
    //    [self.window reloadInputViews];
    return YES;
}
/**
 切换窗口
 */
-(void)switchController{
    
    
    //如果没有展示过引导页
    if ([NSString isBlankString:GUIDE]) {
        
        BootViewController *bootVC = [[BootViewController alloc]init];
        BaseNavigationController *bootNC = [[BaseNavigationController alloc] initWithRootViewController:bootVC];
        
        self.window.rootViewController = bootNC;
        
        
    }
    else
    {
        //登录过直接进首页
            if (![NSString isBlankString:APPTOKEN]) {
        
//                SystemViewController *tabVC = [[SystemViewController alloc]init];
//                //    ViewController *tabVC = [ViewController new];
//                self.window.rootViewController = tabVC;
        
            }else{
                //没登录过进登录页面
                LoginViewController *logVC = [[LoginViewController alloc]init];
                BaseNavigationController *logNC = [[BaseNavigationController alloc] initWithRootViewController:logVC];
                self.window.rootViewController = logNC;
            }
        
    }

    
}




@end
