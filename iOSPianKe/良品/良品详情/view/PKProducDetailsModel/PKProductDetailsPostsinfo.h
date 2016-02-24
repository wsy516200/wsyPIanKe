//
//	PKProductDetailsPostsinfo.h
//
//	Create by c ma on 21/2/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKProductDetailsCounterList.h"
#import "PKProductDetailsGroupInfo.h"
#import "PKProductDetailsImglist.h"
#import "PKProductDetailsShareinfo.h"
#import "PKProductDetailsUserinfo.h"

@interface PKProductDetailsPostsinfo : NSObject

@property (nonatomic, assign) NSInteger addtime;
@property (nonatomic, strong) NSString * addtimeF;
@property (nonatomic, strong) NSString * contentid;
@property (nonatomic, strong) PKProductDetailsCounterList * counterList;
@property (nonatomic, strong) PKProductDetailsGroupInfo * groupInfo;
@property (nonatomic, strong) NSString * html;
@property (nonatomic, strong) NSArray * imglist;
@property (nonatomic, assign) BOOL isfav;
@property (nonatomic, assign) BOOL ishot;
@property (nonatomic, assign) BOOL islike;
@property (nonatomic, assign) BOOL isrecommend;
@property (nonatomic, strong) PKProductDetailsShareinfo * shareinfo;
@property (nonatomic, strong) NSString * songid;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) PKProductDetailsUserinfo * userinfo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end