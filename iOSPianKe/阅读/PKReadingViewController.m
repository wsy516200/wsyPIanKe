//
//  PKReadingViewController.m
//  iOSPianKe
//
//  Created by ma c on 16/1/19.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import "PKReadingViewController.h"
#import "PKReadingScrollView.h"
#import "Masonry.h"
#import "PKReadingModel.h"
#import "MJRefresh.h"
@interface PKReadingViewController ()

@property (strong, nonatomic) PKReadingScrollView* ReadingScrollView;
@property (strong, nonatomic) PKReadingModel* readingModel;


@end

@implementation PKReadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.ReadingScrollView];
    [self reloadReadingScrollViewData:0];
    WS(weakSelf);
    [_ReadingScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(70);
        make.left.equalTo(weakSelf.view.mas_left).offset(5);
        make.right.equalTo(weakSelf.view.mas_right).offset(-5);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
    }];
    
    
}
- (PKReadingScrollView*)ReadingScrollView{
    if (!_ReadingScrollView) {
        _ReadingScrollView = [[PKReadingScrollView alloc] init];
        WS(weakSelf);
        _ReadingScrollView.loadMoreDataBlock = ^(){
            [weakSelf reloadReadingScrollViewData:0];
        };
        _ReadingScrollView.loadNewDataBlock = ^(){
            [weakSelf reloadReadingScrollViewData:10];
        };

    }
    return _ReadingScrollView;
}
- (void)reloadReadingScrollViewData:(NSInteger)start{
    
    NSDictionary* requestDic = @{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",
                                 @"client":@"1",
                                 @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                                 @"version":@"3.0.6"};
    WS(weakSelf);
    [self POSTHttpRequest:@"http://api2.pianke.me/read/columns"
                      dic:requestDic
             successBalck:^(id JSON) {
                 NSDictionary* returnDic = JSON;
                 if ([returnDic[@"result"]integerValue] == 1) {
                     weakSelf.readingModel = [[PKReadingModel alloc] initWithDictionary:returnDic];
                     
                     
                     weakSelf.ReadingScrollView.readingArray = weakSelf.readingModel.data.carousel;
                     weakSelf.ReadingScrollView.imageArray = weakSelf.readingModel.data.list;
                     dispatch_async(dispatch_get_main_queue(), ^{
                         [weakSelf.ReadingScrollView reloadInputViews];
                     });
//                     [weakSelf.ReadingScrollView.mj_footer endRefreshing];
                     [weakSelf.ReadingScrollView.mj_header endRefreshing];
                 }
             } errorBlock:^(NSError *error) {
                 
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
