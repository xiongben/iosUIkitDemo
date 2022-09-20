//
//  ViewController.m
//  TableViewDemo
//
//  Created by admin on 2022/9/20.
//

#import "ViewController.h"
#import "XBCarGroup.h"
#import "XBCar.h"

@interface ViewController ()

@property(nonatomic, weak) UITableView *tableView1;

@property (nonatomic, strong) NSArray *carGroups;

@end

@implementation ViewController

- (NSArray *)carGroups{
    if(!_carGroups){
//        从plist文件加载数据
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Cars" ofType:@"plist"]];

        NSMutableArray *temp = [NSMutableArray array];
        for(NSDictionary *carGroupDict in dictArray) {
            XBCarGroup *group = [XBCarGroup carGroupWithDict: carGroupDict];
            [temp addObject:group];
        }
        _carGroups = temp;
        
//        XBCarGroup *group0 = [[XBCarGroup alloc] init];
//        group0.header = @"德系";
//        group0.footer = @"德系质量好ooo";
//        group0.cars = @[
//            [XBCar carWithName:@"Benz" icon:@"p01"],
//            [XBCar carWithName:@"BMW" icon:@"p02"],
//        ];
//        XBCarGroup *group1 = [[XBCarGroup alloc] init];
//        group1.header = @"日系";
//        group1.footer = @"日系价格便宜000";
//        group1.cars = @[
//            [XBCar carWithName:@"丰田" icon:@"p03"],
//            [XBCar carWithName:@"本田" icon:@"p04"],
//            [XBCar carWithName:@"马自达" icon:@"p05"],
//        ];
//        _carGroups = @[group0, group1];
    }
    return _carGroups;
}

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
    return self.carGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    XBCarGroup *group = self.carGroups[section];
    return group.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    XBCarGroup *group = self.carGroups[indexPath.section];
    XBCar *car = group.cars[indexPath.row];
    
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    XBCarGroup *group = self.carGroups[section];
    return group.header;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    XBCarGroup *group = self.carGroups[section];
    return group.footer;
}

@end
