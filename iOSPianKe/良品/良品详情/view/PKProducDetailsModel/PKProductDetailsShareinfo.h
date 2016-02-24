//
//	PKProductDetailsShareinfo.h
//
//	Create by c ma on 21/2/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface PKProductDetailsShareinfo : NSObject

@property (nonatomic, strong) NSString * pic;
@property (nonatomic, strong) NSString * text;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * url;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end