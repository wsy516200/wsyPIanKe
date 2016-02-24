//
//  PKThirdLandingView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import "PKThirdLandingView.h"
#import "Masonry.h"
@implementation PKThirdLandingView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.sinaBtn];
        [self addSubview:self.everyoneBtn];
        [self addSubview:self.douBtn];
        [self addSubview:self.qqBtn];
        [self addSubview:self.lineLabel];
        [self addSubview:self.textLabel];
    }
    return self;
}

- (void)layoutSubviews{
    WS(weakSelf);
    CGFloat width = (VIEW_WIDTH - 100.0)/5.0;
    
      [_sinaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.equalTo(weakSelf.mas_left).offset(width);
          make.size.equalTo(CGSizeMake(25, 25));
          make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
    [_everyoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.sinaBtn.mas_right).offset(width);
        make.size.equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    [_douBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.everyoneBtn.mas_right).offset(width);
        make.size.equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    [_qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.douBtn.mas_right).offset(width);
        make.size.equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(130, 13));
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(weakSelf.mas_top);
    }];
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(0.5);
        make.left.equalTo(weakSelf.mas_left).offset(width);
        make.right.equalTo(weakSelf.mas_right).offset(-width);
        make.centerY.equalTo(weakSelf.textLabel.mas_centerY);
    }];
    
}

- (UIButton*)sinaBtn{
    if (!_sinaBtn) {
        _sinaBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_sinaBtn setImage:[UIImage imageNamed:@"新浪"] forState:(UIControlStateNormal)];
    }
    return _sinaBtn;
}
- (UIButton*)everyoneBtn{
    if (!_everyoneBtn) {
        _everyoneBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_everyoneBtn setImage:[UIImage imageNamed:@"人人"] forState:(UIControlStateNormal)];
    }
    return _everyoneBtn;
}
- (UIButton*)douBtn{
    if (!_douBtn) {
        _douBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_douBtn setImage:[UIImage imageNamed:@"豆瓣"] forState:(UIControlStateNormal)];
    }
    return _douBtn;
}
- (UIButton*)qqBtn{
    if (!_qqBtn) {
        _qqBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_qqBtn setImage:[UIImage imageNamed:@"QQ"] forState:(UIControlStateNormal)];
    }
    return _qqBtn;
}
- (UILabel*)textLabel{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.backgroundColor = [UIColor whiteColor];
        _textLabel.text = @"合作伙伴登陆片刻";
        _textLabel.font = [UIFont systemFontOfSize:15.0];
        _textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _textLabel;
}
- (UILabel*)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.textAlignment = NSTextAlignmentCenter;
        _lineLabel.backgroundColor = RGB(240, 240, 240);
    }
    return _lineLabel;
}


@end
