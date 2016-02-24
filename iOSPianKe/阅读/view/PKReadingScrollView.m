//
//  PKReadingScrollView.m
//  iOSPianKe
//
//  Created by ma c on 16/2/10.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import "PKReadingScrollView.h"
#import "Masonry.h"
#import "UIImageView+SDWedImage.h"
#import "MJChiBaoZiHeader.h"
#import "MJChiBaoZiFooter2.h"
#import "MJRefresh.h"
@interface PKReadingScrollView()<UIScrollViewDelegate>




@end

@implementation PKReadingScrollView

- (instancetype)initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.oneScrollView];
        [self addSubview:self.onePageControl];
        [self addSubview:self.readingImageView1];
        [self addSubview:self.readingImageView2];
        [self addSubview:self.readingImageView3];
        [self addSubview:self.readingImageView4];
        [self addSubview:self.readingImageView5];
        [self addSubview:self.readingImageView6];
        [self addSubview:self.readingImageView7];
        [self addSubview:self.readingImageView8];
        [self addSubview:self.readingImageView9];
        
        [self addSubview:self.readingLabel1];
        [self addSubview:self.readingLabel2];
        [self addSubview:self.readingLabel3];
        [self addSubview:self.readingLabel4];
        [self addSubview:self.readingLabel5];
        [self addSubview:self.readingLabel6];
        [self addSubview:self.readingLabel7];
        [self addSubview:self.readingLabel8];
        [self addSubview:self.readingLabel9];
        
        [self addSubview:self.readLabel1];
        [self addSubview:self.readLabel2];
        [self addSubview:self.readLabel3];
        [self addSubview:self.readLabel4];
        [self addSubview:self.readLabel5];
        [self addSubview:self.readLabel6];
        [self addSubview:self.readLabel7];
        [self addSubview:self.readLabel8];
        [self addSubview:self.readLabel9];
        
        
        [self addSubview:self.bottomImage];
        self.delegate = self;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        [self addCreatUI];
        [NSTimer scheduledTimerWithTimeInterval:4.0f target:self selector:@selector(readingUpdate) userInfo:nil repeats:YES];
    }
    return self;
}



#pragma mark - 顶部的scrollView
- (void)setReadingArray:(NSArray *)readingArray{
    
    for (NSInteger i = 0 ; i < 4 ; i++) {
        UIImageView* ReadingImag = [self viewWithTag:10+i];
        if (i == 3) {
            PKReadingCarousel* ReadingModel = readingArray[i-3];
            [ReadingImag downloadImage:ReadingModel.img];
        }else{
            PKReadingCarousel* ReadingModel = readingArray[i];
            [ReadingImag downloadImage:ReadingModel.img];
        }
    }
}

- (UIScrollView*)oneScrollView{
    if (!_oneScrollView) {
        _oneScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT-430)];
        _oneScrollView.contentSize = CGSizeMake(3*VIEW_WIDTH, 160);
        
        _oneScrollView.showsVerticalScrollIndicator = NO;
        _oneScrollView.showsHorizontalScrollIndicator = NO;
        _oneScrollView.scrollEnabled = NO;
        _oneScrollView.delegate = self;
        for (NSInteger i = 0 ; i < 4 ; i++) {
            _readingImage = [[UIImageView alloc] init];
            _readingImage.tag = 10+i;
            _readingImage.frame = CGRectMake(i*VIEW_WIDTH, 0,VIEW_WIDTH,VIEW_HEIGHT-430);
            [_oneScrollView addSubview:_readingImage];
        }
        
    }
    return _oneScrollView;
}
- (UIPageControl*)onePageControl{
    if (!_onePageControl) {
        _onePageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(110, 115, 30, 4)];
        _onePageControl.pageIndicatorTintColor = [UIColor colorWithWhite:0.8 alpha:1];
        _onePageControl.numberOfPages = 3;
        _onePageControl.currentPage = 0;
    }
    return _onePageControl;
}
// 计时器自动轮播让pagecontrol 跟着scrollview走
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    _onePageControl.currentPage = offset.x/VIEW_WIDTH;
}
- (void)readingUpdate{
    
    [UIView animateWithDuration:0.4 animations:^{
        self.onePageControl.currentPage ++;
        CGPoint offset = self.oneScrollView.contentOffset;
        offset.x += VIEW_WIDTH;
        self.oneScrollView.contentOffset = offset;
    } completion:^(BOOL finished) {
        if (self.oneScrollView.contentOffset.x == VIEW_WIDTH*3) {
            self.onePageControl.currentPage = 0 ;
            self.oneScrollView.contentOffset = CGPointZero;
        }
    }];
}

