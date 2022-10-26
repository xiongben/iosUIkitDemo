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
    
    UILabel *accountPwd = [[UILabel alloc] initWithFrame: CGRectMake(30, 130, 50, 40)];
    accountPwd.text = @"密码:";
    
    
    [self.view addSubview:accountNum];
    [self.view addSubview:accountPwd];
}


@end
