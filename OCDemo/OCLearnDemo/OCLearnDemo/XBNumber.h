//
//  XBNumber.h
//  OCLearnDemo
//
//  Created by admin on 2022/9/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBNumber : NSObject

@property(nonatomic, assign)int intVal;
- (instancetype)initWithIntVal: (int) value;
+ (instancetype)numberWithIntVal: (int) value;

@end

NS_ASSUME_NONNULL_END
