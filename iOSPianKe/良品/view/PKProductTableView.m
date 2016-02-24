//
//  PKProductTableView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/22.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//
#import "PKProductDetailsViewController.h" // 良品详情
#import "PKProductTableView.h"
#import "PKProductViewCell.h"
#import "MJChiBaoZiHeader.h"
#import "MJChiBaoZiFooter2.h"
#import "MJRefresh.h"

@interface PKProductTableView()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation PKProductTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addCreatUI];
    }
    return self;
}
- (void)addCreatUI{
    
    MJChiBaoZiHeader* headr = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    headr.lastUpdatedTimeLabel.hidden = YES;
    headr.stateLabel.hidden = YES;
    self.mj_header = headr;
    
    MJChiBaoZiFooter2* footer = [MJChiBaoZiFooter2 footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    footer.stateLabel.hidden = YES;
    self.mj_footer.automaticallyChangeAlpha = YES;
    self.mj_footer = footer;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _tableViewArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellID = @"cell";
    PKProductViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[PKProductViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    }
    
     cell.cellList = self.tableViewArray[indexPath.row];
    cell.backgroundColor = RGB(221, 219, 221);
    
    return cell;
}

#pragma makr - 跳转良品详情界面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PKProductViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.myBlock(cell);
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 220;
}
- (void)loadNewData{
    if (_loadNewDataBlock) {
        _loadNewDataBlock();
    }
}
- (void)loadMoreData{
    if (_loadMoreDataBlock) {
        _loadMoreDataBlock();
    }
}
@end
