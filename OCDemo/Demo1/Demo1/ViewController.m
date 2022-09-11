//
//  ViewController.m
//  Demo1
//
//  Created by admin on 2022/9/9.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak)IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UILabel *label = [[UILabel alloc] init];
//    label.frame = CGRectMake(0, 0, 100, 80);
//    label.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:label];
    
//    UIImageView *img1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"phoneBg.jpeg"]];
//
//    img1.backgroundColor = [UIColor yellowColor];
////    设置尺寸
////    img1.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//
//    img1.frame = self.view.bounds;
//
//    img1.contentMode = UIViewContentModeScaleAspectFill;
//
////    毛玻璃效果
//    UIToolbar *toolbar = [[UIToolbar alloc] init];
//    toolbar.frame = img1.bounds;
//    toolbar.alpha = 0.9;
//    toolbar.barStyle = UIBarStyleBlack;
//    [img1 addSubview:toolbar];
//
//
//    [self.view addSubview:img1];
    
//    路径加载图片
    UIImageView *img2 = [[UIImageView alloc] init];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"thumb" ofType:@"jpeg"];
    img2.image = [UIImage imageWithContentsOfFile:path];
    img2.frame = self.view.bounds;
    [self.view addSubview:img2];

     
    
}



@end
