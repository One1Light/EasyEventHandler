//
//  EventExampleView.m
//  EasyEventHandler
//
//  Created by zhaoyg on 2019/2/22.
//  Copyright © 2019 zhaoyg. All rights reserved.
//

#import "EventExampleView.h"
#import "UIResponder+EasyEventHandler.h"

@implementation EventExampleView

- (instancetype)initWithFrame:(CGRect)frame  {
    if (self = [super initWithFrame:frame]) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)tapAction {
    
    [self performEventWithName:@"EventViewDidTap" userInfo:@{@"msg":@"hello world"}];
}


@end
