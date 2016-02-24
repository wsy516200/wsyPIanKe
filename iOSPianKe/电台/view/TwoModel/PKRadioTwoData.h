//
//	PKRadioTwoData.h
//
//	Create by c ma on 19/2/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKRadioTwoList.h"

@interface PKRadioTwoData : NSObject

@property (nonatomic, strong) NSArray * list;
@property (nonatomic, assign) NSInteger total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end