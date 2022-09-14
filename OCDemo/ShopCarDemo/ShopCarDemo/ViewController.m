//
//  ViewController.m
//  ShopCarDemo
//
//  Created by admin on 2022/9/13.
//

#import "ViewController.h"
#import "XBShop.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *shopCarView;
@property (nonatomic, assign) NSInteger index;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;

@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation ViewController

- (NSArray *)dataArr{
    if(_dataArr == nil) {
        self.dataArr = @[
            @{@"name": @"卡卡西", @"icon": @"p01"},
            @{@"name": @"佐助", @"icon": @"p02"},
            @{@"name": @"鸣人", @"icon": @"p03"},
            @{@"name": @"凯", @"icon": @"p04"},
            @{@"name": @"小李", @"icon": @"p05"},
            @{@"name": @"天天", @"icon": @"p06"},
        ];
        NSMutableArray *tempArr = [NSMutableArray array];
        for(NSDictionary *dict in self.dataArr) {
            XBShop *xbshop = [[XBShop alloc] initWithDict:dict];
            [tempArr addObject:xbshop];
        }
        self.dataArr = tempArr;
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.index = 0;
    self.deleteBtn.enabled = NO;
    
//    NSLog(@"%@", _dataArr);
    
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
    
//    图片
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.frame = CGRectMake(0, 0, width, width);
    iconView.backgroundColor = [UIColor blueColor];
    [shopView addSubview:iconView];
    
//    标题
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(0, width, width, height - width);
    titleLabel.backgroundColor = [UIColor yellowColor];
    [shopView addSubview:titleLabel];
    
    
//    设置数据
    XBShop *xbshop = self.dataArr[index];
    iconView.image = [UIImage imageNamed:xbshop.icon];
    titleLabel.text = xbshop.name;
    
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
