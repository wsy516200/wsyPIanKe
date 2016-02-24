//
//	PKRadioTwoUserinfo.m
//
//	Create by c ma on 19/2/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKRadioTwoUserinfo.h"

@interface PKRadioTwoUserinfo ()
@end
@implementation PKRadioTwoUserinfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"icon"] isKindOfClass:[NSNull class]]){
		self.icon = dictionary[@"icon"];
	}	
	if(![dictionary[@"uid"] isKindOfClass:[NSNull class]]){
		self.uid = [dictionary[@"uid"] integerValue];
	}

	if(![dictionary[@"uname"] isKindOfClass:[NSNull class]]){
		self.uname = dictionary[@"uname"];
	}	
	return self;
}
@end