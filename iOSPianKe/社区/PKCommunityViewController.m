//
//  PKCommunityViewController.m
//  iOSPianKe
//
//  Created by ma c on 16/1/19.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import "PKCommunityViewController.h"
#import "PKCommunitHotTableView.h" // 最热界面
#import "PKCommunitHotModel.h" // 最热Model
#import "PKCommunitNewTableView.h" // 最新界面
#import "PKCommunitNewModel.h" // 最新Model
#import "Masonry.h"
#import "MJRefresh.h"
@interface PKCommunityViewController ()<UIScrollViewDelegate>


@property (strong, nonatomic) UISegmentedControl* topSegmenControl; // 分段控件

@property (strong, nonatomic) PKCommunitHotTableView* communitHotTableView;//最热
@property (strong, nonatomic) PKCommunitHotModel* CommunitHotModel;// 最热Model

@property (strong, nonatomic) PKCommunitNewTableView* communitNewTableView;//最新
@property (strong, nonatomic) PKCommunitNewModel* CommunitNewModel;// 最新Model

@property (strong, nonatomic) UIScrollView* maxScrollView;// 底层的scr


@end

@implementation PKCommunityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self creatUI];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
   

}
- (void)creatUI{
    
    /**底层的滚动视图**/
    _maxScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 94, VIEW_WIDTH, VIEW_HEIGHT)];
    _maxScrollView.showsVerticalScrollIndicator = NO;
    _maxScrollView.showsHorizontalScrollIndicator = NO;
    _maxScrollView.bounces = NO;
    _maxScrollView.delegate = self;
    _maxScrollView.pagingEnabled = YES;
    _maxScrollView.contentSize = CGSizeMake(VIEW_WIDTH*2,0);
    [self.view addSubview:self.maxScrollView];
    
    /**分段控件**/
    _topSegmenControl = [[UISegmentedControl alloc] initWithItems:@[@"Hot",@"New"]];
    _topSegmenControl.frame = CGRectMake(90, 64, 140, 30);
    _topSegmenControl.selectedSegmentIndex = 0;
    _topSegmenControl.tintColor = RGB(216, 216, 216);
    [_topSegmenControl addTarget:self action:@selector(SegmentControl:) forControlEvents:(UIControlEventValueChanged)];
    // UIControlEventValueChange 点击事件
    [self.view addSubview:self.topSegmenControl];
    
    
    /**添加最热界面**/
    [self.maxScrollView addSubview:self.communitHotTableView];
    [self reloadCommunitTabelData:0];
    /**添加最新界面**/
    [self.maxScrollView addSubview:self.communitNewTableView];
    [self reloadCommunitNewTableData:0];
    

}
// 滚动结束时
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (self.maxScrollView.contentOffset.x == VIEW_WIDTH) {
        self.topSegmenControl.selectedSegmentIndex = 1;
        self.topSegmenControl.tintColor = RGB(195, 221, 179);
    }else{
        self.topSegmenControl.selectedSegmentIndex = 0;
        self.topSegmenControl.tintColor = RGB(195, 221, 179);
    }
}// 分段控件点击方法
- (void)SegmentControl:(id)sender{
    
    UISegmentedControl* segmentSender = (UISegmentedControl*)sender;
    if (segmentSender.selectedSegmentIndex == 0 ) {
        self.maxScrollView.contentOffset = CGPointMake(0, 0);
        self.topSegmenControl.tintColor = RGB(195, 221, 179);
    }else{
        self.maxScrollView.contentOffset = CGPointMake(VIEW_WIDTH, 0);
        self.topSegmenControl.tintColor = RGB(195, 221, 179);
    }
    
}
- (PKCommunitHotTableView*)communitHotTableView{
    if (!_communitHotTableView) {
        _communitHotTableView = [[PKCommunitHotTableView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT-64) style:(UITableViewStylePlain)];
        WS(weakSelf);
        //上拉加载的block回调方法
        _communitHotTableView.MoreDataBlock = ^(){
            // 隐藏当前的上拉刷新控件
            [weakSelf reloadCommunitTabelData:0];
        };
        //下拉加载的block回调方法
        _communitHotTableView.NewDataBlock = ^(){
            [weakSelf reloadCommunitTabelData:10];
        };
    }
    return _communitHotTableView;
}
- (void)reloadCommunitTabelData:(NSInteger)start{
    
    NSDictionary* requestDic = @{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",
                                @"client":@"1",
                                @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                                @"limit":@"10",
                                @"sort":@"hot",
                                @"start":[NSString stringWithFormat:@"%li",(long)start],
                                @"version":@"3.0.6"};
    WS(weakSelf);
    [ZJPBaseHttpTool postWithPath:@"http://api2.pianke.me/group/posts_hotlist" params:requestDic success:^(id JSON) {
        NSDictionary* returnDic = JSON;
        if ([returnDic[@"result"]integerValue] == 1) {
            weakSelf.CommunitHotModel = [[PKCommunitHotModel alloc] initWithDictionary:returnDic];
            weakSelf.communitHotTableView.hotCellHeightArray = weakSelf.CommunitHotModel.data.list;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.communitHotTableView reloadData];
        });
//        结束刷新状态
        [weakSelf.communitHotTableView.mj_footer endRefreshing];
        [weakSelf.communitHotTableView.mj_header endRefreshing];
    } failure:^(NSError *error) {
        
    }];
    
}
- (PKCommunitNewTableView*)communitNewTableView{
    if (!_communitNewTableView) {
        _communitNewTableView = [[PKCommunitNewTableView alloc] initWithFrame:CGRectMake(VIEW_WIDTH, 0, VIEW_WIDTH, VIEW_HEIGHT-64)  style:(UITableViewStylePlain)];
        WS(weakSelf);
        _communitNewTableView.MoreDataBlock = ^(){
            [weakSelf reloadCommunitNewTableData:0];
        };
        _communitNewTableView.NewDataBlock = ^(){
            [weakSelf reloadCommunitNewTableData:10];
        };
    }
    return _communitNewTableView;
}
- (void)reloadCommunitNewTableData:(NSInteger)start{
    NSDictionary* requestDic = @{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",
        @"client":@"1",
        @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
        @"limit":@"10",
        @"sort":@"addtime",
        @"start":[NSString stringWithFormat:@"%li",(long)start],
        @"version":@"3.0.6"};
    
    WS(weakSelf);
    [ZJPBaseHttpTool postWithPath:@"http://api2.pianke.me/group/posts_hotlist" params:requestDic success:^(id JSON) {
//        NSLog(@"%@",JSON);
        NSDictionary* returnDic = JSON;
        if ([returnDic[@"result"] integerValue] == 1) {
            weakSelf.CommunitNewModel = [[PKCommunitNewModel alloc] initWithDictionary:returnDic];
            weakSelf.communitNewTableView.cellNewArray = weakSelf.CommunitNewModel.data.list;
//            [weakSelf jisuan:weakSelf.communitNewTableView.cellNewArray];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.communitNewTableView reloadData];
            });
            [weakSelf.communitNewTableView.mj_footer endRefreshing];
            [weakSelf.communitNewTableView.mj_header endRefreshing];
        }
    } failure:^(NSError *error) {
        
    }];
}

//- (NSArray*)jisuan:(NSArray*)Array
//{
//    _muArray = [[NSMutableArray alloc] init];
//    
//    for (PKCommunitHotList *list in Array)
//    {
//        if ([list.coverimg isEmptyString])
//        {
//            
//        }
//    }
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
