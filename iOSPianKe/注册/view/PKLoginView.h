//
//  PKLoginView.h
//  iOSPianKe
//
//  Created by ma c on 16/1/18.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKLoginView : UIView

@property (strong, nonatomic) UIButton* manBtn; // 选择男
@property (strong, nonatomic) UIButton* womanBtn; // 选择女
@property (strong, nonatomic) UIButton* delegateBtn; // 用户协议按钮

@property (strong, nonatomic) UIButton* finishBtn; // 完成按钮
@property (strong, nonatomic) UITextField* userNameText; // 昵称输入框
@property (strong, nonatomic) UITextField* emailText;  // 邮箱输入框
@property (strong, nonatomic) UITextField* passwordText; // 密码输入框
@end
