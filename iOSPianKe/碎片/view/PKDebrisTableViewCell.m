//
//  PKDebrisTableViewCell.m
//  iOSPianKe
//
//  Created by ma c on 16/1/20.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import "PKDebrisTableViewCell.h"
#import "Masonry.h"
#import "UIImageView+SDWedImage.h"
@interface PKDebrisTableViewCell()

@property (strong, nonatomic)           UIImageView *iconImage;//头像
@property (strong, nonatomic)           UILabel *userName;//用户名
@property (strong, nonatomic)           UILabel *timeLabel;//时间
@property (strong, nonatomic)           UILabel *contentLabel;//内容
@property (strong, nonatomic)           UIImageView *contentImage;//大图片
@property (strong, nonatomic)           UIButton *writeBtn;//评论
@property (strong, nonatomic)           UILabel *writeLabel;//评论数量
@property (strong, nonatomic)           UIButton *likeBtn;//喜欢
@property (strong, nonatomic)           UILabel *likeLabel;//喜欢数辆
@property (strong, nonatomic)           UILabel *lineLabel;//线
@end

@implementation PKDebrisTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.iconImage];
        [self.contentView addSubview:self.userName];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.contentImage];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.writeBtn];
        [self.contentView addSubview:self.writeLabel];
        [self.contentView addSubview:self.likeBtn];
        [self.contentView addSubview:self.likeLabel];
        [self.contentView addSubview:self.lineLabel];
        self.autoresizingMask = UIViewAutoresizingNone;
        [self addAutoLayout];
    }
    return self;
}

//通过set方法在counterList刚被赋值时，对其他控件进行赋值
- (void)setCounterList:(PKFragmentList *)counterList{
    _counterList = counterList;
    [_iconImage downloadImage:counterList.userinfo.icon];
    _userName.text = counterList.userinfo.uname;
    _timeLabel.text = counterList.addtimeF;
    _likeLabel.text = [NSString stringWithFormat:@"%li",(long)counterList.counterList.like];
    _writeLabel.text = [NSString stringWithFormat:@"%li",(long)counterList.counterList.comment];
    //加载网络图片方法（UIImageView+SDWedImage中）
    [_contentImage downloadImage:_counterList.coverimg];
//    NSLog(@"%@",_contentImage);
    //label调用属性字符串
    _contentLabel.attributedText = [self makeText:counterList.content];
    
    CGFloat imageHeight = [_heightDic[@"imageHeight"] floatValue];
    CGFloat textHeight = [_heightDic[@"textHeight"] floatValue];
    NSLog(@"----------%lf---------%lf",imageHeight,textHeight);
    if (imageHeight == 0) {
        
        _contentLabel.frame = CGRectMake(20, 70, VIEW_WIDTH-40, textHeight+10);
        _contentImage.frame = CGRectMake(20, 70, VIEW_WIDTH-40, 0);
        
    }else{
        _contentImage.frame = CGRectMake(20, 70, VIEW_WIDTH-40, imageHeight);
        _contentLabel.frame = CGRectMake(20, imageHeight+80, VIEW_WIDTH-40, textHeight+10);
        
    }
}


- (void)addAutoLayout{
    WS(weakSelf);
    
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(30, 30));
        make.left.equalTo(weakSelf.contentView.mas_left).offset(20);
        make.top.equalTo(weakSelf.contentView.mas_top).offset(20);
    }];
    
    [_userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(14.0);
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(5);
        make.centerY.equalTo(weakSelf.iconImage.mas_centerY);
        make.right.equalTo(weakSelf.contentView.mas_right).offset(-70);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(50, 14));
        make.right.equalTo(weakSelf.contentView.mas_right).offset(-20);
        make.centerY.equalTo(weakSelf.iconImage.mas_centerY);
    }];
    
    [_writeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(20, 20));
        make.bottom.equalTo(weakSelf.contentView.mas_bottom).offset(-30);
        make.right.equalTo(weakSelf.contentView.mas_right).offset(-100);
    }];
    [_writeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(50, 10));
        make.left.equalTo(weakSelf.writeBtn.mas_right).offset(10);
        make.centerY.equalTo(weakSelf.writeBtn.mas_centerY);
    }];
    
    [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(20, 20));
        make.bottom.equalTo(weakSelf.contentView.mas_bottom).offset(-30);
        make.left.equalTo(weakSelf.writeLabel.mas_right).offset(-30);
    }];
    
    [_likeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(50, 10));
        make.left.equalTo(weakSelf.likeBtn.mas_right).offset(10);
        make.centerY.equalTo(weakSelf.writeBtn.mas_centerY);
    }];
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.contentView.mas_bottom);
        make.right.equalTo(weakSelf.contentView.mas_right);
        make.left.equalTo(weakSelf.contentView.mas_left);
        make.height.equalTo(0.5);
    }];
    
    
    
}
- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineLabel;
}
- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
        _iconImage.layer.masksToBounds = YES;
        _iconImage.layer.cornerRadius = 15.0;
        _iconImage.backgroundColor = [UIColor lightGrayColor];
    }
    return _iconImage;
}

