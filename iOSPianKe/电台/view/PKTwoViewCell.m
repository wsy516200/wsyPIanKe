//
//  PKTwoViewCell.m
//  iOSPianKe
//
//  Created by ma c on 16/1/26.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import "PKTwoViewCell.h"
#import "Masonry.h"
#import "UIImageView+SDWedImage.h"
@implementation PKTwoViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
        [self addSubview:self.squrImage1];
        [self addSubview:self.squrImage2];
        [self addSubview:self.squrImage3];
        [self addAutoLayt];
    }
    return self;
}

- (void)setTwoCellArray:(NSArray *)TwoCellArray{
    
    PKAlllista* model1 = TwoCellArray[0];
    PKAlllista* model2 = TwoCellArray[1];
    PKAlllista* model3 = TwoCellArray[2];
    
    [self.squrImage1 downloadImage:model1.coverimg];
    [self.squrImage2 downloadImage:model2.coverimg];
    [self.squrImage3 downloadImage:model3.coverimg];
    
}

- (void)addAutoLayt{
    WS(weakSelf);
    [_squrImage1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(120);
        make.width.equalTo(weakSelf.squrImage2.mas_width);
        make.left.equalTo(weakSelf.mas_left).offset(5);
        make.top.equalTo(weakSelf.mas_top).offset(5);
    }];
    [_squrImage2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(120);
        make.width.equalTo(weakSelf.squrImage1.mas_width);
        make.left.equalTo(weakSelf.squrImage1.mas_right).offset(5);
        make.top.equalTo(weakSelf.mas_top).offset(5);
        
    }];
    [_squrImage3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(120);
        make.left.equalTo(weakSelf.squrImage2.mas_right).offset(5);
        make.right.equalTo(weakSelf.mas_right).offset(-5);
        make.top.equalTo(weakSelf.mas_top).offset(5);
        make.width.equalTo(weakSelf.squrImage2.mas_width);
    }];
}

- (UIImageView*)squrImage1{
    if (!_squrImage1) {
        _squrImage1 = [[UIImageView alloc] init];
        _squrImage1.backgroundColor = [UIColor orangeColor];
    }
    return _squrImage1;
}
- (UIImageView*)squrImage2{
    if (!_squrImage2) {
        _squrImage2 = [[UIImageView alloc] init];
        _squrImage2.backgroundColor = [UIColor orangeColor];
    }
    return _squrImage2;
}
- (UIImageView*)squrImage3{
    if (!_squrImage3) {
        _squrImage3 = [[UIImageView alloc] init];
        _squrImage3.backgroundColor = [UIColor orangeColor];
    }
    return _squrImage3;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
