//
//  PKProductTableView.h
//  iOSPianKe
//
//  Created by ma c on 16/1/22.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PKProductViewCell;

typedef  void (^loadNewDataBlock)();
typedef  void (^loadMoreDataBlock)();

@interface PKProductTableView : UITableView

@property (strong, nonatomic) NSArray* tableViewArray;

@property (copy, nonatomic) loadNewDataBlock loadNewDataBlock;
@property (copy, nonatomic) loadMoreDataBlock loadMoreDataBlock;
@property (copy, nonatomic) void(^myBlock)(PKProductViewCell* cell);

@end
