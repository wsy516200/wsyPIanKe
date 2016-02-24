//
//  PKHomeViewController.m
//  iOSPianKe
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import "PKHomeViewController.h"
#import "PKDebrisTableView.h"
#import "PKFragmentModel.h"
#import "NSArray+PKFragmentCellHeight.h"
//#import "Masonry.h"
#import "MJRefresh.h"
@interface PKHomeViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic)               PKDebrisTableView *fragmentTable;
@property (strong, nonatomic)               PKFragmentModel *FragmentModel;
@end

@implementation PKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self reloadFragmentTabelData:0];
    [self.view addSubview:self.fragmentTable];
    
}
- (PKDebrisTableView *)fragmentTable{
    if (!_fragmentTable) {
        _fragmentTable = [[PKDebrisTableView alloc]initWithFrame:self.view.frame style:(UITableViewStylePlain)];
        WS(weakSelf);
        //上拉加载的block回调方法
        _fragmentTable.MoreDataBlock = ^(){
            // 隐藏当前的上拉刷新控件
            [weakSelf reloadFragmentTabelData:0];
        };
        //下拉加载的block回调方法
        _fragmentTable.NewDataBlock = ^(){
            [weakSelf reloadFragmentTabelData:10];
        };
    }
    return _fragmentTable;
}

// 碎片界面
- (void)reloadFragmentTabelData:(NSInteger)start{
    //制作请求参数
    NSDictionary *requestDic = @{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",
                                 @"client":@"1",
                                 @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                                 @"limit":@"10",
                                 @"start":[NSString stringWithFormat:@"%li",(long)start],
                                 @"version":@"3.0.6"};
    WS(weakSelf);
    //开始网络请求
    [self POSTHttpRequest:@"http://api2.pianke.me/timeline/list" dic:requestDic successBalck:^(id JSON) {
        NSLog(@"%@",JSON);
        NSDictionary *returnDic = JSON;
        if ([returnDic[@"result"]integerValue] == 1) {
            //将得到的模型转换成model
            weakSelf.FragmentModel = [[PKFragmentModel alloc]initWithDictionary:returnDic];
            NSArray *heightArray = [NSArray countCellHeight:weakSelf.FragmentModel.data.list];
            
            //tableview用来存储数据的数组
            weakSelf.fragmentTable.DebrisModel = weakSelf.FragmentModel.data.list;
            //给tableviewcell高度的数组赋值
            weakSelf.fragmentTable.cellHeightArray = heightArray;
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.fragmentTable reloadData];
            });
            
        }
        //结束刷新状态
        [weakSelf.fragmentTable.mj_footer endRefreshing];
        [weakSelf.fragmentTable.mj_header endRefreshing];
    } errorBlock:^(NSError *error) {
        NSLog(@"-----------%@",error);
    }];
}

//- (void)dissmiss{
//    [self.sideMenuViewController presentLeftMenuViewController];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
