//
//  ViewController.m
//  OCLearnDemo
//
//  Created by admin on 2022/9/2.
//

#import "ViewController.h"
#import "Person.h"
#import "XBNumber.h"

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
    
//    NSString *str1 = @"i love eat delicious food!";
//    NSRange range1 = [str1 rangeOfString:@"food"];
//    NSLog(@"loc = %lu", range1.location);
//    NSLog(@"len = %lu", range1.length);
//
//    NSMutableString *str2 = [NSMutableString string];
//    [str2 appendString:@"aaaaa"];
//    [str2 setString:@"rrrr"];
//    NSLog(@"%@", str2);
    
////    数组练习
//    NSArray *arr1 = @[@"aaa",@"bbbb",@"cccc"];
//    NSLog(@"%@", arr1);
//    NSLog(@"%@", arr1[2]);
//
//    BOOL res1 = [arr1 containsObject:@"aaaa"];
//    NSLog(@"%d", res1);
//
//    for(NSString *str in arr1) {
//        NSLog(@"%@", str);
//    }
//
//    NSString * str2 = @"tank,gun,allery,army";
//    NSArray * arr2 = [str2 componentsSeparatedByString:@","];
//    NSLog(@"%@", arr2);
//
//    NSMutableArray * arr3 = [NSMutableArray new];
//    [arr3 addObject:@"qqqq"];
//    [arr3 addObject:@"wwww"];
//    NSLog(@"%@", arr3);
//
//    XBNumber *xbnum1 = [XBNumber numberWithIntVal:12];
//    [arr3 addObject:xbnum1];
//    NSLog(@"%d", xbnum1.intVal);
    
//    NSDictionary *dic1 = @{@"name":@"niubi",@"age": @"18"};
//    for(id key in dic1) {
//        NSLog(@"%@ = %@", key, dic1[key]);
//    }
//
//    NSMutableDictionary *dic2 = [NSMutableDictionary new];
//    [dic2 setObject:@"sssss" forKey:@"key1"];
//    NSLog(@"%@", dic2);
//
    NSFileManager *manager = [NSFileManager defaultManager];
    
//    NSString *st5 = @"wowowowowowowo";
//    NSData *data = [st5 dataUsingEncoding:NSUTF8StringEncoding];
//    BOOL res = [manager createFileAtPath:@"/Users/admin/Desktop/haha.txt" contents:data attributes:nil];
//    if(res == YES) {
//        NSLog(@"success");
//    }else{
//        NSLog(@"fail");
//    }
    
//    NSArray *fileArr = [manager subpathsAtPath:@"/Users/admin/learnArea/DemoFromNet"];
//    for(NSString *str in fileArr) {
//        NSLog(@"%@", str);
//    }
    
    
}


@end

