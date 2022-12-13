//
//  XBContactVC.h
//  TelephoneApp
//
//  Created by admin on 2022/10/30.
//

#import <UIKit/UIKit.h>
@class XBContactItem;

NS_ASSUME_NONNULL_BEGIN

@interface XBContactVC : UITableViewController
@property (nonatomic, strong) NSString *accountName;
@property (nonatomic, strong) NSString *accountName2;
@property (nonatomic, strong) XBContactItem *contactItem;
- (instancetype)initWithVal: (NSString*) value;
- (instancetype)initWithItemVal: (XBContactItem*) value;

@end

NS_ASSUME_NONNULL_END