#pragma mark - 中部的九个小矮人
- (void)setImageArray:(NSArray *)imageArray{
 
     PKReadingList* model1 = imageArray[0];
     PKReadingList* model2 = imageArray[1];
     PKReadingList* model3 = imageArray[2];
     PKReadingList* model4 = imageArray[3];
     PKReadingList* model5 = imageArray[4];
     PKReadingList* model6 = imageArray[5];
     PKReadingList* model7 = imageArray[6];
     PKReadingList* model8 = imageArray[7];
     PKReadingList* model9 = imageArray[8];
    
    [self.readingImageView1 downloadImage:model1.coverimg];
    [self.readingImageView2 downloadImage:model2.coverimg];
    [self.readingImageView3 downloadImage:model3.coverimg];
    [self.readingImageView4 downloadImage:model4.coverimg];
    [self.readingImageView5 downloadImage:model5.coverimg];
    [self.readingImageView6 downloadImage:model6.coverimg];
    [self.readingImageView7 downloadImage:model7.coverimg];
    [self.readingImageView8 downloadImage:model8.coverimg];
    [self.readingImageView9 downloadImage:model9.coverimg];
    
    self.readingLabel1.text = model1.name;
    self.readingLabel2.text = model2.name;
    self.readingLabel3.text = model3.name;
    self.readingLabel4.text = model4.name;
    self.readingLabel5.text = model5.name;
    self.readingLabel6.text = model6.name;
    self.readingLabel7.text = model7.name;
    self.readingLabel8.text = model8.name;
    self.readingLabel9.text= model9.name;
    
    self.readLabel1.text = model1.enname;
    self.readLabel2.text = model2.enname;
    self.readLabel3.text = model3.enname;
    self.readLabel4.text = model4.enname;
    self.readLabel5.text = model5.enname;
    self.readLabel6.text = model6.enname;
    self.readLabel7.text = model7.enname;
    self.readLabel8.text = model8.enname;
    self.readLabel9.text = model9.enname;
    
}

- (UIImageView*)readingImageView1{
    if (!_readingImageView1) {
        _readingImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0,140, 103, 100)];
    }
    return _readingImageView1;
}
- (UIImageView*)readingImageView2{
    if (!_readingImageView2) {
        _readingImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(105, 140, 103, 100)];
    }
    return _readingImageView2;
}
- (UIImageView*)readingImageView3{
    if (!_readingImageView3) {
        _readingImageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(210, 140, 103, 100)];
}
    return _readingImageView3;
}
- (UIImageView*)readingImageView4{
    if (!_readingImageView4) {
        _readingImageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 242, 103, 100)];
    }
    return _readingImageView4;
}
- (UIImageView*)readingImageView5{
    if (!_readingImageView5) {
        _readingImageView5 = [[UIImageView alloc] initWithFrame:CGRectMake(105, 242, 103, 100)];
    }
    return _readingImageView5;
}
- (UIImageView*)readingImageView6{
    if (!_readingImageView6) {
        _readingImageView6 = [[UIImageView alloc] initWithFrame:CGRectMake(210, 242, 103, 100)];
    }
    return _readingImageView6;
}
- (UIImageView*)readingImageView7{
    if (!_readingImageView7) {
        _readingImageView7 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 344, 103, 100)];
    }
    return _readingImageView7;
}
- (UIImageView*)readingImageView8{
    if (!_readingImageView8) {
        _readingImageView8 = [[UIImageView alloc] initWithFrame:CGRectMake(105, 344, 103, 100)];
    }
    return _readingImageView8;
}
- (UIImageView*)readingImageView9{
    if (!_readingImageView9) {
        _readingImageView9 = [[UIImageView alloc] initWithFrame:CGRectMake(210, 344, 103, 100)];
    }
    return _readingImageView9;
}

