
# Learn note
### 1,获取app包位置的方法：
    设置断点，然后在控制台输入po NSHomeDirectory()

### 2, UILabel自适应高度
```
UILabel *label1 = [[UILabel alloc] init];
    NSString *desc = @"This method is a convenience constructor for creating button objects with specific configurations. If you subclass UIButton, this method does not return an instance of your subclass. If you want to create an instance of a specific subclass, you must alloc/init the button directly.";
    label1.text = desc;
    label1.font = [UIFont systemFontOfSize:14];
    label1.textColor = [UIColor redColor];
    label1.backgroundColor = [UIColor yellowColor];
    label1.numberOfLines = 0;
    CGFloat textW = 150;
    NSDictionary *textAtt = @{NSFontAttributeName: [UIFont systemFontOfSize:14]};
    CGSize textSize = CGSizeMake(textW, MAXFLOAT);
    CGFloat textH = [desc boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAtt context:nil].size.height;
    label1.frame = CGRectMake(10, 30, textW, textH);
    [self.view addSubview:label1];
```
