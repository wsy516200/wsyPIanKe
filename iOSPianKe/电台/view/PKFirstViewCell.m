//
//  PKFirstViewCell.m
//  iOSPianKe
//
//  Created by ma c on 16/1/26.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import "PKFirstViewCell.h"
#import "Masonry.h"
#import "UIImageView+SDWedImage.h"
#import "PKRadioModel.h"
@interface PKFirstViewCell()<UIScrollViewDelegate>





@end

@implementation PKFirstViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.FirstScrollView];
        [self addSubview:self.FirstPageControl];
        [self addAutoLayt];
        [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    }
    return self;
}
- (void)setPicutreList:(NSArray *)PicutreList{
    
    for (NSInteger i = 0 ; i < 4 ; i++) {
         UIImageView* PictuImag = [self viewWithTag:10+i];
        if (i == 3) {
            PKCarousela* model = PicutreList[i-3];
            [PictuImag downloadImage:model.img];
        }else{
            PKCarousela* model = PicutreList[i];
            [PictuImag downloadImage:model.img];
        }
    }
}

- (void)addAutoLayt{
    WS(weakSelf);
    
    [_FirstScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(5);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(5);
        make.left.equalTo(weakSelf.mas_left).offset(5);
        make.right.equalTo(weakSelf.mas_right).offset(-5);
    }];
    
    [_FirstPageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.FirstScrollView.mas_right).offset(-30);
        make.bottom.equalTo(weakSelf.FirstScrollView.mas_bottom).offset(-10);
        make.size.equalTo(CGSizeMake(10, 4));
    }];
}
- (UIScrollView*)FirstScrollView{
    if (!_FirstScrollView) {
        _FirstScrollView = [[UIScrollView alloc] init];
        _FirstScrollView.backgroundColor = [UIColor grayColor];
        _FirstScrollView.delegate = self;
        _FirstScrollView.pagingEnabled = YES;
        _FirstScrollView.contentSize = CGSizeMake(3*VIEW_WIDTH, 160);
        _FirstScrollView.showsVerticalScrollIndicator = NO;
        _FirstScrollView.showsHorizontalScrollIndicator = NO;
        for (NSInteger i = 0 ; i < 4 ; i++) {
            _imagePicture = [[UIImageView alloc] init];
            _imagePicture.tag = 10+i;
            _imagePicture.frame = CGRectMake(i*VIEW_WIDTH, 0,VIEW_WIDTH, 160);
            [_FirstScrollView addSubview:_imagePicture];
        }
    }
    
    return _FirstScrollView;
}

- (UIPageControl*)FirstPageControl{
    if (!_FirstPageControl) {
        _FirstPageControl = [[UIPageControl alloc]init];
        _FirstPageControl.pageIndicatorTintColor = [UIColor colorWithWhite:0.8 alpha:1];
        _FirstPageControl.numberOfPages = 3;
        _FirstPageControl.currentPage = 0;
    }
    return _FirstPageControl;
}

#pragma mark -  计时器自动轮播让pagecontrol 跟着scrollview走
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    _FirstPageControl.currentPage = offset.x/VIEW_WIDTH;
}
- (void)updateTime{
    
    [UIView animateWithDuration:0.1 animations:^{
        self.FirstPageControl.currentPage ++;
        CGPoint offset = self.FirstScrollView.contentOffset;
        offset.x += VIEW_WIDTH;
        self.FirstScrollView.contentOffset = offset;
    } completion:^(BOOL finished) {
        if (self.FirstScrollView.contentOffset.x == VIEW_WIDTH*3) {
            self.FirstPageControl.currentPage = 0 ;
            self.FirstScrollView.contentOffset = CGPointZero;
        }
    }];
    
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
