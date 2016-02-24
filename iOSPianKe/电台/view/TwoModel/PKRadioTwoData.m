//
//	PKRadioTwoData.m
//
//	Create by c ma on 19/2/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKRadioTwoData.h"

@interface PKRadioTwoData ()
@end
@implementation PKRadioTwoData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[@"list"] != nil && [dictionary[@"list"] isKindOfClass:[NSArray class]]){
		NSArray * listDictionaries = dictionary[@"list"];
		NSMutableArray * listItems = [NSMutableArray array];
		for(NSDictionary * listDictionary in listDictionaries){
			PKRadioTwoList * listItem = [[PKRadioTwoList alloc] initWithDictionary:listDictionary];
			[listItems addObject:listItem];
		}
		self.list = listItems;
	}
	if(![dictionary[@"total"] isKindOfClass:[NSNull class]]){
		self.total = [dictionary[@"total"] integerValue];
	}

	return self;
}
@end