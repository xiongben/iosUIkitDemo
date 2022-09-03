//
//  Person.m
//  OCLearnDemo
//
//  Created by admin on 2022/9/2.
//

#import "Person.h"

@implementation Person
-(void) run
{
    NSLog(@"this man is running!");
}
-(void)eatWith:(NSString *) food {
    NSLog(@"you like eat %@", food);
}
-(int)addWith: (int)num1 and: (int)num2 {
    return num1 + num2;
}
@end
