//
//  ViewControllerNew.m
//  demo3
//
//  Created by Xiong Ben on 5/10/22.
//

#import "ViewControllerNew.h"

@interface ViewControllerNew ()

@end

@implementation ViewControllerNew

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    navigation demo
    UILabel *text1 = [[UILabel alloc] init];
    text1.text = @"hello world!";
    text1.frame = CGRectMake(100, 100, 100, 30);
    [self.view addSubview:text1];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
