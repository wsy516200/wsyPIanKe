//
//  PKRadioViewController.m
//  iOSPianKe
//
//  Created by ma c on 16/1/19.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import "PKRadioViewController.h"
#import "PKRadioTableView.h"
#import "Masonry.h"
#import "PKRadioModel.h"
#import "MJRefresh.h"
#import "PKRadioTwoModel.h"
@interface PKRadioViewController ()

@property (strong, nonatomic) PKRadioTableView* radioTableView;

@property (strong, nonatomic) PKRadioModel* pkRadioModel;
@property (assign, nonatomic) NSInteger start;

@end

@implementation PKRadioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.radioTableView];
    [self reloadProdcutTableData:0 WithPath:@"http://api2.pianke.me/ting/radio" params:@{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",
                                                                                         @"client":@"1",
                                                                                         @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                                                                                         @"version":@"3.0.6"}];
    
    WS(weakSelf);
    [_radioTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(30);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
    }];
    weakSelf.start = 9;
    
}
- (void)returAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (PKRadioTableView*)radioTableView{
    if (!_radioTableView) {
        _radioTableView = [[PKRadioTableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:(UITableViewStyleGrouped)];
        WS(weakSelf);
        _radioTableView.loadMoreDataBlock = ^(){
            [weakSelf reloadProdcutTableData:weakSelf.start WithPath:@"http://api2.pianke.me/ting/radio_list" params:@{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",
                                                                                                          @"clien":@"1",
                                                                                                          @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                                                                                                          @"limit":@"9",
                                                                                                          @"start": [NSString stringWithFormat:@"%i", weakSelf.start],
                                                                                                          @"version":@"3.0.6",}];
        };
        _radioTableView.loadNewDataBlock = ^(){
            [weakSelf reloadProdcutTableData:0 WithPath:@"http://api2.pianke.me/ting/radio" params:@{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",
                                                                                                     @"client":@"1",
                                                                                                     @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                                                                                                     @"version":@"3.0.6"}];
        };
        
    }
    return _radioTableView;
}
- (void)reloadProdcutTableData:(NSInteger)start WithPath:(NSString *)path params:(NSDictionary *)params {
    
    WS(weakSelf);
    [ZJPBaseHttpTool postWithPath:path params:params success:^(id JSON) {
        NSDictionary* returnDic = JSON;
        if ([returnDic[@"result"] integerValue] == 1) {
            if ([path isEqualToString:@"http://api2.pianke.me/ting/radio"]) {
                weakSelf.pkRadioModel = [[PKRadioModel alloc] initWithDictionary:returnDic];
                weakSelf.radioTableView.RadioArray = [NSMutableArray array];
                [weakSelf.radioTableView.RadioArray addObjectsFromArray:weakSelf.
                 pkRadioModel.data.alllist];
                weakSelf.radioTableView.TwoArray = weakSelf.pkRadioModel.data.hotlist;
                weakSelf.radioTableView.PictureArray = weakSelf.pkRadioModel.data.carousel;
            } else {
                PKRadioTwoModel *RadioModel = [[PKRadioTwoModel alloc] initWithDictionary:returnDic];
                [weakSelf.radioTableView.RadioArray addObjectsFromArray:RadioModel.data.list];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.radioTableView reloadData];
            });
            if (start != 0) {
                weakSelf.start += 9;
            }
            [weakSelf.radioTableView.mj_footer endRefreshing];
            [weakSelf.radioTableView.mj_header endRefreshing];
        }
    }failure:^(NSError *error) {
        
    }];
    
    
}



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
