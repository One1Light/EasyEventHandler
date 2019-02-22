//
//  UITableView+ReuseCell.m
//  EasyEventHandler
//
//  Created by zhaoyg on 2019/2/22.
//  Copyright © 2019 zhaoyg. All rights reserved.
//

#import "UITableView+ReuseCell.h"

@implementation UITableView (ReuseCell)

-(UITableViewCell *)dequeueReusableCell:(Class)cls WithIdentifier:(NSString *)identifier {
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        if (![cls.self isKindOfClass:[UITableViewCell class]]) {
            NSLog(@"Class %@ is not a cell class!",NSStringFromClass(cls));
            return nil;
        }
        cell = [[cls alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

@end
