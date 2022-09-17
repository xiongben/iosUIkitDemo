//
//  ViewController.m
//  Demo1
//
//  Created by admin on 2022/9/9.
//

#import "ViewController.h"
#import "XBButton.h"

@interface ViewController ()

@property (nonatomic, weak)IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIscrollView练习
    UIScrollView *scrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, 150, 150)];
    scrollView1.backgroundColor = [UIColor yellowColor];
    
    UIImageView *img1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"04.jpeg"]];
    [scrollView1 addSubview:img1];
    
    scrollView1.contentSize = img1.frame.size;
    
    scrollView1.bounces = NO;
    
    scrollView1.contentOffset = CGPointMake(50, 50);
    
    scrollView1.delegate = self;
    
    [self.view addSubview:scrollView1];
    
   
////    按钮布局
//    XBButton *btn5 = [XBButton buttonWithType:UIButtonTypeCustom];
//    btn5.frame = CGRectMake(100, 100, 170, 70);
//    btn5.backgroundColor = [UIColor purpleColor];
//    [btn5 setTitle:@"普通按钮" forState:UIControlStateNormal];
//    [btn5 setImage:[UIImage imageNamed:@"p01"] forState:UIControlStateNormal];
//    [self.view addSubview:btn5];
    
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
    
////    路径加载图片
//    UIImageView *img2 = [[UIImageView alloc] init];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"thumb" ofType:@"jpeg"];
//    img2.image = [UIImage imageWithContentsOfFile:path];
//    img2.frame = self.view.bounds;
//    [self.view addSubview:img2];
    
////    按钮
//    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn1.backgroundColor = [UIColor redColor];
//    btn1.frame = CGRectMake(100, 100, 170, 60);
//
//    [btn1 setTitle:@"普通按钮" forState:UIControlStateNormal];
//    [btn1 setTitle:@"高亮按钮" forState:UIControlStateHighlighted];
//
//    [btn1 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
//    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
//
////    UIImage *img3 = [UIImage imageNamed:@"01.jpeg"];
//
////    [btn1 setBackgroundImage:img3 forState:UIControlStateNormal];
//
//    [btn1 addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
//
//    [btn1 setImage:[UIImage imageNamed:@"01.jpeg"] forState:UIControlStateNormal];
//    [btn1 setImage:[UIImage imageNamed:@"01.jpeg"] forState:UIControlStateHighlighted];
//
//    btn1.imageView.contentMode = UIViewContentModeScaleAspectFit;
//
//
//    [self.view addSubview:btn1];
    
    
//    plist use
//    NSArray *names = @[@"wwww",@"rrrrr",@"ttttt",@"oooooo"];
//    NSString *path =NSHomeDirectory();
//    NSLog(@"%@", path);
//    path = [path stringByAppendingString:@"/test.plist"];
//    BOOL flag = [names writeToFile:path atomically:YES];
//    if(flag) {
//        NSLog(@"写入成功");
//    }else{
//        NSLog(@"写入失败");
//    }
//
//    NSDictionary *person = @{
//        @"name": @"xiaoliu",
//        @"age":@"18"
//    };
//    BOOL flag2 = [person writeToFile:path atomically:YES];
//    if(flag) {
//        NSLog(@"写入成功");
//    }else{
//        NSLog(@"写入失败");
//    }
    
//    NSDictionary *res = [NSDictionary dictionaryWithContentsOfFile:path];
//    NSLog(@"%@", res);
    
    
    
    
}

//滚动时调用的方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScroll---------");
}


-(void)clickBtn: (UIButton *) button {
    button.enabled = NO;
    NSLog(@"按钮点击了");
}


@end
