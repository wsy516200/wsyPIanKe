//
//	PKCommunitHotModel.h
//
//	Create by c ma on 18/2/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>


@interface PKCommunitHotData : NSObject
@property (nonatomic, strong) NSArray * list;
@property (nonatomic, assign) NSInteger total;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end


@interface PKCommunitHotUserinfo : NSObject
@property (nonatomic, strong) NSString * icon;
@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, strong) NSString * uname;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

@interface PKCommunitHotCounterList : NSObject
@property (nonatomic, assign) NSInteger comment;
@property (nonatomic, assign) NSInteger like;
@property (nonatomic, assign) NSInteger view;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

@interface PKCommunitHotModel : NSObject
@property (nonatomic, strong) PKCommunitHotData * data;
@property (nonatomic, assign) NSInteger result;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

@interface PKCommunitHotList : NSObject
@property (nonatomic, assign) NSInteger addtime;
@property (nonatomic, strong) NSString * addtimeF;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * contentid;
@property (nonatomic, strong) PKCommunitHotCounterList * counterList;
@property (nonatomic, strong) NSString * coverimg;
@property (nonatomic, assign) BOOL ishot;
@property (nonatomic, assign) BOOL isrecommend;
@property (nonatomic, strong) NSString * songid;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) PKCommunitHotUserinfo * userinfo;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end


