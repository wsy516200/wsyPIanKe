//
//	PKProductModel.m
//
//	Create by c ma on 22/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKProductModel.h"

@interface PKProductModel ()
@end
@implementation PKProductModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"data"] isKindOfClass:[NSNull class]]){
		self.data = [[PKData alloc] initWithDictionary:dictionary[@"data"]];
	}

	if(![dictionary[@"result"] isKindOfClass:[NSNull class]]){
		self.result = [dictionary[@"result"] integerValue];
	}

	return self;
}
@end




@implementation PKData




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
            PKList * listItem = [[PKList alloc] initWithDictionary:listDictionary];
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


@implementation PKList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"buyurl"] isKindOfClass:[NSNull class]]){
        self.buyurl = dictionary[@"buyurl"];
    }
    if(![dictionary[@"contentid"] isKindOfClass:[NSNull class]]){
        self.contentid = dictionary[@"contentid"];
    }
    if(![dictionary[@"coverimg"] isKindOfClass:[NSNull class]]){
        self.coverimg = dictionary[@"coverimg"];
    }
    if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
        self.title = dictionary[@"title"];
    }	
    return self;
}
@end

