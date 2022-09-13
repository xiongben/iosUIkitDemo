//
//  ViewController.m
//  ShopCarDemo
//
//  Created by admin on 2022/9/13.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *shopCarView;
@property (nonatomic, assign) NSInteger index;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.index = 0;
    self.deleteBtn.enabled = NO;
}

/// 添加到购物车
- (IBAction)add:(UIButton *)button {
//    1,总列数
    NSInteger allCols = 3;
//    2，商品width,height
    CGFloat width = 80;
    CGFloat height = 100;
//    3，求出间距
    CGFloat hMargin = (self.shopCarView.frame.size.width - allCols * width) / (allCols - 1);
    CGFloat vMargin = (self.shopCarView.frame.size.height - 2 * height) / 1;
//    4,求出x,y值
    NSInteger index = self.shopCarView.subviews.count;
    CGFloat x = (hMargin + width) * (index % allCols);
    CGFloat y = (vMargin + height) * (index / allCols);
    
    
    UIView *shopView = [[UIView alloc] init];
    shopView.frame = CGRectMake(x, y, 80, 100);
    shopView.backgroundColor = [UIColor greenColor];
    [self.shopCarView addSubview:shopView];
    
    if(index == 5){
        button.enabled = NO;
    }
    self.deleteBtn.enabled = YES;
}

/// 从购物车删除
/// @param button <#button description#>
- (IBAction)delete:(UIButton *)button {
    UIView *lastShopView = [self.shopCarView.subviews lastObject];
    [lastShopView removeFromSuperview];
    
    self.addBtn.enabled = YES;
    NSInteger index = self.shopCarView.subviews.count;
    
    if(index == 0) {
        self.deleteBtn.enabled = NO;
    }
}

@end
