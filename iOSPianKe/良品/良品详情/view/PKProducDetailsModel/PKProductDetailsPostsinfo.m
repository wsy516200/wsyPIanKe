//
//	PKProductDetailsPostsinfo.m
//
//	Create by c ma on 21/2/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKProductDetailsPostsinfo.h"

@interface PKProductDetailsPostsinfo ()
@end
@implementation PKProductDetailsPostsinfo




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
	if(![dictionary[@"contentid"] isKindOfClass:[NSNull class]]){
		self.contentid = dictionary[@"contentid"];
	}	
	if(![dictionary[@"counterList"] isKindOfClass:[NSNull class]]){
		self.counterList = [[PKProductDetailsCounterList alloc] initWithDictionary:dictionary[@"counterList"]];
	}

	if(![dictionary[@"groupInfo"] isKindOfClass:[NSNull class]]){
		self.groupInfo = [[PKProductDetailsGroupInfo alloc] initWithDictionary:dictionary[@"groupInfo"]];
	}

	if(![dictionary[@"html"] isKindOfClass:[NSNull class]]){
		self.html = dictionary[@"html"];
	}	
	if(dictionary[@"imglist"] != nil && [dictionary[@"imglist"] isKindOfClass:[NSArray class]]){
		NSArray * imglistDictionaries = dictionary[@"imglist"];
		NSMutableArray * imglistItems = [NSMutableArray array];
		for(NSDictionary * imglistDictionary in imglistDictionaries){
			PKProductDetailsImglist * imglistItem = [[PKProductDetailsImglist alloc] initWithDictionary:imglistDictionary];
			[imglistItems addObject:imglistItem];
		}
		self.imglist = imglistItems;
	}
	if(![dictionary[@"isfav"] isKindOfClass:[NSNull class]]){
		self.isfav = [dictionary[@"isfav"] boolValue];
	}

	if(![dictionary[@"ishot"] isKindOfClass:[NSNull class]]){
		self.ishot = [dictionary[@"ishot"] boolValue];
	}

	if(![dictionary[@"islike"] isKindOfClass:[NSNull class]]){
		self.islike = [dictionary[@"islike"] boolValue];
	}

	if(![dictionary[@"isrecommend"] isKindOfClass:[NSNull class]]){
		self.isrecommend = [dictionary[@"isrecommend"] boolValue];
	}

	if(![dictionary[@"shareinfo"] isKindOfClass:[NSNull class]]){
		self.shareinfo = [[PKProductDetailsShareinfo alloc] initWithDictionary:dictionary[@"shareinfo"]];
	}

	if(![dictionary[@"songid"] isKindOfClass:[NSNull class]]){
		self.songid = dictionary[@"songid"];
	}	
	if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"title"];
	}	
	if(![dictionary[@"userinfo"] isKindOfClass:[NSNull class]]){
		self.userinfo = [[PKProductDetailsUserinfo alloc] initWithDictionary:dictionary[@"userinfo"]];
	}

	return self;
}
@end