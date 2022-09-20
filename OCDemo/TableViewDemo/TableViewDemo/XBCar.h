//
//  XBCar.h
//  TableViewDemo
//
//  Created by admin on 2022/9/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBCar : NSObject
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *icon;

+(instancetype)carWithName:(NSString *)name icon:(NSString *)icon;
+(instancetype)carWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
