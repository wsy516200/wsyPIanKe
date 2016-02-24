//
//	PKProductDetailsData.m
//
//	Create by c ma on 21/2/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKProductDetailsData.h"

@interface PKProductDetailsData ()
@end
@implementation PKProductDetailsData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[@"commentlist"] != nil && [dictionary[@"commentlist"] isKindOfClass:[NSArray class]]){
		NSArray * commentlistDictionaries = dictionary[@"commentlist"];
		NSMutableArray * commentlistItems = [NSMutableArray array];
		for(NSDictionary * commentlistDictionary in commentlistDictionaries){
			PKProductDetailsCommentlist * commentlistItem = [[PKProductDetailsCommentlist alloc] initWithDictionary:commentlistDictionary];
			[commentlistItems addObject:commentlistItem];
		}
		self.commentlist = commentlistItems;
	}
	if(![dictionary[@"commenttotal"] isKindOfClass:[NSNull class]]){
		self.commenttotal = [dictionary[@"commenttotal"] integerValue];
	}

	if(![dictionary[@"is_member"] isKindOfClass:[NSNull class]]){
		self.isMember = [dictionary[@"is_member"] integerValue];
	}

	if(![dictionary[@"postsinfo"] isKindOfClass:[NSNull class]]){
		self.postsinfo = [[PKProductDetailsPostsinfo alloc] initWithDictionary:dictionary[@"postsinfo"]];
	}

	return self;
}
@end