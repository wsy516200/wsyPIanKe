//
//	PKProductModel.h
//
//	Create by c ma on 22/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface PKData : NSObject

@property (nonatomic, strong) NSArray * list;
@property (nonatomic, assign) NSInteger total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

@interface PKProductModel : NSObject

@property (nonatomic, strong) PKData * data;
@property (nonatomic, assign) NSInteger result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

@interface PKList : NSObject

@property (nonatomic, strong) NSString * buyurl;
@property (nonatomic, strong) NSString * contentid;
@property (nonatomic, strong) NSString * coverimg;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end


