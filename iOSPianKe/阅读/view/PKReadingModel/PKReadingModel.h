//
//	PKReadingModel.h
//
//	Create by c ma on 10/2/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface PKReadingCarousel : NSObject
@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSString * url;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

@interface PKReadingData : NSObject
@property (nonatomic, strong) NSArray * carousel;
@property (nonatomic, strong) NSArray * list;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

@interface PKReadingModel : NSObject
@property (nonatomic, strong) PKReadingData * data;
@property (nonatomic, assign) NSInteger result;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end



@interface PKReadingList : NSObject
@property (nonatomic, strong) NSString * coverimg;
@property (nonatomic, strong) NSString * enname;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger type;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end