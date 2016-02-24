//
//	PKCommunitNewModel.m
//
//	Create by c ma on 21/2/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKCommunitNewModel.h"

@interface PKCommunitNewModel ()
@end
@implementation PKCommunitNewModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"data"] isKindOfClass:[NSNull class]]){
		self.data = [[PKCommunitNewData alloc] initWithDictionary:dictionary[@"data"]];
	}

	if(![dictionary[@"result"] isKindOfClass:[NSNull class]]){
		self.result = [dictionary[@"result"] integerValue];
	}

	return self;
}
@end
@implementation PKCommunitNewData




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
            PKCommunitNewList * listItem = [[PKCommunitNewList alloc] initWithDictionary:listDictionary];
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
@implementation PKCommunitNewUserinfo




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


@implementation PKCommunitNewList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"addtime"] isKindOfClass:[NSNull class]]){
        self.addtime = [dictionary[@"addtime"] integerValue];
    }
    
    if(![dictionary[@"addtime_f"] isKindOfClass:[NSNull class]]){
        self.addtimeF = dictionary[@"addtime_f"];
    }
    if(![dictionary[@"content"] isKindOfClass:[NSNull class]]){
        self.content = dictionary[@"content"];
    }
    if(![dictionary[@"contentid"] isKindOfClass:[NSNull class]]){
        self.contentid = dictionary[@"contentid"];
    }
    if(![dictionary[@"counterList"] isKindOfClass:[NSNull class]]){
        self.counterList = [[PKCommunitNewCounterList alloc] initWithDictionary:dictionary[@"counterList"]];
    }
    
    if(![dictionary[@"coverimg"] isKindOfClass:[NSNull class]]){
        self.coverimg = dictionary[@"coverimg"];
    }
    if(![dictionary[@"ishot"] isKindOfClass:[NSNull class]]){
        self.ishot = [dictionary[@"ishot"] boolValue];
    }
    
    if(![dictionary[@"isrecommend"] isKindOfClass:[NSNull class]]){
        self.isrecommend = [dictionary[@"isrecommend"] boolValue];
    }
    
    if(![dictionary[@"songid"] isKindOfClass:[NSNull class]]){
        self.songid = dictionary[@"songid"];
    }
    if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
        self.title = dictionary[@"title"];
    }
    if(![dictionary[@"userinfo"] isKindOfClass:[NSNull class]]){
        self.userinfo = [[PKCommunitNewUserinfo alloc] initWithDictionary:dictionary[@"userinfo"]];
    }
    
    return self;
}
@end


@implementation PKCommunitNewCounterList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"comment"] isKindOfClass:[NSNull class]]){
        self.comment = [dictionary[@"comment"] integerValue];
    }
    
    if(![dictionary[@"like"] isKindOfClass:[NSNull class]]){
        self.like = [dictionary[@"like"] integerValue];
    }
    
    if(![dictionary[@"view"] isKindOfClass:[NSNull class]]){
        self.view = [dictionary[@"view"] integerValue];
    }
    
    return self;
}
@end
