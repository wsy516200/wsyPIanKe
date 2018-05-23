//
//  PKBaseViewController.h
//  iOSPianKe
//
//  Created by 吴思远 on 16/1/14.
//  Copyright © 2016年 吴思远. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "AFNetworking.h"
#import "RESideMenu.h"
#import "UIImageView+SDWedImage.h"
#import "UIView+Toast.h"
#import "JPRefreshView.h"
#import "UIBarButtonItem+Helper.h"
#import "ZJPBaseHttpTool.h"
//  宏定义 Block参数
typedef void(^HttpSuccessBlock)(id JSON);
typedef void(^HttpErrorBlock)(NSError *error);

@interface PKBaseViewController : UIViewController
// 保留数据
@property (copy, nonatomic)             HttpSuccessBlock successBlock;
@property (copy, nonatomic)             HttpErrorBlock errorBlock;

// 网络请求GET方法
- (void)GETHttpRequest:(NSString *)url
                   dic:(NSDictionary *)dic
          successBalck:(HttpSuccessBlock)RequestSuccess
            errorBlock:(HttpErrorBlock)RequestError;
// 网络请求POST方法
- (void)POSTHttpRequest:(NSString *)url
                    dic:(NSDictionary *)dic
           successBalck:(HttpSuccessBlock)RequestSuccess
             errorBlock:(HttpErrorBlock)RequestError;

- (void)AddBackItemBtn;
@end