- (UILabel *)userName{
    if (!_userName) {
        _userName = [[UILabel alloc]init];
        _userName.textAlignment = NSTextAlignmentLeft;
        _userName.font = [UIFont systemFontOfSize:13.0];
        _userName.textColor = RGB(80, 100, 127);
    }
    return _userName;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.font = [UIFont systemFontOfSize:13.0];
        _timeLabel.textColor = [UIColor blackColor];
    }
    return _timeLabel;
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.textColor = [UIColor blackColor];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15.0f];
    }
    return _contentLabel;
}

- (UIImageView *)contentImage{
    if (!_contentImage) {
        _contentImage = [[UIImageView alloc]init];
    }
    return _contentImage;
}

- (UIButton *)writeBtn{
    if (!_writeBtn) {
        _writeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_writeBtn setImage:[UIImage imageNamed:@"评论"] forState:(UIControlStateNormal)];
    }
    return _writeBtn;
}

- (UILabel *)writeLabel{
    if (!_writeLabel) {
        _writeLabel = [[UILabel alloc]init];
        _writeLabel.font = [UIFont systemFontOfSize:9.0];
        _writeLabel.textColor = [UIColor blackColor];
        _writeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _writeLabel;
}

- (UIButton *)likeBtn{
    if (!_likeBtn) {
        _likeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_likeBtn setImage:[UIImage imageNamed:@"喜欢"] forState:(UIControlStateNormal)];
    }
    return _likeBtn;
}

- (UILabel *)likeLabel{
    if (!_likeLabel) {
        _likeLabel = [[UILabel alloc]init];
        _likeLabel.font = [UIFont systemFontOfSize:9.0];
        _likeLabel.textColor = [UIColor blackColor];
        _likeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _likeLabel;
}
//生成属性字符串
- (NSAttributedString *)makeText :(NSString *)exampleString{
    //段落类型
    NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc] init];
    //行间距
    paragraph.lineSpacing = 10;
    //段落间隔
    paragraph.paragraphSpacing = 20;
    //首行缩近
    paragraph.firstLineHeadIndent = 30;
    //属性字典（[UIFont fontWithName:@"PingFangSC-Regular" size:15.0f]指定字符串使用的字体，因为iOS9中字体不是黑体是苹果体，不然在iOS9中字符高度计算容易出现错误）
    NSDictionary * dictA = @{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:15.0f],
                             //                             NSForegroundColorAttributeName:[UIColor greenColor],
                             //                             NSBackgroundColorAttributeName:[UIColor grayColor],
                             NSParagraphStyleAttributeName:paragraph,
                             //                             NSObliquenessAttributeName:@0.5 //斜体
                             //                             NSStrokeColorAttributeName:[UIColor whiteColor],
                             //                             NSStrokeWidthAttributeName:@2,//描边
                             //                             NSKernAttributeName:@20,//字间距
                             //                             NSStrikethroughStyleAttributeName:@2//删除线
                             //                             NSUnderlineStyleAttributeName:@1,//下划线
                             };
    //返回属性字符串
    NSAttributedString * attribute = [[NSAttributedString alloc] initWithString:exampleString attributes:dictA];
    return attribute;
}
@end
