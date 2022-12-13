//
//  XBContactItem.h
//  TelephoneApp
//
//  Created by admin on 2022/12/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBContactItem : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phone;

+(instancetype)itemWithName:(NSString *)name phone:(NSString *)phone;

@end

NS_ASSUME_NONNULL_END
