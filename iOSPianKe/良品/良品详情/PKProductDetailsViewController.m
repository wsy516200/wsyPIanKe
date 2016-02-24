//
//  PKProductDetailsViewController.m
//  iOSPianKe
//
//  Created by ma c on 16/1/24.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import "PKProductDetailsViewController.h"
#import "PKProductDetailsScrollView.h"
#import "Masonry.h"
@interface PKProductDetailsViewController ()<UIWebViewDelegate>

@property (strong, nonatomic) PKProductDetailsScrollView* productDetailsScrollView;
@property (strong, nonatomic) UIWebView* productDetailsWebView;
@end

@implementation PKProductDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.productDetailsScrollView];
    WS(weakSelf);
    [_productDetailsScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(65);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
    }];
    
    
}
- (PKProductDetailsScrollView*)productDetailsScrollView{
    if (!_productDetailsScrollView) {
        _productDetailsScrollView = [[PKProductDetailsScrollView alloc] init];
    }
    return _productDetailsScrollView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
