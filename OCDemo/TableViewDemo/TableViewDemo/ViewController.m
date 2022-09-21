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
//    常见属性设置
    self.tableView1.rowHeight = 80;
    self.tableView1.sectionHeaderHeight = 80;
    self.tableView1.separatorColor = [UIColor clearColor];
    self.tableView1.tableHeaderView = [[UISwitch alloc] init];
    self.tableView1.tableFooterView = [[UISwitch alloc] init];
    
    
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
    
//    优化
    NSString *ID = @"Car";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.accessoryView = [[UISwitch alloc] init];
        UIView *bg = [[UIView alloc] init];
        bg.backgroundColor = [UIColor yellowColor];
        cell.selectedBackgroundView = bg;
    }
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    常见属性设置
   
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"choose:%ld",indexPath.row);
}

@end
