//
//  XBShopView.h
//  ShopCarDemo
//
//  Created by admin on 2022/9/14.
//

#import <UIKit/UIKit.h>
@class XBShop;

NS_ASSUME_NONNULL_BEGIN

@interface XBShopView : UIView

@property(nonatomic, strong) XBShop *shop;

-(void)setIcon: (NSString *)icon;
-(void)setName: (NSString *)name;

-(instancetype)initWithShop:(XBShop *)shop;
+(instancetype)shopViewWithShop:(XBShop *)shop;
@end

NS_ASSUME_NONNULL_END
