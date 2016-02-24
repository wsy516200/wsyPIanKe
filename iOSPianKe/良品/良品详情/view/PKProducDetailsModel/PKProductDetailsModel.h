//
//	PKProductDetailsModel.h
//
//	Create by c ma on 21/2/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKProductDetailsData.h"

@interface PKProductDetailsModel : NSObject

@property (nonatomic, strong) PKProductDetailsData * data;
@property (nonatomic, assign) NSInteger result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end