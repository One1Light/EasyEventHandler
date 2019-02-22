//
//  ViewController.m
//  EasyEventHandler
//
//  Created by zhaoyg on 2019/2/22.
//  Copyright © 2019 zhaoyg. All rights reserved.
//

#import "ViewController.h"
#import "EventExampleView.h"
#import "UIResponder+EasyEventHandler.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    EventExampleView *view = [[EventExampleView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    [self registerEvent:@"EventViewDidTap" withSelector:@selector(printHello:)];
}

- (void)printHello:(NSDictionary *)userinfo {
    NSLog(@"%@",userinfo[@"msg"]);
}


// 方法二 不需要注册，直接重写当前vc的perform方法，即可完成事件流传递

//- (void)performEventWithName:(NSString *)eventName userInfo:(id)userInfo {
//
//    if ([eventName isEqualToString:@"EventViewDidTap"]) {
//        NSLog(@"%@",userInfo[@"msg"]);
//    }
//}




@end
