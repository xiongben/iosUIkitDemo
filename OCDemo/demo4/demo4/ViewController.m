//
//  ViewController.m
//  demo4
//
//  Created by admin on 2022/10/8.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property(nonatomic, weak) UIPickerView *pick1;
@property(nonatomic, strong) NSArray *arr1;

@end

@implementation ViewController

-(NSArray *)arr1{
    if(_arr1 == nil){
        _arr1 = @[@[@"aa",@"bb",@"cc",@"dd",@"ee",@"ff"],@[@"01",@"02",@"03",@"04",@"05"]];
    }
    return _arr1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIPickerView *pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(30, 80, 280, 100)];
    self.pick1 = pickView;
    self.pick1.dataSource = self;
    self.pick1.delegate = self;
    
    [self.view addSubview: self.pick1];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.arr1.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSArray *temp = self.arr1[component];
    return temp.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSArray *temp = self.arr1[component];
    return temp[row];
}

//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
//
//}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"component=%ld--row--%ld",component, row);
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 36;
}

@end
