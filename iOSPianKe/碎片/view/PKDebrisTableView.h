//
//  PKDebrisTableView.h
//  iOSPianKe
//
//  Created by ma c on 16/1/20.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKDebrisTableView.h" // 碎片数据
typedef void(^loadNewDataBlock)(); // 加载数据
typedef void(^loadMoreDataBlock)();// 加载更多数据

@interface PKDebrisTableView : UITableView

@property (strong, nonatomic) NSArray* DebrisModel; // 碎片数据
@property (strong, nonatomic) NSArray* cellHeightArray; // 高度数据

@property (copy, nonatomic) loadNewDataBlock NewDataBlock;
@property (copy, nonatomic) loadMoreDataBlock MoreDataBlock;

@end
