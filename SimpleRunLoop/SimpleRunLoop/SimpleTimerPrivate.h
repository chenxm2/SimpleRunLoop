//
//  SimpleTimerPrivate.h
//  SimpleRunLoop
//
//  Created by xianmingchen on 16/6/1.
//  Copyright © 2016年 xianmingchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimpleTimer.h"
@interface SimpleTimer ()
@property (nonatomic, strong) id target;
@property (nonatomic, assign) SEL action;
@property (nonatomic, assign) CFAbsoluteTime lasttime;
@property (nonatomic, assign) CGFloat interval;
@property (nonatomic, assign) BOOL isRepeat;
- (void)invoke;
@end

