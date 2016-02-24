//
//	PKRadioTwoList.h
//
//	Create by c ma on 19/2/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKRadioTwoUserinfo.h"

@interface PKRadioTwoList : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSString * coverimg;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, assign) BOOL isnew;
@property (nonatomic, strong) NSString * radioid;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) PKRadioTwoUserinfo * userinfo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end