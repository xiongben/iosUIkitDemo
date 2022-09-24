//
//  XBNewsCell.m
//  TableViewDemo
//
//  Created by admin on 2022/9/23.
//

#import "XBNewsCell.h"
#import "XBNews.h"

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface XBNewsCell ()

@property(nonatomic, weak) UILabel *titleLabel;
@property(nonatomic, weak) UILabel *desc;
@property(nonatomic, weak) UIImageView *userAvatar;
@property(nonatomic, weak) UIImageView *vip;
@property(nonatomic, weak) UIImageView *detailPic;

@end

@implementation XBNewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        UILabel *title = [[UILabel alloc] init];
        title.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:title];
        self.titleLabel = title;
        
        UILabel *desc = [[UILabel alloc] init];
        [self.contentView addSubview:desc];
        self.desc = desc;
        
        UIImageView *userAvatarPic = [[UIImageView alloc] init];
        userAvatarPic.backgroundColor = [UIColor redColor];
        userAvatarPic.frame = CGRectMake(0, 0, 50, 50);
        [self.contentView addSubview:userAvatarPic];
        self.userAvatar = userAvatarPic;
        
        UIImageView *vip1 = [[UIImageView alloc] init];
        [self.contentView addSubview:vip1];
        self.vip = vip1;
        
        UIImageView *userDetailPic = [[UIImageView alloc] init];
        [self.contentView addSubview:userDetailPic];
        self.detailPic = userDetailPic;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat space = 10;
    
//    self.userAvatar.frame = CGRectMake(0, 0, 50, 50);
    
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.superview.top).offset(space);
        make.left.equalTo(self.superview.left).offset(space);
        make.size.equalTo(CGSizeMake(200, 30));
    }];
}

- (void)SetNewsData:(XBNews *)news{
    NSLog(@"%@", news);
    _newsData = news;
    self.titleLabel.text = news.title;
    self.desc.text = news.desc;
    self.detailPic.image = [UIImage imageNamed:news.detailPic];
    self.vip.image = [UIImage imageNamed:news.vip];
    self.userAvatar.image = [UIImage imageNamed:news.userAvatar];
    
}

@end
