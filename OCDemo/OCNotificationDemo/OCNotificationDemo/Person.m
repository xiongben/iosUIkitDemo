//
//  Person.m
//  OCNotificationDemo
//
//  Created by admin on 2022/9/25.
//

#import "Person.h"

@implementation Person

-(void)getNew:(NSNotification *)note{
    NSLog(@"[%@]接收到了[%@]发布的通知。内容是：[%@]",self.name, [note.object name], note.userInfo);
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
