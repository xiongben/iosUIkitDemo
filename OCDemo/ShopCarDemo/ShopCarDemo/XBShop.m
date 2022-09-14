//
//  XBShop.m
//  ShopCarDemo
//
//  Created by admin on 2022/9/14.
//

#import "XBShop.h"

@implementation XBShop

- (instancetype) initWithIcon: (NSString *)icon name: (NSString *)name {
    if (self = [super init]) {
        self.icon = icon;
        self.name = name;
    }
    return  self;
}

+ (instancetype) shopWithIcon: (NSString *)icon name: (NSString *)name {
    return [[self alloc] initWithIcon:icon name:name];
}

- (instancetype) initWithDict: (NSDictionary *)dict {
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
    }
    return self;
}

+ (instancetype) shopWithDict: (NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
