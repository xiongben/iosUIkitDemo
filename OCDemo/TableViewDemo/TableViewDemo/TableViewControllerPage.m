//
//  TableViewControllerPage.m
//  TableViewDemo
//
//  Created by admin on 2022/9/21.
//

#import "TableViewControllerPage.h"
#import "Models/XBNews.h"
#import "Models/XBNewsCell.h"

@interface TableViewControllerPage ()

@property(nonatomic, strong) NSArray *newsArr;
@property(nonatomic, weak) UITableView *newsTable1;

@end

@implementation TableViewControllerPage

NSString *CellID = @"newsCell";
- (NSArray *)newsArr{
    if(!_newsArr){
        NSArray *fileArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"News" ofType:@"plist"]];
        NSMutableArray *temp = [NSMutableArray array];
        for(NSDictionary *newsdict in fileArr){
            XBNews *xbNews = [XBNews newsWithDict:newsdict];
            [temp addObject:xbNews];
        }
        _newsArr = temp;
    }
    return _newsArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[XBNewsCell class] forCellReuseIdentifier:CellID];
//    self.tableView.rowHeight = 80;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XBNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
//    NSLog(@"%@", cell);
//    UITableViewCell *cell = [[UITableViewCell alloc] init];
    XBNews *cellData = self.newsArr[indexPath.row];
//    cell.textLabel.text = cellData.desc;
//    cell.textLabel.numberOfLines = 0;
    [cell SetData:cellData];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}


@end
