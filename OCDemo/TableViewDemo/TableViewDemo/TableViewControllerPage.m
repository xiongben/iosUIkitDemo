//
//  TableViewControllerPage.m
//  TableViewDemo
//
//  Created by admin on 2022/9/21.
//

#import "TableViewControllerPage.h"

@interface TableViewControllerPage ()

@end

@implementation TableViewControllerPage

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label1 = [[UILabel alloc] init];
    NSString *desc = @"This method is a convenience constructor for creating button objects with specific configurations. If you subclass UIButton, this method does not return an instance of your subclass. If you want to create an instance of a specific subclass, you must alloc/init the button directly.";
    label1.text = desc;
    label1.font = [UIFont systemFontOfSize:14];
    label1.textColor = [UIColor redColor];
    label1.backgroundColor = [UIColor yellowColor];
    label1.numberOfLines = 0;
    CGFloat textW = 150;
    NSDictionary *textAtt = @{NSFontAttributeName: [UIFont systemFontOfSize:14]};
    CGSize textSize = CGSizeMake(textW, MAXFLOAT);
    CGFloat textH = [desc boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAtt context:nil].size.height;
    label1.frame = CGRectMake(10, 30, textW, textH);
    [self.view addSubview:label1];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


@end
