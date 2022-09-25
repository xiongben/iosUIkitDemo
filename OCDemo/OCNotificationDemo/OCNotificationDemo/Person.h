//
//  Person.h
//  OCNotificationDemo
//
//  Created by admin on 2022/9/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property(nonatomic, copy)NSString *name;
-(void)getNew:(NSNotification *)note;

@end

NS_ASSUME_NONNULL_END
