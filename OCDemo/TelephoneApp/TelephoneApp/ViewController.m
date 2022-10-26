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
    
    UITextField *accountNumInput = [[UITextField alloc] initWithFrame:CGRectMake(80, 90, 120, 40)];
    accountNumInput.backgroundColor = [UIColor grayColor];
    
    UITextField *accountPwdInput = [[UITextField alloc] initWithFrame:CGRectMake(80, 150, 120, 40)];
    accountPwdInput.backgroundColor = [UIColor grayColor];
    
    
    [self.view addSubview:accountNum];
    [self.view addSubview:accountPwd];
    [self.view addSubview:accountNumInput];
    [self.view addSubview:accountPwdInput];
}


@end
