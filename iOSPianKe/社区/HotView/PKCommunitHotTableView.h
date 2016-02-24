//
//  PKCommunitTableView.h
//  iOSPianKe
//
//  Created by ma c on 16/2/18.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKCommunitHotTableView.h"

typedef void(^loadNewDataBlock)(); // 加载数据
typedef void(^loadMoreDataBlock)();// 加载更多数据

@interface PKCommunitHotTableView : UITableView

@property (strong, nonatomic) NSArray* hotCellHeightArray; // 高度数据
@property (strong, nonatomic) NSArray* hotCellModel; // 社区数据

@property (copy, nonatomic) loadNewDataBlock NewDataBlock;
@property (copy, nonatomic) loadMoreDataBlock MoreDataBlock;
@end
