//
//	CounterList.h
//
//	Create by c ma on 20/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface CounterList : NSObject

@property (nonatomic, assign) NSInteger comment;
@property (nonatomic, assign) NSInteger like;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end

@interface Data : NSObject

@property (nonatomic, strong) NSArray * list;
@property (nonatomic, strong) NSObject * tagOffical;
@property (nonatomic, assign) NSInteger total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end


@interface jsonModel : NSObject

@property (nonatomic, strong) Data * data;
@property (nonatomic, assign) NSInteger result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end


@interface List : NSObject

@property (nonatomic, assign) NSInteger addtime;
@property (nonatomic, strong) NSString * addtimeF;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * contentid;
@property (nonatomic, strong) CounterList * counterList;
@property (nonatomic, strong) NSString * coverimg;
@property (nonatomic, strong) NSString * coverimgWh;
@property (nonatomic, assign) BOOL islike;
@property (nonatomic, strong) NSString * songid;
@property (nonatomic, strong) TagInfo * tagInfo;
@property (nonatomic, strong) Userinfo * userinfo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end



@interface TagInfo : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) BOOL offical;
@property (nonatomic, strong) NSString * tag;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end


@interface Userinfo : NSObject

@property (nonatomic, strong) NSString * icon;
@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, strong) NSString * uname;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end



