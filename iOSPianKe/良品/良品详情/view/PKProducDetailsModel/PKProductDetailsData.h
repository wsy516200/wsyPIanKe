//
//	PKProductDetailsData.h
//
//	Create by c ma on 21/2/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKProductDetailsCommentlist.h"
#import "PKProductDetailsPostsinfo.h"

@interface PKProductDetailsData : NSObject

@property (nonatomic, strong) NSArray * commentlist;
@property (nonatomic, assign) NSInteger commenttotal;
@property (nonatomic, assign) NSInteger isMember;
@property (nonatomic, strong) PKProductDetailsPostsinfo * postsinfo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end