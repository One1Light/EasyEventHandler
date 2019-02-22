//
//  UIResponder+EasyEventHandler.h
//  EasyEventHandler
//
//  Created by zhaoyg on 2019/2/22.
//  Copyright © 2019 zhaoyg. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (EasyEventHandler)


//注册event 和 selector
- (void)registerEvent:(NSString *)event withSelector:(SEL)selector;

/**
 perform 一个event事件

 @param eventName 事件标识
 @param userInfo 传递事件的参数
 */
- (void)performEventWithName:(NSString *)eventName userInfo:(id)userInfo;

@end

NS_ASSUME_NONNULL_END
