//
//  PKRadioTableView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/26.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import "PKRadioTableView.h"
#import "PKFirstViewCell.h"
#import "PKTwoViewCell.h"
#import "PKThirdViewCell.h"
#import "MJChiBaoZiHeader.h"
#import "MJChiBaoZiFooter2.h"
#import "MJRefresh.h"
NSString* FirstCell = @"firstCell";
NSString* TwoCell = @"twoCell";
NSString* ThirdCell = @"thirdCell";
@interface PKRadioTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation PKRadioTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style ];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.showsVerticalScrollIndicator = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self registerClass:[PKFirstViewCell class] forCellReuseIdentifier:@"firstCell"];
        [self registerClass:[PKTwoViewCell class] forCellReuseIdentifier:@"twoCell"];
        [self registerClass:[PKThirdViewCell class] forCellReuseIdentifier:@"thirdCell"];
        [self addCreatUI];
    }
    return self;
}

- (NSMutableArray *)RadioArray {

    if (_RadioArray == nil) {
        _RadioArray = [NSMutableArray array];
    }
    return _RadioArray;

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

 // 当前分区表为3个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

// 给tableView加载每一个自定义cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0 || section == 1) {
        return 1;
    }else{
        return _RadioArray.count;
    }
    
}

// 设置section顶部间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0 ) {
        return 0;
    }else{
        return 3;
    }
}
// 设置section底部间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{

    return 5;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        PKFirstViewCell *firstViewCell = [tableView dequeueReusableCellWithIdentifier:FirstCell forIndexPath:indexPath];
          firstViewCell.PicutreList = self.PictureArray;
          firstViewCell.selectionStyle = UITableViewCellSeparatorStyleNone;
        return firstViewCell;
    }else if (indexPath.section == 1){
        PKTwoViewCell* twoViewCell = [tableView dequeueReusableCellWithIdentifier:TwoCell forIndexPath:indexPath];
          twoViewCell.TwoCellArray = self.TwoArray;
          twoViewCell.selectionStyle = UITableViewCellSeparatorStyleNone;
        return twoViewCell;
    }else{
        PKThirdViewCell* thirdCell = [tableView dequeueReusableCellWithIdentifier:ThirdCell forIndexPath:indexPath];
        thirdCell.ThirdCellList = _RadioArray[indexPath.row];
        thirdCell.selectionStyle = UITableViewCellSeparatorStyleNone;
        
        return thirdCell;
    }
}
//- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//     UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(5, 30, VIEW_WIDTH, 20)];
//    if (section == 2) {
//        label.text = @"ALL·全部电台  　——————————————";
//        label.font = [UIFont systemFontOfSize:13.0f];
//    }
//    return label;
//}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 ) {
        return 160.0f;
    }else if (indexPath.section == 1){
        return 120.0f;
    }else{
        return 80.0f;
    }
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
