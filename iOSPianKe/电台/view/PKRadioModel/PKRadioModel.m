//
//	PKRadioModel.m
//
//	Create by c ma on 28/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKRadioModel.h"

@interface PKRadioModel ()
@end

@implementation PKUserinfo




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

@implementation PKRadioData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[@"alllist"] != nil && [dictionary[@"alllist"] isKindOfClass:[NSArray class]]){
        NSArray * alllistDictionaries = dictionary[@"alllist"];
        NSMutableArray * alllistItems = [NSMutableArray array];
        for(NSDictionary * alllistDictionary in alllistDictionaries){
            PKAlllista * alllistItem = [[PKAlllista alloc] initWithDictionary:alllistDictionary];
            [alllistItems addObject:alllistItem];
        }
        self.alllist = alllistItems;
    }
    if(dictionary[@"carousel"] != nil && [dictionary[@"carousel"] isKindOfClass:[NSArray class]]){
        NSArray * carouselDictionaries = dictionary[@"carousel"];
        NSMutableArray * carouselItems = [NSMutableArray array];
        for(NSDictionary * carouselDictionary in carouselDictionaries){
            PKCarousela * carouselItem = [[PKCarousela alloc] initWithDictionary:carouselDictionary];
            [carouselItems addObject:carouselItem];
        }
        self.carousel = carouselItems;
    }
    if(dictionary[@"hotlist"] != nil && [dictionary[@"hotlist"] isKindOfClass:[NSArray class]]){
        NSArray * hotlistDictionaries = dictionary[@"hotlist"];
        NSMutableArray * hotlistItems = [NSMutableArray array];
        for(NSDictionary * hotlistDictionary in hotlistDictionaries){
            PKAlllista * hotlistItem = [[PKAlllista alloc] initWithDictionary:hotlistDictionary];
            [hotlistItems addObject:hotlistItem];
        }
        self.hotlist = hotlistItems;
    }
    return self;
}
@end

@implementation PKRadioModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"data"] isKindOfClass:[NSNull class]]){
		self.data = [[PKRadioData alloc] initWithDictionary:dictionary[@"data"]];
	}

	if(![dictionary[@"result"] isKindOfClass:[NSNull class]]){
		self.result = [dictionary[@"result"] integerValue];
	}

	return self;
}
@end

@implementation PKAlllista




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
        self.userinfo = [[PKUserinfo alloc] initWithDictionary:dictionary[@"userinfo"]];
    }
    
    return self;
}
@end


@implementation PKCarousela




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"img"] isKindOfClass:[NSNull class]]){
        self.img = dictionary[@"img"];
    }
    if(![dictionary[@"url"] isKindOfClass:[NSNull class]]){
        self.url = dictionary[@"url"];
    }	
    return self;
}
@end