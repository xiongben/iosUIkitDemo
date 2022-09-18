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
@property (nonatomic, weak) UIScrollView *scrollView1;
@property (nonatomic, weak) UIPageControl *pageControl1;
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIscrollView练习
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(30, 60, 150, 150)];
    self.scrollView1 = scrollView;
    self.scrollView1.backgroundColor = [UIColor yellowColor];
    
    for(int i = 0; i < 5; i++){
        NSString *imageName = [NSString stringWithFormat:@"p0%d", i+1];
        NSLog(@"%@", imageName);
        UIImageView *img1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed: imageName]];
        img1.frame = CGRectMake(i * self.scrollView1.frame.size.width, 0, self.scrollView1.frame.size.width, self.scrollView1.frame.size.width);
        [self.scrollView1 addSubview:img1];
    }
    
    self.scrollView1.contentSize = CGSizeMake(150 * 5, 150);
    self.scrollView1.pagingEnabled = YES;
    self.scrollView1.delegate = self;
    self.scrollView1.showsHorizontalScrollIndicator = NO;
    
    
    
    [self.view addSubview: self.scrollView1];
    
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(30, 185, 200, 30)];
    self.pageControl1 = pageControl;
    self.pageControl1.numberOfPages = 5;
    self.pageControl1.currentPage = 0;
    self.pageControl1.pageIndicatorTintColor = [UIColor greenColor];
    self.pageControl1.currentPageIndicatorTintColor = [UIColor blueColor];
//    pageControl1.backgroundColor = [UIColor brownColor];
    [self.view addSubview: self.pageControl1];
    
    [self startTimer];
    
    
//    UITextField *field1 = [[UITextField alloc] initWithFrame:CGRectMake(0, 550, 150, 60)];
//    field1.backgroundColor = [UIColor yellowColor];
//
//    [field1 addTarget:self action:@selector(tfEditingChange:) forControlEvents:UIControlEventEditingChanged];
//
//    [self.view addSubview:field1];
    
   
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

//定时器方法
-(void)startTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(toNextPage) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)endTimer{
    [self.timer invalidate];
    self.timer = nil;
}

//滚动时调用的方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page = scrollView.contentOffset.x / scrollView.frame.size.width + 0.5;
    self.pageControl1.currentPage = page;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self startTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.pageControl1.currentPage = page;
}

//用户开始拖拽时停止定时器，停止拖拽后开启定时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self endTimer];
}


- (void) toNextPage{
    NSInteger page = self.pageControl1.currentPage + 1;
    if( page == 5) {
        page = 0;
    }
    [self.scrollView1 setContentOffset:CGPointMake(page * self.scrollView1.frame.size.width, 0) animated:YES];
    
}

-(void)tfEditingChange:(UITextField *)field{
    NSLog(@"%@", field.text);
}


-(void)clickBtn: (UIButton *) button {
    button.enabled = NO;
    NSLog(@"按钮点击了");
}


@end
