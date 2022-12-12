//
//  XBAddContactVC.m
//  TelephoneApp
//
//  Created by admin on 2022/12/12.
//

#import "XBContactVC.h"
#import "XBAddContactVC.h"
@interface XBAddContactVC ()<UITextFieldDelegate>
@property(weak, nonatomic) UITextField *nameTextF;
@property(weak, nonatomic) UITextField *phoneTextF;
@property(weak, nonatomic) UIButton *submitBtn;
@end

@implementation XBAddContactVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.navigationItem.title = @"Add User";
    
    UILabel *accountNum = [[UILabel alloc] initWithFrame: CGRectMake(30, 90, 70, 40)];
    accountNum.text = @"用户:";
    
    UILabel *accountPwd = [[UILabel alloc] initWithFrame: CGRectMake(30, 150, 70, 40)];
    accountPwd.text = @"手机号:";
    
    UITextField *accountNumInput = [[UITextField alloc] initWithFrame:CGRectMake(100, 90, 220, 40)];
    accountNumInput.backgroundColor = [UIColor grayColor];
    accountNumInput.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.nameTextF = accountNumInput;
    
    UITextField *accountPwdInput = [[UITextField alloc] initWithFrame:CGRectMake(100, 150, 220, 40)];
    accountPwdInput.backgroundColor = [UIColor grayColor];
    accountPwdInput.clearButtonMode = UITextFieldViewModeWhileEditing;
    accountPwdInput.secureTextEntry = YES;
    self.phoneTextF = accountPwdInput;
    
    self.nameTextF.delegate = self;
    self.phoneTextF.delegate = self;
    
    [self.nameTextF addTarget:self action:@selector(textDidChange) forControlEvents:UIControlEventEditingChanged];
    [self.phoneTextF addTarget:self action:@selector(textDidChange) forControlEvents:UIControlEventEditingChanged];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(80, 210, 100, 40)];
    [btn1 setTitle:@"Submit" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor brownColor] forState:UIControlStateDisabled];
    self.submitBtn = btn1;
    self.submitBtn.enabled = NO;
    [self.submitBtn addTarget:self action:@selector(toContactListPage) forControlEvents:UIControlEventTouchUpInside];

    
    [self.view addSubview:accountNum];
    [self.view addSubview:accountPwd];
    [self.view addSubview:self.nameTextF];
    [self.view addSubview:self.phoneTextF];
    [self.view addSubview:self.submitBtn];
    
    [self textDidChange];
}

- (void)textDidChange{
    if(self.nameTextF.text.length && self.phoneTextF.text.length) {
        self.submitBtn.enabled = YES;
    } else {
        self.submitBtn.enabled = NO;
    }
}

- (void)toContactListPage{
    XBContactVC *xbContactVc = [[XBContactVC alloc] init];
    xbContactVc.accountName = @"坦克世界";
    [self.navigationController pushViewController: xbContactVc animated:YES];
}


@end
