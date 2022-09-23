//
//  XBNews.m
//  TableViewDemo
//
//  Created by admin on 2022/9/23.
//

#import "XBNews.h"

@implementation XBNews

+(instancetype)newsWithDict:(NSDictionary *)dict{
    XBNews *news = [[self alloc] init];
    news.title = dict[@"title"];
    news.desc = dict[@"desc"];
    news.vip = dict[@"vip"];
    news.price = dict[@"price"];
    news.userAvatar = dict[@"userAvatar"];
    news.detailPic = dict[@"detailPic"];
    return news;
}

@end
