//
//	PKProductDetailsShareinfo.m
//
//	Create by c ma on 21/2/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKProductDetailsShareinfo.h"

@interface PKProductDetailsShareinfo ()
@end
@implementation PKProductDetailsShareinfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"pic"] isKindOfClass:[NSNull class]]){
		self.pic = dictionary[@"pic"];
	}	
	if(![dictionary[@"text"] isKindOfClass:[NSNull class]]){
		self.text = dictionary[@"text"];
	}	
	if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"title"];
	}	
	if(![dictionary[@"url"] isKindOfClass:[NSNull class]]){
		self.url = dictionary[@"url"];
	}	
	return self;
}
@end