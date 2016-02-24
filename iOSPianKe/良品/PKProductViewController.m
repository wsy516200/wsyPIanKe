//
//  PKProductViewController.m
//  iOSPianKe
//
//  Created by ma c on 16/1/19.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//



#import "PKProductDetailsViewController.h" // 良品详情
#import "ZJPNavigationController.h" // 导航
#import "PKProductViewController.h"
#import "PKProductTableView.h"
#import "PKProductModel.h"
#import "MJRefresh.h"
#import "PKProductViewCell.h"
@interface PKProductViewController ()

@property (strong, nonatomic) PKProductTableView* productTableView;
@property (strong, nonatomic) PKProductModel* pkProductModel;
@property (strong, nonatomic) PKProductDetailsViewController *ProductDetailsVC;

@end

@implementation PKProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.productTableView];
    [self addAutoLayout];
    [self reloadProdcutTableData:10];
    

}
- (void)addAutoLayout{
    WS(weakSelf);
    [_productTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}
- (PKProductTableView*)productTableView{
    if (!_productTableView) {
        _productTableView = [[PKProductTableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)  style:(UITableViewStylePlain)];
        
        WS(weakSelf);
        _productTableView.loadMoreDataBlock = ^(){
            [weakSelf reloadProdcutTableData:0];
        };
        _productTableView.loadNewDataBlock = ^(){
            [weakSelf reloadProdcutTableData:10];
        };
        _productTableView.myBlock = ^(PKProductViewCell* cell){
            if (weakSelf.ProductDetailsVC == nil) {
                weakSelf.ProductDetailsVC = [[PKProductDetailsViewController alloc] init];
            }
            [weakSelf presentViewController:weakSelf.ProductDetailsVC animated:YES completion:^{
                weakSelf.ProductDetailsVC.selectedCell = cell;
            }];
        };
    }
    return _productTableView;
}
- (void)reloadProdcutTableData:(NSInteger)start{
    
    NSDictionary* requestDic = @{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",
                                 @"client":@"1",
                                 @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                                 @"limit":@"10",
                                 @"start":[NSString stringWithFormat:@"%li",(long)start],
                                 @"version":@"3.0.6"};
    WS(weakSelf);
    [self POSTHttpRequest:@"http://api2.pianke.me/pub/shop"
                      dic:requestDic
             successBalck:^(id JSON) {
                 NSDictionary* returnDic = JSON;
        if ([returnDic[@"result"]integerValue] == 1) {
            weakSelf.pkProductModel = [[PKProductModel alloc] initWithDictionary:returnDic];
            weakSelf.productTableView.tableViewArray = weakSelf.pkProductModel.data.list;
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.productTableView reloadData];
            });
        }
                 [weakSelf.productTableView.mj_footer endRefreshing];
                 [weakSelf.productTableView.mj_header endRefreshing];
    } errorBlock:^(NSError *error) {
        
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
