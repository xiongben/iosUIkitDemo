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
        
        UIImageView *userAvatarPic = [[UIImageView alloc] init];
        userAvatarPic.image = [UIImage imageNamed:@"avatar"];
        [self.contentView addSubview:userAvatarPic];
        self.userAvatar = userAvatarPic;
        [self.userAvatar makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.top).offset(space);
            make.left.equalTo(self.contentView.left).offset(space);
            make.height.equalTo(30);
            make.width.equalTo(30);
        }];
        
        UILabel *title = [[UILabel alloc] init];
        [self.contentView addSubview:title];
        self.titleLabel = title;
        [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.top).offset(space);
            make.left.equalTo(self.userAvatar.right).offset(space);
            make.height.equalTo(30);
            make.width.lessThanOrEqualTo(250);
        }];
        
        UIImageView *vip1 = [[UIImageView alloc] init];
        vip1.image = [UIImage imageNamed:@"vip.png"];
        [self.contentView addSubview:vip1];
        self.vip = vip1;
        [self.vip makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.top).offset(space);
            make.left.equalTo(self.titleLabel.right).offset(5);
            make.width.equalTo(30);
            make.height.equalTo(30);
    
        }];
        
        UILabel *desc = [[UILabel alloc] init];
        [self.contentView addSubview:desc];
        self.desc = desc;
        self.desc.numberOfLines = 0;
        [self.desc makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.userAvatar.bottom).offset(space);
            make.left.equalTo(self.contentView.left).offset(space);
            make.right.equalTo(self.contentView.right).offset(-space);
        }];
        
        UIImageView *userDetailPic = [[UIImageView alloc] init];
        [self.contentView addSubview:userDetailPic];
        self.detailPic = userDetailPic;
        [self.detailPic makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.desc.bottom).offset(space);
            make.left.equalTo(self.contentView.left).offset(space);
            make.width.equalTo(180);
            make.height.equalTo(180);
            make.bottom.equalTo(self.contentView.bottom).offset(-space);
        }];
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
    self.detailPic.image = [UIImage imageNamed:news.detailPic];
//    self.vip.image = [UIImage imageNamed:news.vip];
//    self.userAvatar.image = [UIImage imageNamed:news.userAvatar];
    
}

@end
