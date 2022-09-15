//
//  XBShopView.m
//  ShopCarDemo
//
//  Created by admin on 2022/9/14.
//

#import "XBShopView.h"
#import "XBShop.h"

@interface XBShopView()

@property(nonatomic, weak) UIImageView *iconView;
@property(nonatomic, weak) UILabel *titleLabel;

@end

@implementation XBShopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)init{
    if(self == [super init]) {
        [self setUP];
    }
    return self;
}


/// 布局子控件，可以拿到frame
-(void)layoutSubviews{
    [super  layoutSubviews];
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.iconView.frame = CGRectMake(0, 0, width, width);
    self.titleLabel.frame = CGRectMake(0, width, width, height - width);
}

-(void)setIcon: (NSString *)icon {
    self.iconView.image = [UIImage imageNamed:icon];
}
-(void)setName: (NSString *)name {
    self.titleLabel.text = name;
}
-(void)setShop: (XBShop *)shop{
    _shop = shop;
    self.iconView.image = [UIImage imageNamed:shop.icon];
    self.titleLabel.text = shop.name;
}

/// 初始化
-(void)setUP{
    //    图片
        UIImageView *iconView = [[UIImageView alloc] init];
        iconView.backgroundColor = [UIColor blueColor];
        [self addSubview:iconView];
        self.iconView = iconView;
        
    //    标题
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
}

-(instancetype)initWithShop:(XBShop *)shop{
    if(self == [super init]){
        [self setUP];
        self.shop = shop;
    }
    return self;
}
+(instancetype)shopViewWithShop:(XBShop *)shop{
    return [[self alloc] initWithShop:shop];
}

@end
