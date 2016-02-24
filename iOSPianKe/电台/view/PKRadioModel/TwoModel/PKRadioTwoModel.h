//
//	PKRadioTwoModel.h
//
//	Create by c ma on 19/2/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKRadioTwoData.h"

@interface PKRadioTwoModel : NSObject

@property (nonatomic, strong) PKRadioTwoData * data;
@property (nonatomic, assign) NSInteger result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end