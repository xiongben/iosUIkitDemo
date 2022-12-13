//
//  XBContactItem.m
//  TelephoneApp
//
//  Created by admin on 2022/12/13.
//

#import "XBContactItem.h"

@implementation XBContactItem
+ (instancetype)itemWithName:(NSString *)name phone:(NSString *)phone{
    XBContactItem *item = [[XBContactItem alloc] init];
    item.name = name;
    item.phone = phone;
    return item;
}
@end
