//
//  ViewController.m
//  OCLearnDemo
//
//  Created by admin on 2022/9/2.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    int a = 22;
//    int* point1 = &a;
//    NSLog(@"the val is %d", *point1);
//    NSLog(@"the val is %p", &point1);
//    NSLog(@"the val is %p", point1);
//    NSLog(@"the val is %p", &a);
//
//    NSLog(@"hello,world!");
//    Person *p1 = [Person new];
//    [p1 run];
//    [p1 eatWith:(@"chicken")];
//    int sumNumber = [p1 addWith:20 and:30];
//    NSLog(@"the add result is %d", sumNumber);
    
    NSString *str1 = @"i love eat delicious food!";
    NSRange range1 = [str1 rangeOfString:@"food"];
    NSLog(@"loc = %lu", range1.location);
    NSLog(@"len = %lu", range1.length);
    
    NSMutableString *str2 = [NSMutableString string];
    [str2 appendString:@"aaaaa"];
    [str2 setString:@"rrrr"];
    NSLog(@"%@", str2);
}


@end

