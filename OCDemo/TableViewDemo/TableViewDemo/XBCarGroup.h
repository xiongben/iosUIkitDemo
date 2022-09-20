//
//  XBCarGroup.h
//  TableViewDemo
//
//  Created by admin on 2022/9/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBCarGroup : NSObject

@property(nonatomic, copy) NSString *header;
@property(nonatomic, copy) NSString *footer;
@property(nonatomic, strong) NSArray *cars;

+(instancetype)carGroupWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
