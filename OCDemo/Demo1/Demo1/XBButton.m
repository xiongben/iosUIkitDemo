//
//  XBButton.m
//  Demo1
//
//  Created by admin on 2022/9/16.
//

#import "XBButton.h"

@implementation XBButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(0, 0, 100, 70);
    self.imageView.frame = CGRectMake(100, 0, 70, 70);
}

////重写方法
//- (CGRect)titleRectForContentRect:(CGRect)contentRect {
//    return CGRectMake(0, 0, 100, 70);
//}
//
//- (CGRect)imageRectForContentRect:(CGRect)contentRect {
//    return CGRectMake(100, 0, 70, 70);
//}

@end