- (UILabel*)readingLabel1{
    if (!_readingLabel1) {
        _readingLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 220, 75, 20)];
        _readingLabel1.textColor = [UIColor whiteColor];
        _readingLabel1.font = [UIFont boldSystemFontOfSize:14.0f];
 
    }
    return _readingLabel1;
}
- (UILabel*)readingLabel2{
    if (!_readingLabel2) {
        _readingLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(105, 220, 75, 20)];
        _readingLabel2.textColor = [UIColor whiteColor];
        _readingLabel2.font = [UIFont boldSystemFontOfSize:14.0f];
       
    }
    return _readingLabel2;
}
- (UILabel*)readingLabel3{
    if (!_readingLabel3) {
        _readingLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(210, 220, 75, 20)];
        _readingLabel3.textColor = [UIColor whiteColor];
        _readingLabel3.font = [UIFont boldSystemFontOfSize:14.0f];
        
    }
    return _readingLabel3;
}
- (UILabel*)readingLabel4{
    if (!_readingLabel4) {
        _readingLabel4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 322, 75, 20)];
        _readingLabel4.textColor = [UIColor whiteColor];
        _readingLabel4.font = [UIFont boldSystemFontOfSize:14.0f];
     
        
    }
    return _readingLabel4;
}
- (UILabel*)readingLabel5{
    if (!_readingLabel5) {
        _readingLabel5 = [[UILabel alloc] initWithFrame:CGRectMake(105, 322, 75, 20)];
        _readingLabel5.textColor = [UIColor whiteColor];
        _readingLabel5.font = [UIFont boldSystemFontOfSize:14.0f];

    }
    return _readingLabel5;
}
- (UILabel*)readingLabel6{
    if (!_readingLabel6) {
        _readingLabel6 = [[UILabel alloc] initWithFrame:CGRectMake(210, 322, 55, 20)];
        _readingLabel6.textColor = [UIColor whiteColor];
        _readingLabel6.font = [UIFont boldSystemFontOfSize:14.0f];
       
    }
    return _readingLabel6;
}
- (UILabel*)readingLabel7{
    if (!_readingLabel7) {
        _readingLabel7 = [[UILabel alloc] initWithFrame:CGRectMake(0, 424, 75, 20)];
        _readingLabel7.textColor = [UIColor whiteColor];
        _readingLabel7.font = [UIFont boldSystemFontOfSize:14.0f];
        _readingLabel7.textAlignment = NSTextAlignmentNatural;
    }
    return _readingLabel7;
}
- (UILabel*)readingLabel8{
    if (!_readingLabel8) {
        _readingLabel8 = [[UILabel alloc] initWithFrame:CGRectMake(105, 424, 75, 20)];
        _readingLabel8.textColor = [UIColor whiteColor];
        _readingLabel8.font = [UIFont boldSystemFontOfSize:14.0f];
      
    }
    return _readingLabel8;
}
- (UILabel*)readingLabel9{
    if (!_readingLabel9) {
        _readingLabel9 = [[UILabel alloc] initWithFrame:CGRectMake(210, 424, 25, 20)];
        _readingLabel9.textColor = [UIColor whiteColor];
        _readingLabel9.font = [UIFont boldSystemFontOfSize:14.0f];
        
    }
    return _readingLabel9;
}

