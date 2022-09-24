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
    CGFloat space = 10;
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        UILabel *title = [[UILabel alloc] init];
        title.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:title];
        self.titleLabel = title;
        
//        [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.contentView.top).offset(space);
//            make.left.equalTo(self.contentView.left).offset(space);
//            make.size.equalTo(CGSizeMake(200, 50));
//        }];
        
        UILabel *desc = [[UILabel alloc] init];
        [self.contentView addSubview:desc];
        self.desc = desc;
        self.desc.numberOfLines = 0;
        [self.desc makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.top).offset(space);
            make.left.equalTo(self.contentView.left).offset(space);
            make.width.equalTo(self.contentView.width);
            make.bottom.equalTo(self.contentView.bottom).offset(-space);
        }];
        
        
        UIImageView *userAvatarPic = [[UIImageView alloc] init];
        userAvatarPic.backgroundColor = [UIColor redColor];
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
}

- (void)updateConstraints{
    [super updateConstraints];
}

- (void)SetData:(XBNews *)news{
//    NSLog(@"%@", news.desc);
    _newsData = news;
    self.titleLabel.text = news.title;
    self.desc.text = news.desc;
//    self.detailPic.image = [UIImage imageNamed:news.detailPic];
//    self.vip.image = [UIImage imageNamed:news.vip];
//    self.userAvatar.image = [UIImage imageNamed:news.userAvatar];
    
}

@end
