//
//  PKLeftTableView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 我敢肯定. All rights reserved.
//

#import "PKLeftTableView.h"
#import "PKLeftTableViewCell.h"
@interface PKLeftTableView()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSArray* imageArrar;
@property (strong, nonatomic) NSArray* titleArray;

@end

@implementation PKLeftTableView
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.bounces = NO;
        self.imageArrar = @[@"首页",@"电台",@"阅读",@"社区",@"碎片",@"良品",@"设置"];
        self.titleArray = @[@"首页",@"电台",@"阅读",@"社区",@"碎片",@"良品",@"设置"];
        [self registerClass:[PKLeftTableViewCell class] forCellReuseIdentifier:@"cell"];
        self.separatorStyle = NO;
        self.backgroundColor = RGB(51, 51, 51);
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    PKLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.iconImage.image = [UIImage imageNamed:_imageArrar[indexPath.row]];
    cell.titleLabel.text = _titleArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_RowDelegate respondsToSelector:@selector(selectWhichRow:)]) {
        [_RowDelegate selectWhichRow:indexPath.row];
    }
}

@end
