//
//  XBNumber.m
//  OCLearnDemo
//
//  Created by admin on 2022/9/8.
//

#import "XBNumber.h"

@implementation XBNumber
- (instancetype)initWithIntVal: (int) value{
    if(self = [super init]) {
        self.intVal = value;
    }
    return self;
}
+ (instancetype)numberWithIntVal: (int) value{
    return [[self alloc] initWithIntVal:value];
}
@end
