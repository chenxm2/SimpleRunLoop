//
//  SimpleTimer.h
//  SimpleRunLoop
//
//  Created by xianmingchen on 16/5/31.
//  Copyright © 2016年 xianmingchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SimpleTimer : NSObject
+ (SimpleTimer *)scheduledTimerWithTimerInterval:(CGFloat)interal target:(id)target selector:(SEL)selector repeat:(BOOL)repeat;
@end
