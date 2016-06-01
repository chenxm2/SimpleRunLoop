//
//  SimpleRunLoop.m
//  SimpleRunLoop
//
//  Created by xianmingchen on 16/5/31.
//  Copyright © 2016年 xianmingchen. All rights reserved.
//

#import "SimpleRunLoop.h"
#import "SimpleTimerPrivate.h"

@interface SimpleRunLoop ()
{
    NSMutableArray<SimpleTimer *> *_timerQueue;
}
@end

@implementation SimpleRunLoop

- (id)init
{
    self = [super init];
    
    if (self)
    {
        _timerQueue = [NSMutableArray<SimpleTimer *> array];
    }
    return self;
}

- (void)runUntilDate:(NSDate *)limitDate
{
    BOOL finish = NO;
    while (!finish)
    {
        usleep(2 * 1000); //tow second
        [self executeOnce];
        NSDate *date = [NSDate date];
        if ([date compare:limitDate] == NSOrderedDescending)
        {
            finish = YES;
        }
    }
}

- (void)addTimer:(SimpleTimer *)timer
{
    [_timerQueue addObject:timer];
}

- (void)executeOnce
{
    CFAbsoluteTime currentTime = CFAbsoluteTimeGetCurrent();
    NSMutableArray<SimpleTimer *> *tempToDeleteArray = [NSMutableArray<SimpleTimer *> array];
    NSMutableArray<SimpleTimer *> *enumArray = [_timerQueue copy];
    for (SimpleTimer *timer in enumArray)
    {
        if (currentTime - timer.lasttime >= timer.interval)
        {
            if (timer.isRepeat)
            {
                timer.lasttime = currentTime;
            }
            else
            {
                [tempToDeleteArray addObject:timer];
            }
            [timer invoke];
        }
    }
    
    [_timerQueue removeObjectsInArray:tempToDeleteArray];
}
@end
