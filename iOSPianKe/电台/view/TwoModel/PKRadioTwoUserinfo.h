//
//	PKRadioTwoUserinfo.h
//
//	Create by c ma on 19/2/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface PKRadioTwoUserinfo : NSObject

@property (nonatomic, strong) NSString * icon;
@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, strong) NSString * uname;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end