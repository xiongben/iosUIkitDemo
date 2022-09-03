//
//  Person.h
//  OCLearnDemo
//
//  Created by admin on 2022/9/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
    NSString *_name;
    int _age;
}
-(void)run;
-(void)eatWith:(NSString *) food;
-(int)addWith: (int)num1 and: (int)num2;
@end

NS_ASSUME_NONNULL_END
