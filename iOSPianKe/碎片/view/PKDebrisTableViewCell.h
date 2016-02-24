//
//  PKDebrisTableViewCell.h
//  iOSPianKe
//
//  Created by ma c on 16/1/20.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKFragmentModel.h"
@interface PKDebrisTableViewCell : UITableViewCell

@property (strong, nonatomic) PKFragmentList* counterList;
@property (strong, nonatomic) NSDictionary* heightDic;

@end
