//
//  ViewController.m
//  AutolayoutDemo
//
//  Created by admin on 2022/9/19.
//

#import "ViewController.h"
#define MAS_SHORTHAND
#import "Masonry/Masonry.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
//    添加约束
    [redView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).multipliedBy(1.0).offset(10);
        make.left.equalTo(self.view.left).offset(30);
        make.right.equalTo(self.view.right).offset(-30);
        make.bottom.equalTo(self.view.bottom).offset(-20);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(100);
//        make.height.mas_equalTo(100);
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY);
    }];
}



@end
