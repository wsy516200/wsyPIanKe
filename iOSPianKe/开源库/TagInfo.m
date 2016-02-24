//
//	TagInfo.m
//
//	Create by c ma on 20/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "TagInfo.h"

@interface TagInfo ()
@end
@implementation TagInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"count"] isKindOfClass:[NSNull class]]){
		self.count = [dictionary[@"count"] integerValue];
	}

	if(![dictionary[@"offical"] isKindOfClass:[NSNull class]]){
		self.offical = [dictionary[@"offical"] boolValue];
	}

	if(![dictionary[@"tag"] isKindOfClass:[NSNull class]]){
		self.tag = dictionary[@"tag"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"count"] = @(self.count);
	dictionary[@"offical"] = @(self.offical);
	if(self.tag != nil){
		dictionary[@"tag"] = self.tag;
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeObject:@(self.count) forKey:@"count"];	[aCoder encodeObject:@(self.offical) forKey:@"offical"];	if(self.tag != nil){
		[aCoder encodeObject:self.tag forKey:@"tag"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.count = [[aDecoder decodeObjectForKey:@"count"] integerValue];
	self.offical = [[aDecoder decodeObjectForKey:@"offical"] boolValue];
	self.tag = [aDecoder decodeObjectForKey:@"tag"];
	return self;

}
@end