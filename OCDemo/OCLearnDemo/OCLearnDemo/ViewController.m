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
    NSLog(@"hello,world!");
    Person *p1 = [Person new];
    [p1 run];
    
}


@end

