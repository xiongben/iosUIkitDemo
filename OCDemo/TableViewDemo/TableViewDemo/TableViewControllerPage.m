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
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 100, 28)];
    label1.text = @"this is new page";
    label1.textColor = [UIColor redColor];
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
