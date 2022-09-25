//
//  ViewController.m
//  OCNotificationDemo
//
//  Created by admin on 2022/9/25.
//

#import "ViewController.h"
#import "Company.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@", XBTest);
//    NSLog(@"%@", XBTest1);
    
    Company *com1 = [[Company alloc] init];
    com1.name = @"Tencent";
    
    Company *com2 = [[Company alloc] init];
    com2.name = @"Sina";
    
    Person *p1 = [[Person alloc] init];
    p1.name = @"张看有";
    Person *p2 = [[Person alloc] init];
    p2.name = @"吴越";
    Person *p3 = [[Person alloc] init];
    p3.name = @"刘大友";
    
//    监听通知
    [[NSNotificationCenter defaultCenter] addObserver:p1 selector:@selector(getNew:) name:@"军事新闻" object:com1];
//    发布通知
    NSNotification *note = [NSNotification notificationWithName:@"军事新闻" object:com1 userInfo:@{@"title": @"这是一条新闻通知"}];
    
    [[NSNotificationCenter defaultCenter] postNotification:note];
    
}


@end
