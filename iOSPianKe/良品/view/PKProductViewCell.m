//
//  PKProductViewCell.m
//  iOSPianKe
//
//  Created by ma c on 16/1/22.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import "PKProductViewCell.h"
#import "Masonry.h"
#import "UIImageView+SDWedImage.h"
#import "PKProductDetailsViewController.h" // 良品详情界面
@implementation PKProductViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
         
        [self addSubview:self.tupianImage];
        [self addSubview:self.neirongLabel];
        [self addSubview:self.goumaiBtn];
        [self addSubview:self.lineLabel];
        [self addAotuLayt];
    }
    return self;
}


- (void)setCellList:(PKList *)cellList{
    
    _cellList = cellList;
    [_tupianImage downloadImage:cellList.coverimg];
    _neirongLabel.text = cellList.title;
    
}

- (void)addAotuLayt{
    WS(weakSelf);
    [_tupianImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
    }];
    [_neirongLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.tupianImage.mas_bottom).offset(10);
        make.left.equalTo(weakSelf.tupianImage.mas_left);
        make.right.equalTo(weakSelf.goumaiBtn.mas_left);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-10);
    }];
    [_goumaiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.neirongLabel.mas_centerY);
        make.right.equalTo(weakSelf.tupianImage.mas_right);
        make.size.equalTo(CGSizeMake(80, 25));
    }];
    
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.height.equalTo(0.5);
    }];
}

- (UIImageView*)tupianImage{
    if (!_tupianImage) {
        _tupianImage = [[UIImageView alloc] init];
        _tupianImage.backgroundColor = [UIColor redColor];
    }
   return  _tupianImage;
}
- (UILabel*)neirongLabel{
    if (!_neirongLabel) {
        _neirongLabel = [[UILabel alloc] init];
        _neirongLabel.font = [UIFont systemFontOfSize:13.0f];
    }
    return _neirongLabel;
}
- (UIButton*)goumaiBtn{
    if (!_goumaiBtn) {
        _goumaiBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_goumaiBtn setTitle:@"立即购买" forState:(UIControlStateNormal)];
        _goumaiBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14.0f];
        _goumaiBtn.backgroundColor = RGB(119, 182, 69);
        _goumaiBtn.layer.cornerRadius = 12.5;
        _goumaiBtn.layer.masksToBounds = YES;
    }
    return _goumaiBtn;
}
- (UILabel*)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineLabel;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
