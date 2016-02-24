//
//  PKLandingViewController.m
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import "PKLandingViewController.h"
#import "PKLeftMenuViewController.h"// 返回左侧菜单
#import "PKLoginViewController.h"// 前往注册界面
#import "PKThirdLandingView.h"// 第三方登陆View
#import "PKEmailLandingView.h"// 邮箱正常登陆View
#import "PKCoverLandingView.h"// 顶部View
@interface PKLandingViewController ()<UITextFieldDelegate>

@property (strong, nonatomic) PKThirdLandingView* pkThirdLandView;

@property (strong, nonatomic) PKEmailLandingView* emailLandingView;

@property (strong, nonatomic) PKCoverLandingView* coverLandingView;

@property (copy, nonatomic) NSString* imageFiled;

@end

@implementation PKLandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(251, 251, 251);
    WS(weakSelf);
    
    [self.view addSubview:self.pkThirdLandView];
    [_pkThirdLandView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        make.height.equalTo(105);
        
    }];
    [self.view addSubview:self.emailLandingView];
    [_emailLandingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.pkThirdLandView.mas_top).offset(-50);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(170);
    }];
    [self.view addSubview:self.coverLandingView];
    [_coverLandingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.bottom.equalTo(weakSelf.emailLandingView.mas_top);
    }];
}

- (PKThirdLandingView*)pkThirdLandView{
    if (!_pkThirdLandView) {
        _pkThirdLandView = [[PKThirdLandingView alloc] init];
    }
    return _pkThirdLandView;
}
- (PKEmailLandingView*)emailLandingView{
    if (!_emailLandingView) {
        _emailLandingView = [[PKEmailLandingView alloc] init];
        _emailLandingView.emailText.delegate = self;
        _emailLandingView.passwordText.delegate = self;
        [_emailLandingView.landingBtn addTarget:self action:@selector(loginHttpRequest) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _emailLandingView;
}
- (PKCoverLandingView*)coverLandingView{
    if (!_coverLandingView) {
        _coverLandingView = [[PKCoverLandingView alloc] init];
        [_coverLandingView.returnBtn addTarget:self action:@selector(returnAction) forControlEvents:(UIControlEventTouchUpInside)];
        [_coverLandingView.registeredBtn addTarget:self action:@selector(registerAction) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _coverLandingView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma makr - 当键盘弹出时保证输入框不被隐藏
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    WS(weakSelf);
    if (textField == _emailLandingView.emailText) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 50;
            weakSelf.view.bounds = rect;
        }];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 100;
            weakSelf.view.bounds = rect;
        }];
    }
    return YES;
}
#pragma mark - 点击空白回收键盘 输入框会到原来位置
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    
//    [_emailLandingView.emailText resignFirstResponder];
//    [_emailLandingView.passwordText resignFirstResponder];
    
    
    
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
}
#pragma makr - 当键盘消失后输入框会到原来的位置
//- (BOOL)textFieldShouldReturn:(UITextField *)textField{
//    [_emailLandingView.emailText resignFirstResponder];
//    [_emailLandingView.passwordText resignFirstResponder];
//}

- (void)loginHttpRequest{
    
    // 点击完成隐藏键盘
    [_emailLandingView.emailText resignFirstResponder];
    [_emailLandingView.passwordText resignFirstResponder];
    // 判断邮箱是否为空
    if ([_emailLandingView.emailText.text isEmptyString]) {
        [self.view makeToast:@"邮箱不能为空" duration:1 position:@"center"];
    }
     // 判断密码是否为空
    else if ([_emailLandingView.emailText.text isEmptyString]){
        [self.view makeToast:@"密码不能为空" duration:1 position:@"center"];
    }
    else{
        // 开始进行网络请求
        WS(weakSelf);
        [ZJPBaseHttpTool postWithPath:@"http://api2.pianke.me/user/login" params:[self makeLoginRequestDic] success:^(id JSON) {
             NSDictionary* returnDic = JSON;
            // 判断是否成功,   //判断是否成功，如果result为 1 ，注册成功，result为0，查看返回字典中data字段中msg的错误原因
            if ([returnDic[@"result"] integerValue] == 1) {
                [weakSelf.view makeToast:@"登陆成功" duration:1 position:@"center"];
                [self returnAction];
            }else{
                [weakSelf.view makeToast:[returnDic[@"data"] valueForKey:@"msg"] duration:1 position:@"center"];
            }
            
        } failure:^(NSError *error) {
           [weakSelf.view makeToast:@"登陆失败" duration:1 position:@"center"];
        }];
    }
}
// 制作参数
- (NSDictionary *)makeLoginRequestDic{
    NSDictionary *dic = @{@"client":@"1",
                          @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"email":_emailLandingView.emailText.text,
                          @"passwd":_emailLandingView.passwordText.text,
                          @"version":@"3.0.6",
                          @"auth":@"",
                          };
    return dic;
}

#pragma mark - 返回左侧菜单界面
- (void)returnAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)registerAction{
    PKLoginViewController* pkLogView = [[PKLoginViewController alloc]init];
    
    [self presentViewController:pkLogView animated:YES completion:nil];
}
@end
