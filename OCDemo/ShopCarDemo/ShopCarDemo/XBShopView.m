//
//  XBShopView.m
//  ShopCarDemo
//
//  Created by admin on 2022/9/14.
//

#import "XBShopView.h"

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
    //    图片
        UIImageView *iconView = [[UIImageView alloc] init];
//        iconView.frame = CGRectMake(0, 0, width, width);
        iconView.backgroundColor = [UIColor blueColor];
        [self addSubview:iconView];
        self.iconView = iconView;
        
    //    标题
        UILabel *titleLabel = [[UILabel alloc] init];
//        titleLabel.frame = CGRectMake(0, width, width, height - width);
        titleLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
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

@end
