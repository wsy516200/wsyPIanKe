//
//  PKReadingScrollView.h
//  iOSPianKe
//
//  Created by ma c on 16/2/10.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKReadingModel.h"

typedef  void (^loadNewDataBlock)();
typedef  void (^loadMoreDataBlock)();
@interface PKReadingScrollView : UIScrollView


@property (copy, nonatomic) loadNewDataBlock loadNewDataBlock;
@property (copy, nonatomic) loadMoreDataBlock loadMoreDataBlock;

// 顶部scrollView控件
@property (strong, nonatomic) UIScrollView* oneScrollView;
@property (strong, nonatomic) UIPageControl* onePageControl;
@property (strong, nonatomic) UIImageView* readingImage;
@property (strong, nonatomic) NSArray* readingArray;

// 中部的九个白雪公主 + 九个小矮人 + 九个白马王子
@property (strong, nonatomic) UIImageView* readingImageView1;
@property (strong, nonatomic) UIImageView* readingImageView2;
@property (strong, nonatomic) UIImageView* readingImageView3;
@property (strong, nonatomic) UIImageView* readingImageView4;
@property (strong, nonatomic) UIImageView* readingImageView5;
@property (strong, nonatomic) UIImageView* readingImageView6;
@property (strong, nonatomic) UIImageView* readingImageView7;
@property (strong, nonatomic) UIImageView* readingImageView8;
@property (strong, nonatomic) UIImageView* readingImageView9;
@property (strong, nonatomic) NSArray* imageArray;

@property (strong, nonatomic) UILabel* readingLabel1;
@property (strong, nonatomic) UILabel* readingLabel2;
@property (strong, nonatomic) UILabel* readingLabel3;
@property (strong, nonatomic) UILabel* readingLabel4;
@property (strong, nonatomic) UILabel* readingLabel5;
@property (strong, nonatomic) UILabel* readingLabel6;
@property (strong, nonatomic) UILabel* readingLabel7;
@property (strong, nonatomic) UILabel* readingLabel8;
@property (strong, nonatomic) UILabel* readingLabel9;

@property (strong, nonatomic) UILabel* readLabel1;
@property (strong, nonatomic) UILabel* readLabel2;
@property (strong, nonatomic) UILabel* readLabel3;
@property (strong, nonatomic) UILabel* readLabel4;
@property (strong, nonatomic) UILabel* readLabel5;
@property (strong, nonatomic) UILabel* readLabel6;
@property (strong, nonatomic) UILabel* readLabel7;
@property (strong, nonatomic) UILabel* readLabel8;
@property (strong, nonatomic) UILabel* readLabel9;



// 底部的控件
@property (strong, nonatomic) UIImageView* bottomImage;
@end








