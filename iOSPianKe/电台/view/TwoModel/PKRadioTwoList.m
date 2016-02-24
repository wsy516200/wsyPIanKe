//
//	PKRadioTwoList.m
//
//	Create by c ma on 19/2/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKRadioTwoList.h"

@interface PKRadioTwoList ()
@end
@implementation PKRadioTwoList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"count"] isKindOfClass:[NSNull class]]){
		self.count = [dictionary[@"count"] integerValue];
	}

	if(![dictionary[@"coverimg"] isKindOfClass:[NSNull class]]){
		self.coverimg = dictionary[@"coverimg"];
	}	
	if(![dictionary[@"desc"] isKindOfClass:[NSNull class]]){
		self.desc = dictionary[@"desc"];
	}	
	if(![dictionary[@"isnew"] isKindOfClass:[NSNull class]]){
		self.isnew = [dictionary[@"isnew"] boolValue];
	}

	if(![dictionary[@"radioid"] isKindOfClass:[NSNull class]]){
		self.radioid = dictionary[@"radioid"];
	}	
	if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"title"];
	}	
	if(![dictionary[@"userinfo"] isKindOfClass:[NSNull class]]){
		self.userinfo = [[PKRadioTwoUserinfo alloc] initWithDictionary:dictionary[@"userinfo"]];
	}

	return self;
}
@end