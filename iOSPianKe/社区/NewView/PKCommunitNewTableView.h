//
//  PKCommunitNewTableView.h
//  iOSPianKe
//
//  Created by ma c on 16/2/21.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^loadNewDataBlock)(); // 加载数据
typedef void(^loadMoreDataBlock)();// 加载更多数据

@interface PKCommunitNewTableView : UITableView

@property (strong, nonatomic) NSArray* cellNewArray;


@property (copy, nonatomic) loadNewDataBlock NewDataBlock;
@property (copy, nonatomic) loadMoreDataBlock MoreDataBlock;

@end
