//
//  PKLeftMenuViewController.m
//  iOSPianKe
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import "PKLeftMenuViewController.h"
#import "PKLeftHeadView.h"  // 头部view
#import "PKLeftTableView.h" // 列表选项
#import "PKLeftMusicView.h" // 底部音乐播放器
#import "ZJPNavigationController.h" // 导航
#import "PKLandingViewController.h" // 登陆界面
#import "PKHomeViewController.h"     // 跳转首页
#import "PKRadioViewController.h"    // 跳转电台
#import "PKReadingViewController.h"  // 跳转阅读
#import "PKCommunityViewController.h"// 跳转社区
#import "PKDebrisViewController.h"   // 跳转碎片
#import "PKProductViewController.h"  // 跳转良品
#import "PKSettingViewController.h"  // 跳转设置

@interface PKLeftMenuViewController ()<PKLeftTableViewSelectRow>

@property (strong, nonatomic) PKLeftHeadView* leftheadView;

@property (strong, nonatomic) PKLeftTableView* leftTabView;

@property (strong, nonatomic) PKLeftMusicView* leftMusicView;

@end

@implementation PKLeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBAlpha(51, 51, 51, 0.75);
    [self.view addSubview:self.leftheadView];
    
    WS(weakSelf);
    [_leftheadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.height.equalTo(190);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right).offset(-45);
    }];
    
    [self.view addSubview:self.leftTabView];
    [_leftTabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.leftheadView.mas_bottom);
        make.right.equalTo(weakSelf.view.mas_right);
        make.left.equalTo(weakSelf.view.mas_left);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-60);
    }];
    [self.view addSubview:self.leftMusicView];
    [_leftMusicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.view.mas_left);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-45);
        make.bottom.mas_equalTo(weakSelf.view.mas_bottom);
        make.height.mas_equalTo(@60);
    }];
}
// 侧边顶部信息view
- (PKLeftHeadView*)leftheadView{
    if (!_leftheadView) {
        _leftheadView = [[PKLeftHeadView alloc] init];
    }
    return _leftheadView;
}

//中间切换试图的列表
- (PKLeftTableView *)leftTabView{
    if (!_leftTabView) {
        _leftTabView = [[PKLeftTableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:(UITableViewStylePlain)];
        [_leftheadView.iconImageBtn addTarget:self action:@selector(pushToLandingViewController) forControlEvents:(UIControlEventTouchUpInside)];
        [_leftheadView.userNameBtn addTarget:self action:@selector(pushToLandingViewController) forControlEvents:(UIControlEventTouchUpInside)];
        _leftTabView.RowDelegate = self;
    }
    return _leftTabView;
}

- (PKLeftMusicView*)leftMusicView{
    if (!_leftMusicView) {
        _leftMusicView = [[PKLeftMusicView alloc] init];
    }
    return _leftMusicView;
}
#pragma mark - PKLeftTableViewRow代理方法
- (void)selectWhichRow:(NSInteger)row{
    switch (row) {
        case 0:
        {
            PKHomeViewController* HomeView = [[PKHomeViewController alloc] init];
//            HomeView.title = @"首页";
//            ZJPNavigationController* homeNavRootVC = [[ZJPNavigationController alloc] initWithRootViewController:HomeView];
            [self.sideMenuViewController setContentViewController:HomeView animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
        break;
        case 1:
        {
            PKRadioViewController* RadioView = [[PKRadioViewController alloc] init];
            RadioView.title = @"电台";
            ZJPNavigationController* radioNavRootVC = [[ZJPNavigationController alloc] initWithRootViewController:RadioView];
            [self.sideMenuViewController setContentViewController:radioNavRootVC animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 2:
        {
            PKReadingViewController* readingView = [[PKReadingViewController alloc] init];
            readingView.title = @"阅读";
            ZJPNavigationController* readingNavRootVC = [[ZJPNavigationController alloc] initWithRootViewController:readingView];
            [self.sideMenuViewController setContentViewController:readingNavRootVC animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 3:
        {
            PKCommunityViewController* communityView = [[PKCommunityViewController alloc] init];
            communityView.title = @"社区";
            ZJPNavigationController* communityNavRootVC = [[ZJPNavigationController alloc] initWithRootViewController:communityView];
            [self.sideMenuViewController setContentViewController:communityNavRootVC animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 4:
        {
            PKDebrisViewController* debrisView = [[PKDebrisViewController alloc] init];
            debrisView.title = @"碎片";
            ZJPNavigationController* debrisNavRootVC = [[ZJPNavigationController alloc] initWithRootViewController:debrisView];
            [self.sideMenuViewController setContentViewController:debrisNavRootVC animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 5:
        {
            PKProductViewController* productView = [[PKProductViewController alloc] init];
            productView.title = @"良品";
            ZJPNavigationController* productNavRootVC = [[ZJPNavigationController alloc] initWithRootViewController:productView];
            [self.sideMenuViewController setContentViewController:productNavRootVC animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 6:
        {
            PKSettingViewController* settingView = [[PKSettingViewController alloc] init];
            settingView.title = @"设置";
            ZJPNavigationController* settingNavRootVC = [[ZJPNavigationController alloc] initWithRootViewController:settingView];
            [self.sideMenuViewController setContentViewController:settingNavRootVC animated:YES];
            [settingNavRootVC.sideMenuViewController hideMenuViewController];
        }
            break;
            
        default:
            break;
    }
}
#pragma mark - 点击跳转登陆界面
- (void)pushToLandingViewController{
    PKLandingViewController* landing = [[PKLandingViewController alloc] init];
    [self presentViewController:landing animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end





