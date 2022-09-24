//
//  XBNewsXibCell.m
//  TableViewDemo
//
//  Created by admin on 2022/9/24.
//

#import "XBNewsXibCell.h"

@interface XBNewsXibCell ()

@property (weak, nonatomic) IBOutlet UIImageView *detailPic;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end

@implementation XBNewsXibCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setNewsData:(XBNews *)newsData{
    self.detailPic.image = [UIImage imageNamed:newsData.detailPic];
    self.title.text = newsData.title;
}


@end
