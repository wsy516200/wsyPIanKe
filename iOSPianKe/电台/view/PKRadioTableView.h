//
//  PKRadioTableView.h
//  iOSPianKe
//
//  Created by ma c on 16/1/26.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  void (^loadNewDataBlock)();
typedef  void (^loadMoreDataBlock)();

@interface PKRadioTableView : UITableView

@property (copy, nonatomic) loadNewDataBlock loadNewDataBlock;
@property (copy, nonatomic) loadMoreDataBlock loadMoreDataBlock;

@property (strong, nonatomic) NSMutableArray* RadioArray; // 第三个cell的数组
@property (strong, nonatomic) NSArray* TwoArray; // 第二个cell数组
@property (strong, nonatomic) NSArray* PictureArray; // 第一个cell数组

@end
