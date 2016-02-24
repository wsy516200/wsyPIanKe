//
//	PKRadioModel.h
//
//	Create by c ma on 28/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>


@interface PKRadioData : NSObject
@property (nonatomic, strong) NSArray * alllist;
@property (nonatomic, strong) NSArray * carousel;
@property (nonatomic, strong) NSArray * hotlist;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

@interface PKUserinfo : NSObject
@property (nonatomic, strong) NSString * icon;
@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, strong) NSString * uname;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

@interface PKRadioModel : NSObject
@property (nonatomic, strong) PKRadioData * data;
@property (nonatomic, assign) NSInteger result;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

@interface PKAlllista : NSObject
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSString * coverimg;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, assign) BOOL isnew;
@property (nonatomic, strong) NSString * radioid;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) PKUserinfo * userinfo;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

@interface PKCarousela : NSObject
@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSString * url;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
