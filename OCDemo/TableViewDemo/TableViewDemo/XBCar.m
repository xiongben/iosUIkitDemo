//
//  XBCar.m
//  TableViewDemo
//
//  Created by admin on 2022/9/20.
//

#import "XBCar.h"

@implementation XBCar

+(instancetype)carWithName:(NSString *)name icon:(NSString *)icon{
    XBCar *car = [[self alloc] init];
    car.name = name;
    car.icon = icon;
    return car;
}

@end
