//
//	PKProductDetailsGroupInfo.h
//
//	Create by c ma on 21/2/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface PKProductDetailsGroupInfo : NSObject

@property (nonatomic, strong) NSString * groupid;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end