//
//  ViewController.m
//  AutolayoutDemo
//
//  Created by admin on 2022/9/19.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.label.text = @"eeee sgsfd sfgffgd sdgs sdgs fdgf bgs";
}


@end
