//
//	PKProductDetailsImglist.m
//
//	Create by c ma on 21/2/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKProductDetailsImglist.h"

@interface PKProductDetailsImglist ()
@end
@implementation PKProductDetailsImglist




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"imgurl"] isKindOfClass:[NSNull class]]){
		self.imgurl = dictionary[@"imgurl"];
	}	
	return self;
}
@end