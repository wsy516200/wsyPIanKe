//
//  PKLoginViewController.m
//  iOSPianKe
//
//  Created by ma c on 16/1/18.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import "PKLoginViewController.h"
#import "PKLoginView.h"
@interface PKLoginViewController ()<UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (strong, nonatomic) PKLoginView* loginView;
@property (strong, nonatomic) UIButton* returnBtn;
@property (strong, nonatomic) UIButton* ImageBtn;

@property (copy, nonatomic) NSString* imageFiled;

@end

@implementation PKLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(251, 251, 251);
    [self.view addSubview:self.loginView];
    [self.view addSubview:self.returnBtn];
    [self.view addSubview:self.ImageBtn];
    [self addLayoutIn];
}
- (void)addLayoutIn{
    WS(weakSelf);
    
    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-35);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(320);
    }];
    [_returnBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.left.equalTo(weakSelf.view.mas_left);
        make.size.equalTo(CGSizeMake(50, 70));
    }];
    [_ImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.centerY.equalTo(weakSelf.view.mas_centerY).offset(-200);
        make.size.equalTo(CGSizeMake(60, 60));
    }];
}
- (PKLoginView*)loginView{
    if (!_loginView) {
        _loginView = [[PKLoginView alloc] init];
        _loginView.emailText.delegate = self;
        _loginView.userNameText.delegate = self;
        _loginView.passwordText.delegate = self;
        [_loginView.finishBtn addTarget:self action:@selector(loginHttpRequest) forControlEvents:(UIControlEventTouchUpInside)];
    };
    return _loginView;
    
}
- (UIButton*)returnBtn{
    if (!_returnBtn) {
        _returnBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_returnBtn setImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];
        [_returnBtn addTarget:self action:@selector(dimissView) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _returnBtn;
}
- (UIButton*)ImageBtn{
    if (!_ImageBtn) {
        _ImageBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_ImageBtn setImage:[UIImage imageNamed:@"上传头像" ]forState:(UIControlStateNormal)];
        [_ImageBtn addTarget:self action:@selector(imageBtnMethod) forControlEvents:(UIControlEventTouchUpInside)];
        _ImageBtn.layer.cornerRadius = 30;  // 将上传的头像变为圆
        _ImageBtn.layer.masksToBounds = YES;
        
    }
    return _ImageBtn;
}

#pragma mark - 判断注册内容是否为空＋网络请求

- (void)loginHttpRequest{
    //点击完成的时候隐藏键盘
    [self disMissKeyboard];
    //判断用户名是否为空，isEmptyString方法是NSString + helper中的
    if ([_loginView.userNameText.text isEmptyString]) {
        [self.view makeToast:@"用户名不能为空" duration:1 position:@"center"];
    }
    //判断密码是否为空，isEmptyString方法是NSString + helper中的
    else if ([_loginView.passwordText.text isEmptyString]){
        [self.view makeToast:@"密码不能为空" duration:1 position:@"center"];
    }
    //判断邮箱是否为空，isEmptyString方法是NSString + helper中的
    else if ([_loginView.emailText.text isEmptyString]){
        [self.view makeToast:@"邮箱不能为空" duration:1 position:@"center"];
    }
    //判断头像是否为空，isEmptyString方法是NSString + helper中的
    else if ([_ImageBtn.currentImage isEqual:[UIImage imageNamed:@"注册头像"]]){
        [self.view makeToast:@"头像不能为空" duration:1 position:@"center"];
    }
    else{
        //开始进行网络请求，上传头像到服务器
                WS(weakSelf);
        [JPRefreshView showJPRefreshFromView:self.view];
        [ZJPBaseHttpTool postImagePath:@"http://api2.pianke.me/user/reg" params:[self makeLoginRequestDic] image:_imageFiled success:^(id JSON) {
            NSDictionary *returnDic = JSON;
            //判断是否成功，如果result为 1 ，注册成功，result为0，查看返回字典中data字段中msg的错误原因
            [JPRefreshView removeJPRefreshFromView:self.view];
            if ([returnDic[@"result"] integerValue] == 1) {
                //成功后的提示框，方法在 UIView+Toast 中，第一个参数是提示的内容，第二个是显示时间，第三个是显示位置，一共有三个
                NSLog(@"%@",returnDic);
                [weakSelf.view makeToast:@"注册成功" duration:1 position:@"center"];
            }else{
                [weakSelf.view makeToast:[returnDic[@"data"] valueForKey:@"msg"] duration:1 position:@"center"];
            }
            
        } failure:^(NSError *error) {
            [JPRefreshView removeJPRefreshFromView:self.view];
            [weakSelf.view makeToast:@"注册失败" duration:1 position:@"center"];
            NSLog(@"error :%@" , error);
        }];
    }
}
//制作请求参数
- (NSDictionary *)makeLoginRequestDic{
    NSDictionary *dic = @{@"client":@"1",
                          @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"email":_loginView.emailText.text,
                          @"gender":@"1",
                          @"passwd":_loginView.passwordText.text,
                          @"uname":_loginView.userNameText.text,
                          @"version":@"3.0.6",
                          @"auth":@"",
                          @"iconfile":_imageFiled};
    return dic;
}
#pragma mark - 判断是从相册还是相机截获图片
- (void)imageBtnMethod{
    UIActionSheet * sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册中选择", nil];
//    sheet.destructiveButtonIndex = -1; //设置那一个显示红色文字提示
    [sheet showInView:self.view];
}
#pragma mark - UIActionSheetDelegate的代理方法,每一个buttonindex的点击事件
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        // 相机拍照
        UIImagePickerController* imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }else if (buttonIndex == 1){
        // 相册选择
        UIImagePickerController* imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}
#pragma makr - UIImagePickerControllerDelegate的代理方法,选择好照片后会调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    // 获得图片
    UIImage* editedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    // 获取沙盒目录
    NSString* homePath = [NSHomeDirectory() stringByAppendingString:@"/Documents"];
    // 将图片名字拼接到路径后面
    NSString* imageViews = [homePath stringByAppendingFormat:@"/%d.png", arc4random_uniform(1000000)];
    // 将图片写入沙盒
    [UIImageJPEGRepresentation(editedImage, 1.0f) writeToFile:imageViews atomically:YES];
    // 将图片路径保存下来,因为在上传图片的时候会用到
    self.imageFiled = imageViews;
    // 更新imageBtn的图片
    [_ImageBtn setImage:editedImage forState:(UIControlStateNormal)];
    // 关闭相册界面
    [picker dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - 点击空白回收键盘 输入框会到原来位置
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self disMissKeyboard];
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
}
#pragma mark - 返回登陆界面
- (void)dimissView{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma makr - 开始编辑的时候当屏幕上移，当键盘弹出时保证输入框不被遮挡
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    WS(weakSelf);
    if (textField == _loginView.userNameText) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 50;
            weakSelf.view.bounds = rect;
        }];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 150;
            weakSelf.view.bounds = rect;
        }];
    }
    return YES;
}
#pragma mark - 隐藏键盘的方法
- (void)disMissKeyboard{
    [_loginView.emailText resignFirstResponder];
    [_loginView.passwordText resignFirstResponder];
    [_loginView.userNameText resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
