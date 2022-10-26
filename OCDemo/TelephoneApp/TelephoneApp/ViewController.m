//
//  ViewController.m
//  TelephoneApp
//
//  Created by admin on 2022/10/26.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"welcome to app!";
    
    UILabel *accountNum = [[UILabel alloc] initWithFrame: CGRectMake(30, 90, 50, 40)];
    accountNum.text = @"账号:";
    
    UILabel *accountPwd = [[UILabel alloc] initWithFrame: CGRectMake(30, 150, 50, 40)];
    accountPwd.text = @"密码:";
    
    UITextField *accountNumInput = [[UITextField alloc] initWithFrame:CGRectMake(80, 90, 220, 40)];
    accountNumInput.backgroundColor = [UIColor grayColor];
    accountNumInput.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UITextField *accountPwdInput = [[UITextField alloc] initWithFrame:CGRectMake(80, 150, 220, 40)];
    accountPwdInput.backgroundColor = [UIColor grayColor];
    accountPwdInput.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(20, 220, 350, 80)];
    [self.view addSubview:view1];
    
    UILabel *rememberPwd = [[UILabel alloc] initWithFrame: CGRectMake(20, 10, 80, 40)];
    rememberPwd.text = @"记住密码";
    
    UISwitch *pwdSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(110, 10, 80, 40)];
    
    UILabel *autoLogin = [[UILabel alloc] initWithFrame: CGRectMake(200, 10, 80, 40)];
    autoLogin.text = @"自动登录";
    
    UISwitch *loginSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(290, 10, 80, 40)];
    [view1 addSubview:rememberPwd];
    [view1 addSubview:autoLogin];
    [view1 addSubview:pwdSwitch];
    [view1 addSubview:loginSwitch];

    
    [self.view addSubview:accountNum];
    [self.view addSubview:accountPwd];
    [self.view addSubview:accountNumInput];
    [self.view addSubview:accountPwdInput];
}


@end
