//
//  PKCommunitNewCell.m
//  iOSPianKe
//
//  Created by ma c on 16/2/21.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import "PKCommunitNewCell.h"
#import "Masonry.h"
#import "UIImageView+SDWedImage.h"
#import "NSString+Helper.h"

@implementation PKCommunitNewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.timeLabel];
        [self addSubview:self.contentLabel];
        [self addSubview:self.contentImage];
        [self addSubview:self.writeBtn];
        [self addSubview:self.writeLabel];
        [self addSubview:self.lineLabel];
        [self addAotuLayt];
        
    }
    return self;
}
//@property (strong, nonatomic) UILabel* titleLabel;  // 标题
//@property (strong, nonatomic) UIImageView* contentImage;
//@property (strong, nonatomic) UILabel* contentLabel; // 内容
//@property (strong, nonatomic) UILabel* timeLabel; // 刷新时间段
//@property (strong, nonatomic) UIButton* writeBtn; // 评论
//@property (strong, nonatomic) UILabel* writeLabel; // 评论数量
//@property (strong, nonatomic) UILabel* lineLabel;  // 线

- (void)setCommunitCellList:(PKCommunitNewList *)communitCellList{
    
    _communitCellList = communitCellList;
    _titleLabel.text = communitCellList.title;
    _timeLabel.text = communitCellList.addtimeF;
    _writeLabel.text = [NSString stringWithFormat:@"%li",(long)communitCellList.counterList.comment];
    [_contentImage downloadImage:communitCellList.coverimg];
    _contentLabel.attributedText = [self makeText:communitCellList.content];
    
    if ([communitCellList.coverimg isEmptyString]) {
        _contentLabel.frame = CGRectMake(40, 50, VIEW_WIDTH-45, 95);
    }else{
        _contentLabel.frame = CGRectMake(100,45, VIEW_WIDTH-105, 95);
        _contentImage.frame = CGRectMake(5, 45, VIEW_WIDTH- 240, 95);
    }
}

- (void)addAotuLayt{
    WS(weakSelf);
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(40);
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.mas_left).offset(5);
        make.right.equalTo(weakSelf.mas_right).offset(-5);
    }];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.lineLabel.mas_top).offset(-5);
        make.size.equalTo(CGSizeMake(80, 20));
        make.left.equalTo(weakSelf.titleLabel.mas_left);
    }];
    [_writeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(20, 20));
        make.centerY.equalTo(weakSelf.timeLabel.mas_centerY);
        make.right.equalTo(weakSelf.writeLabel.mas_left).offset(-5);
    }];
    [_writeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(40,20));
        make.centerY.equalTo(weakSelf.writeBtn.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
    }];
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left);
        make.right.equalTo(weakSelf.mas_right);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.height.equalTo(0.5);
    }];
}
- (UILabel*)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:15.0f];
    }
    return _titleLabel;
}
- (UILabel*)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13.0f];
    }
    return _contentLabel;
}
- (UILabel*)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:13.0f];
        _timeLabel.textColor = [UIColor lightGrayColor];
    }
    return _timeLabel;
}
- (UIButton *)writeBtn{
    if (!_writeBtn) {
        _writeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_writeBtn setImage:[UIImage imageNamed:@"评论"] forState:(UIControlStateNormal)];
    }
    return _writeBtn;
}
- (UILabel*)writeLabel{
    if (!_writeLabel) {
        _writeLabel = [[UILabel alloc] init];
        _writeLabel.font = [UIFont systemFontOfSize:12.0f];
    }
    return _writeLabel;
}

- (UILabel*)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineLabel;
}
- (UIImageView*)contentImage{
    if (!_contentImage) {
        _contentImage = [[UIImageView alloc] init];
    }
    return _contentImage;
}
//生成属性字符串
- (NSAttributedString *)makeText :(NSString *)exampleString{
    //段落类型
    NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc] init];
    //行间距
    paragraph.lineSpacing = 5;
    //段落间隔
    paragraph.paragraphSpacing = 10;
    //首行缩近
    //    paragraph.firstLineHeadIndent = 30;
    //属性字典（[UIFont fontWithName:@"PingFangSC-Regular" size:15.0f]指定字符串使用的字体，因为iOS9中字体不是黑体是苹果体，不然在iOS9中字符高度计算容易出现错误）
    NSDictionary * dictA = @{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:13.0f],
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

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
