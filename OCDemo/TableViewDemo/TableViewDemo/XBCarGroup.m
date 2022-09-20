//
//  XBCarGroup.m
//  TableViewDemo
//
//  Created by admin on 2022/9/20.
//

#import "XBCarGroup.h"
#import "XBCar.h"

@implementation XBCarGroup

+(instancetype)carGroupWithDict:(NSDictionary *)dict{
    XBCarGroup *group = [[self alloc] init];
    group.header = dict[@"header"];
    group.footer = dict[@"footer"];
    NSMutableArray *temp = [NSMutableArray array];
    for(NSDictionary *carDict in dict[@"cars"]) {
        XBCar *car = [XBCar carWithDict:carDict];
        [temp addObject:car];
    }
    group.cars = temp;
    return group;
}

@end
