//
//  PKLeftTableView.h
//  iOSPianKe
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PKLeftTableViewSelectRow <NSObject>

- (void)selectWhichRow:(NSInteger)row;

@end

@interface PKLeftTableView : UITableView

@property (weak, nonatomic) id<PKLeftTableViewSelectRow>RowDelegate;

@end
