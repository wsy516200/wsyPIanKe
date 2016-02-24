//
//	PKReadingModel.m
//
//	Create by c ma on 10/2/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKReadingModel.h"

@interface PKReadingModel ()
@end

@implementation PKReadingCarousel




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
@implementation PKReadingModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"data"] isKindOfClass:[NSNull class]]){
		self.data = [[PKReadingData alloc] initWithDictionary:dictionary[@"data"]];
	}

	if(![dictionary[@"result"] isKindOfClass:[NSNull class]]){
		self.result = [dictionary[@"result"] integerValue];
	}

	return self;
}
@end

@implementation PKReadingData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[@"carousel"] != nil && [dictionary[@"carousel"] isKindOfClass:[NSArray class]]){
        NSArray * carouselDictionaries = dictionary[@"carousel"];
        NSMutableArray * carouselItems = [NSMutableArray array];
        for(NSDictionary * carouselDictionary in carouselDictionaries){
            PKReadingCarousel * carouselItem = [[PKReadingCarousel alloc] initWithDictionary:carouselDictionary];
            [carouselItems addObject:carouselItem];
        }
        self.carousel = carouselItems;
    }
    if(dictionary[@"list"] != nil && [dictionary[@"list"] isKindOfClass:[NSArray class]]){
        NSArray * listDictionaries = dictionary[@"list"];
        NSMutableArray * listItems = [NSMutableArray array];
        for(NSDictionary * listDictionary in listDictionaries){
            PKReadingList * listItem = [[PKReadingList alloc] initWithDictionary:listDictionary];
            [listItems addObject:listItem];
        }
        self.list = listItems;
    }
    return self;
}
@end


@implementation PKReadingList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"coverimg"] isKindOfClass:[NSNull class]]){
        self.coverimg = dictionary[@"coverimg"];
    }
    if(![dictionary[@"enname"] isKindOfClass:[NSNull class]]){
        self.enname = dictionary[@"enname"];
    }
    if(![dictionary[@"name"] isKindOfClass:[NSNull class]]){
        self.name = dictionary[@"name"];
    }
    if(![dictionary[@"type"] isKindOfClass:[NSNull class]]){
        self.type = [dictionary[@"type"] integerValue];
    }
    
    return self;
}
@end