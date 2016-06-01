//
//  SimpleRunLoop.h
//  SimpleRunLoop
//
//  Created by xianmingchen on 16/5/31.
//  Copyright © 2016年 xianmingchen. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SimpleTimer;
@interface SimpleRunLoop : NSObject

- (void)addTimer:(SimpleTimer *)timer;
- (void)runUntilDate:(NSDate *)limitDate;
@end
