//
//  PKFirstViewCell.h
//  iOSPianKe
//
//  Created by ma c on 16/1/26.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface PKFirstViewCell : UITableViewCell


@property (strong, nonatomic) NSArray* PicutreList;

@property (strong, nonatomic) UIScrollView* FirstScrollView;
@property (strong, nonatomic) UIPageControl* FirstPageControl;
@property (strong, nonatomic) UIImageView* imagePicture;

@end
