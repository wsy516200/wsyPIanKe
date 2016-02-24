//
//  PKThirdViewCell.h
//  iOSPianKe
//
//  Created by ma c on 16/1/27.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKRadioModel.h"
@interface PKThirdViewCell : UITableViewCell

@property (strong, nonatomic) PKAlllista* ThirdCellList;


@property (strong, nonatomic) UIImageView* ImagePicture; // 图片
@property (strong, nonatomic) UILabel* labelName; //  姓名
@property (strong, nonatomic) UILabel* labelAuthor; // 作者
@property (strong, nonatomic) UILabel* labelHuiSe;
@property (strong, nonatomic) UILabel* lineLabel;

@end
