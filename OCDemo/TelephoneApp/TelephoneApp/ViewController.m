//
//  ViewController.m
//  TelephoneApp
//
//  Created by admin on 2022/10/26.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property(weak, nonatomic) UITextField *accountNumInput;
@property(weak, nonatomic) UITextField *accountPwdInput;
@property(weak, nonatomic) UISwitch *pwdSwitch;
@property(weak, nonatomic) UISwitch *loginSwitch;
@property(weak, nonatomic) UIButton *loginBtn;
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
    self.accountNumInput = accountNumInput;
    
    UITextField *accountPwdInput = [[UITextField alloc] initWithFrame:CGRectMake(80, 150, 220, 40)];
    accountPwdInput.backgroundColor = [UIColor grayColor];
    accountPwdInput.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.accountPwdInput = accountPwdInput;
    
    self.accountNumInput.delegate = self;
    self.accountPwdInput.delegate = self;
    
    [self.accountNumInput addTarget:self action:@selector(textDidChange) forControlEvents:UIControlEventEditingChanged];
    [self.accountPwdInput addTarget:self action:@selector(textDidChange) forControlEvents:UIControlEventEditingChanged];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(20, 220, 350, 80)];
    [self.view addSubview:view1];
    
    UILabel *rememberPwd = [[UILabel alloc] initWithFrame: CGRectMake(20, 10, 80, 40)];
    rememberPwd.text = @"记住密码";
    
    UISwitch *pwdSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(110, 10, 80, 40)];
    self.pwdSwitch = pwdSwitch;
    [self.pwdSwitch addTarget:self action:@selector(switchDidChange) forControlEvents:UIControlEventValueChanged];
    
    UILabel *autoLogin = [[UILabel alloc] initWithFrame: CGRectMake(200, 10, 80, 40)];
    autoLogin.text = @"自动登录";
    
    UISwitch *loginSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(290, 10, 80, 40)];
    self.loginSwitch = loginSwitch;
    
    [view1 addSubview:rememberPwd];
    [view1 addSubview:autoLogin];
    [view1 addSubview:self.pwdSwitch];
    [view1 addSubview:self.loginSwitch];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(80, 400, 100, 40)];
    [btn1 setTitle:@"Login" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor brownColor] forState:UIControlStateDisabled];
    self.loginBtn = btn1;
    self.loginBtn.enabled = NO;

    
    [self.view addSubview:accountNum];
    [self.view addSubview:accountPwd];
    [self.view addSubview:self.accountNumInput];
    [self.view addSubview:self.accountPwdInput];
    [self.view addSubview:self.loginBtn];
}

- (void)textDidChange{
    if(self.accountNumInput.text.length && self.accountPwdInput.text.length) {
        self.loginBtn.enabled = YES;
    } else {
        self.loginBtn.enabled = NO;
    }
}

- (void)switchDidChange{
    NSLog(@"%@", self.pwdSwitch.isOn ? @"YES" : @"NO");
    if(!self.pwdSwitch.isOn){
        [self.loginSwitch setOn:NO animated:YES];
    }
}


@end
