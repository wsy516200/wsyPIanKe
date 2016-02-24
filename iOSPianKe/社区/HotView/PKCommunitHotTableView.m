//
//  PKCommunitTableView.m
//  iOSPianKe
//
//  Created by ma c on 16/2/18.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//


#import "PKCommunitHotTableView.h"
#import "PKCommunitHotCell.h"
#import "MJRefresh.h"
#import "MJChiBaoZiHeader.h"
#import "MJChiBaoZiFooter2.h"
@interface PKCommunitHotTableView()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation PKCommunitHotTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addRefreshControl];
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _hotCellHeightArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 2;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* cell = @"communitHotCell";
    
    PKCommunitHotCell* comunHotCell = [tableView dequeueReusableCellWithIdentifier:cell];
    if (!comunHotCell) {
        comunHotCell = [[PKCommunitHotCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cell];
       comunHotCell.selectionStyle = UITableViewCellSeparatorStyleNone;
    }
    comunHotCell.cellHotList = _hotCellHeightArray[indexPath.row];
//     comunHotCell.cellHotList = _DebrisModel[indexPath.row];
     comunHotCell.backgroundColor = RGB(251, 251, 251);
    return comunHotCell;
    
}
#pragma mark - 设置刷新

- (void)addRefreshControl {
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    //    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    //    // 隐藏状态
    header.stateLabel.hidden = YES;
    //    // 马上进入刷新状态
    self.mj_header = header;
    //设置上拉加载的动画
    MJChiBaoZiFooter2 *footer = [MJChiBaoZiFooter2 footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    footer.stateLabel.hidden = YES;
    self.mj_footer.automaticallyChangeAlpha = YES;
    self.mj_footer = footer;
}
//下拉刷新全部数据
- (void)loadMoreData{
    if (_MoreDataBlock) {
        _MoreDataBlock();
    }
}
//上拉加载更多数据
- (void)loadNewData{
    if (_NewDataBlock) {
        _NewDataBlock();
    }
}

@end
