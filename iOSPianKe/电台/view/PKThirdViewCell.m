//
//  PKThirdViewCell.m
//  iOSPianKe
//
//  Created by ma c on 16/1/27.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import "PKThirdViewCell.h"
#import "Masonry.h"
#import "UIImageView+SDWedImage.h"
@interface PKThirdViewCell()

@end

@implementation PKThirdViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.lineLabel];
        [self addSubview:self.ImagePicture];
        [self addSubview:self.labelName];
        [self addSubview:self.labelAuthor];
        [self addSubview:self.labelHuiSe];
        
        [self addAutoLayt];
    }
    return self;
}

- (void)setThirdCellList:(PKAlllista *)ThirdCellList {
    _ThirdCellList = ThirdCellList;
    [_ImagePicture downloadImage:ThirdCellList.coverimg];
    _labelName.text = ThirdCellList.title;
    _labelAuthor.text = [NSString stringWithFormat:@"by:%@",ThirdCellList.userinfo.uname];
    _labelHuiSe.text = ThirdCellList.desc;
    
}

- (void)addAutoLayt{
    WS(weakSelf);
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.height.equalTo(0.5);
    }];
    [_ImagePicture mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(5);
        make.left.equalTo(weakSelf.mas_left).offset(5);
        make.size.equalTo(CGSizeMake(70, 70));
        
    }];
    [_labelName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.ImagePicture.mas_right).offset(5);
        make.top.equalTo(weakSelf.ImagePicture.mas_top).offset(5);
        make.size.equalTo(CGSizeMake(120, 20));
    }];
    [_labelAuthor mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.labelName.mas_bottom);
        make.left.equalTo(weakSelf.ImagePicture.mas_right).offset(5);
        make.size.equalTo(CGSizeMake(120, 20));
    }];
    [_labelHuiSe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.labelAuthor.mas_bottom);
        make.left.equalTo(weakSelf.ImagePicture.mas_right).offset(5);
        make.size.equalTo(CGSizeMake(120, 20));
    }];
    
}


- (UILabel*)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineLabel;
}
- (UIImageView*)ImagePicture{
    if (!_ImagePicture) {
        _ImagePicture = [[UIImageView alloc] init];
        _ImagePicture.backgroundColor = [UIColor orangeColor];
    }
    return _ImagePicture;
}
- (UILabel*)labelName{
    if (!_labelName) {
        _labelName = [[UILabel alloc] init];
        _labelName.font = [UIFont boldSystemFontOfSize:16.0f];
    }
    return _labelName;
}
- (UILabel*)labelAuthor{
    if (!_labelAuthor) {
        _labelAuthor = [[UILabel alloc]init];
        _labelAuthor.font = [UIFont systemFontOfSize:12.0f];
        _labelAuthor.textColor = RGB(1, 100, 154);
    }
    return _labelAuthor;
}
- (UILabel*)labelHuiSe{
    if (!_labelHuiSe) {
        _labelHuiSe = [[UILabel alloc] init];
        _labelHuiSe.textColor = [UIColor lightGrayColor];
        _labelHuiSe.font = [UIFont systemFontOfSize:10.0f];
    }
    return _labelHuiSe;
}
@end
