//
//  UIResponder+EasyEventHandler.m
//  EasyEventHandler
//
//  Created by zhaoyg on 2019/2/22.
//  Copyright © 2019 zhaoyg. All rights reserved.
//

#import "UIResponder+EasyEventHandler.h"
#import <objc/runtime.h>
static char *EventKey = "EventKey";


@implementation UIResponder (EasyEventHandler)


- (void)registerEvent:(NSString *)event withSelector:(SEL)selector {
    if (!event.length) {
        return;
    }
    NSDictionary *events = [self events];
    NSMutableDictionary *mdic = [NSMutableDictionary dictionaryWithDictionary:events];
    if ([mdic[event] length]) {
        return;
    }
    mdic[event] = NSStringFromSelector(selector);
    [self setEvents:mdic.copy];
}

- (void)setEvents:(NSDictionary *)events {
    
    objc_setAssociatedObject(self, &EventKey, events, OBJC_ASSOCIATION_COPY);
}

- (NSDictionary *)events {
    
    return objc_getAssociatedObject(self, &EventKey);
}


- (BOOL)canResponseWithEventName:(NSString *)event {
    NSDictionary *events = [self events];
    if ([events[event] length]) {
        return YES;
    }
    return NO;
}

// 判断当前responeder对象是否可以响应event事件
- (UIResponder *)isExistRespoderWithEventName:(NSString *)event {
    if ([self nextResponder] == nil) {
        return nil;
    }

    if ([[self nextResponder] canResponseWithEventName:event]) {
        return [self nextResponder];
    } else {
        return [[self nextResponder] isExistRespoderWithEventName:event];
    }
}


/**
 perform 一个event事件
 
 @param eventName 事件标识
 @param userInfo 传递事件的参数
 */
- (void)performEventWithName:(NSString *)eventName userInfo:(id)userInfo {
    if (!eventName) {
        return;
    }
    if ([self canResponseWithEventName:eventName]) {
         NSDictionary *events = [self events];
        if (![events[eventName] length]) return;
        
        SEL selector = NSSelectorFromString(events[eventName]);
        
        [self performSelector:selector withObject:userInfo];
        
    } else {
        [[self nextResponder] performEventWithName:eventName userInfo:userInfo];
    }
}


@end
