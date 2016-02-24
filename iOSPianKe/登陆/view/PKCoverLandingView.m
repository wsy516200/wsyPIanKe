//
//  PKCoverLandingView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import "PKCoverLandingView.h"
#import "Masonry.h"
@implementation PKCoverLandingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.returnBtn];
        [self addSubview:self.registeredBtn];
        [self addSubview:self.pictureImage];
    }
    return self;
}
- (void)layoutSubviews{
    WS(weakSelf);
    [_returnBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(20);
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.size.equalTo(CGSizeMake(30, 30));
    }];
    [_registeredBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(20);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        make.size.equalTo(CGSizeMake(40, 30));
    }];
    [_pictureImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(130,70));
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
}
- (UIButton*)returnBtn{
    if (!_returnBtn) {
        _returnBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_returnBtn setImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];
    }
    return _returnBtn;
}
- (UIButton*)registeredBtn{
    if (!_registeredBtn) {
        _registeredBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_registeredBtn setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        [_registeredBtn setTitle:@"注册" forState:(UIControlStateNormal)];
        _registeredBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _registeredBtn;
}
- (UIImageView*)pictureImage{
    if (!_pictureImage) {
        _pictureImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"片刻LOGO"]];
        _pictureImage.backgroundColor = [UIColor whiteColor];
    }
    return _pictureImage;
}

@end