- (UILabel*)readLabel1{
    if (!_readLabel1) {
        _readLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(70, 220, 33, 20)];
        _readLabel1.textColor = [UIColor whiteColor];
        _readLabel1.font = [UIFont boldSystemFontOfSize:13.0f];
        _readLabel1.textAlignment = NSTextAlignmentCenter;
    }
    return _readLabel1;
}
- (UILabel*)readLabel2{
    if (!_readLabel2) {
        _readLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(175, 220, 33, 20)];
        _readLabel2.textColor = [UIColor whiteColor];
        _readLabel2.font = [UIFont boldSystemFontOfSize:13.0f];
        _readLabel2.textAlignment = NSTextAlignmentCenter;
    }
    return _readLabel2;
}
- (UILabel*)readLabel3{
    if (!_readLabel3) {
        _readLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(250, 220, 65, 20)];
        _readLabel3.textColor = [UIColor whiteColor];
        _readLabel3.font = [UIFont boldSystemFontOfSize:13.0f];
        _readLabel3.textAlignment = NSTextAlignmentCenter;
    }
    return _readLabel3;
}
- (UILabel*)readLabel4{
    if (!_readLabel4) {
        _readLabel4 = [[UILabel alloc] initWithFrame:CGRectMake(40, 322, 55, 20)];
        _readLabel4.textColor = [UIColor whiteColor];
        _readLabel4.font = [UIFont boldSystemFontOfSize:13.0f];
        _readLabel4.textAlignment = NSTextAlignmentCenter;
    }
    return _readLabel4;
}
- (UILabel*)readLabel5{
    if (!_readLabel5) {
        _readLabel5 = [[UILabel alloc] initWithFrame:CGRectMake(145, 322, 55, 20)];
        _readLabel5.textColor = [UIColor whiteColor];
        _readLabel5.font = [UIFont boldSystemFontOfSize:13.0f];
        _readLabel5.textAlignment = NSTextAlignmentCenter;
    }
    return _readLabel5;
}
- (UILabel*) readLabel6{
    if (!_readLabel6) {
        _readLabel6 = [[UILabel alloc] initWithFrame:CGRectMake(255, 322, 45, 20)];
        _readLabel6.textColor = [UIColor whiteColor];
        _readLabel6.font = [UIFont boldSystemFontOfSize:13.0f];
        _readLabel6.textAlignment = NSTextAlignmentCenter;
    }
    return _readLabel6;
}
- (UILabel*)readLabel7{
    if (!_readLabel7) {
        _readLabel7 = [[UILabel alloc] initWithFrame:CGRectMake(40, 424, 55, 20)];
        _readLabel7.textColor = [UIColor whiteColor];
        _readLabel7.font = [UIFont boldSystemFontOfSize:13.0f];
        _readLabel7.textAlignment = NSTextAlignmentCenter;
    }
    return _readLabel7;
}
- (UILabel*)readLabel8{
    if (!_readLabel8) {
        _readLabel8 = [[UILabel alloc] initWithFrame:CGRectMake(145, 424, 55, 20)];
        _readLabel8.textColor = [UIColor whiteColor];
        _readLabel8.font = [UIFont boldSystemFontOfSize:13.0f];
        _readLabel8.textAlignment = NSTextAlignmentCenter;
    }
    return _readLabel8;
}
- (UILabel*)readLabel9{
    if (!_readLabel9) {
        _readLabel9 = [[UILabel alloc] initWithFrame:CGRectMake(237, 424, 55, 20)];
        _readLabel9.textColor = [UIColor whiteColor];
        _readLabel9.font = [UIFont boldSystemFontOfSize:13.0f];
        _readLabel9.textAlignment = NSTextAlignmentLeft;
    }
    return _readLabel9;
}


#pragma mark - 底部的Image
- (UIImageView*)bottomImage{
    if (!_bottomImage) {
        _bottomImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"底部bottom"]];
        _bottomImage.frame = CGRectMake(0, 446, VIEW_WIDTH, 100);
        _bottomImage.backgroundColor = [UIColor orangeColor];
    }
    return _bottomImage;
}


#pragma mark - 刷新代码
- (void)addCreatUI{
    
    MJChiBaoZiHeader* headr = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    headr.lastUpdatedTimeLabel.hidden = YES;
    headr.stateLabel.hidden = YES;
    self.mj_header = headr;
    
    MJChiBaoZiFooter2* footer = [MJChiBaoZiFooter2 footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    footer.stateLabel.hidden = YES;
    self.mj_footer.automaticallyChangeAlpha = YES;
    self.mj_footer = footer;
}
- (void)loadNewData{
    if (_loadNewDataBlock) {
        _loadNewDataBlock();
    }
}
- (void)loadMoreData{
    if (_loadMoreDataBlock) {
        _loadMoreDataBlock();
    }
}


@end
