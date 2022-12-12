//
//  XBContactVC.h
//  TelephoneApp
//
//  Created by admin on 2022/10/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XBContactVC : UITableViewController
@property (nonatomic, strong) NSString *accountName;
- (instancetype)initWithVal: (NSString*) value;

@end

NS_ASSUME_NONNULL_END
