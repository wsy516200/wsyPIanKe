//
//  PKProductViewCell.h
//  iOSPianKe
//
//  Created by ma c on 16/1/22.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKProductModel.h"
@interface PKProductViewCell : UITableViewCell

@property (strong, nonatomic) PKList* cellList;

@property (strong, nonatomic) UIImageView* tupianImage;
@property (strong, nonatomic) UILabel* neirongLabel;
@property (strong, nonatomic) UIButton* goumaiBtn;
@property (strong, nonatomic) UILabel* lineLabel;

@end
