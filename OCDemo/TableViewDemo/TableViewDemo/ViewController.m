//
//  ViewController.m
//  TableViewDemo
//
//  Created by admin on 2022/9/20.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, weak) UITableView *tableView1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style: UITableViewStyleGrouped];
    self.tableView1 = tableView;
    self.tableView1.delegate = self;
    self.tableView1.dataSource = self;
    [self.view addSubview: self.tableView1];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0) {
        return 2;
    } else {
        return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0){
        if(indexPath.row == 0) {
            cell.textLabel.text = @"奔驰";
            cell.imageView.image = [UIImage imageNamed: @"p01"];
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"宝马";
            cell.imageView.image = [UIImage imageNamed: @"p02"];
        }
    } else if (indexPath.section == 1){
        if(indexPath.row == 0) {
            cell.textLabel.text = @"丰田";
            cell.imageView.image = [UIImage imageNamed: @"p03"];
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"本田";
            cell.imageView.image = [UIImage imageNamed: @"p04"];
        }else if (indexPath.row == 2) {
            cell.textLabel.text = @"马自达";
            cell.imageView.image = [UIImage imageNamed: @"p05"];
        }
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return @"德系";
    } else {
        return @"日系";
    }
}


@end
