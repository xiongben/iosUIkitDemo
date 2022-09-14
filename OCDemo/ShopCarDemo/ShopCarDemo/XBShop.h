//
//  XBShop.h
//  ShopCarDemo
//
//  Created by admin on 2022/9/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBShop : NSObject

/// 商品的icon
@property (nonatomic, copy) NSString *icon;

/// 商品name
@property (nonatomic, copy) NSString *name;

- (instancetype) initWithIcon: (NSString *)icon name: (NSString *)name;
+ (instancetype) shopWithIcon: (NSString *)icon name: (NSString *)name;

- (instancetype) initWithDict: (NSDictionary *)dict;
+ (instancetype) shopWithDict: (NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
