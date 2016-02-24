//
//  PKProductDetailsScrollView.m
//  iOSPianKe
//
//  Created by ma c on 16/2/21.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import "PKProductDetailsScrollView.h"
#import "Masonry.h"
@interface PKProductDetailsScrollView()<UIScrollViewDelegate,UIWebViewDelegate>



@end

@implementation PKProductDetailsScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}
//@property (strong, nonatomic)                   UILabel *fromLabel;
//@property (strong, nonatomic)                   UILabel *whereFromLabel;
//@property (strong, nonatomic)                   UILabel *sectionLabel;
//@property (strong, nonatomic)                   UILabel *titleLabel;
//@property (strong, nonatomic)                   UIImageView *iconImage;
//@property (strong, nonatomic)                   UILabel *writeLabel;
//@property (strong, nonatomic)                   UILabel *timeLabel;

- (void)addAutoLayt{
    WS(weakSelf);
    [_fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.size.equalTo(CGSizeMake(40, 20));
    }];
//    [_whereFromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.
//    }];
}

- (UILabel*)fromLabel{
    if (!_fromLabel) {
        _fromLabel = [[UILabel alloc] init];
    }
    return _fromLabel;
}

- (UILabel*)whereFromLabel{
    if (!_whereFromLabel) {
        _whereFromLabel = [[UILabel alloc] init];
    }
    return _whereFromLabel;
}
- (UILabel*)sectionLabel{
    if (!_sectionLabel) {
        _sectionLabel = [[UILabel alloc] init];
    }
    return _sectionLabel;
}
- (UILabel*)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}
- (UIImageView*)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc] init];
    }
    return _iconImage;
}
- (UILabel*)writeLabel{
    if (!_writeLabel) {
        _writeLabel = [[UILabel alloc] init];
    }
    return _writeLabel;
}
- (UILabel*)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
    }
    return _timeLabel;
}
@end

