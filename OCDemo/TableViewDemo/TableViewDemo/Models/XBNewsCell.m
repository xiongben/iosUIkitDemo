//
//  XBNewsCell.m
//  TableViewDemo
//
//  Created by admin on 2022/9/23.
//

#import "XBNewsCell.h"

@interface XBNewsCell ()

@property(nonatomic, weak) UILabel *titleLabel;

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
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
}

@end
