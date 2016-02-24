//
//  PKCommunitNewCell.h
//  iOSPianKe
//
//  Created by ma c on 16/2/21.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKCommunitNewModel.h"
@interface PKCommunitNewCell : UITableViewCell

@property (strong, nonatomic) UILabel* titleLabel;  // 标题
@property (strong, nonatomic) UIImageView* contentImage;
@property (strong, nonatomic) UILabel* contentLabel; // 内容
@property (strong, nonatomic) UILabel* timeLabel; // 刷新时间段
@property (strong, nonatomic) UIButton* writeBtn; // 评论
@property (strong, nonatomic) UILabel* writeLabel; // 评论数量
@property (strong, nonatomic) UILabel* lineLabel;  // 线

@property (strong, nonatomic) PKCommunitNewList* communitCellList;
@property (strong, nonatomic) NSDictionary* cellNewListDic;
@end
