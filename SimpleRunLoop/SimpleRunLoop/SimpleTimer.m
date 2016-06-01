//
//  SimpleTimer.m
//  SimpleRunLoop
//
//  Created by xianmingchen on 16/5/31.
//  Copyright © 2016年 xianmingchen. All rights reserved.
//

#import "SimpleTimer.h"
#import "SimpleTimerPrivate.h"


@implementation SimpleTimer

+ (SimpleTimer *)scheduledTimerWithTimerInterval:(CGFloat)interal target:(id)target selector:(SEL)selector repeat:(BOOL)repeat;
{
    SimpleTimer *timer = [[SimpleTimer alloc] init];
    timer.target = target;
    timer.action = selector;
    timer.interval = interal;
    timer.lasttime = CFAbsoluteTimeGetCurrent();
    timer.isRepeat = repeat;
    return timer;
}

- (void)invoke
{
    //remove the warning
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    if ([self.target respondsToSelector:self.action])
    {
        [self.target performSelector:self.action withObject:nil];
    }
#pragma clang diagnostic pop
}
@end
