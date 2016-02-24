//
//	PKRadioTwoModel.m
//
//	Create by c ma on 19/2/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKRadioTwoModel.h"

@interface PKRadioTwoModel ()
@end
@implementation PKRadioTwoModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"data"] isKindOfClass:[NSNull class]]){
		self.data = [[PKRadioTwoData alloc] initWithDictionary:dictionary[@"data"]];
	}

	if(![dictionary[@"result"] isKindOfClass:[NSNull class]]){
		self.result = [dictionary[@"result"] integerValue];
	}

	return self;
}
@end