//
//  XBNews.h
//  TableViewDemo
//
//  Created by admin on 2022/9/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBNews : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *desc;
@property(nonatomic, copy) NSString *price;
@property(nonatomic, copy) NSString *number;
@property(nonatomic, copy) NSString *detailPic;
@property(nonatomic, copy) NSString *userAvatar;
@property(nonatomic, copy) NSString *vip;

+(instancetype)newsWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
