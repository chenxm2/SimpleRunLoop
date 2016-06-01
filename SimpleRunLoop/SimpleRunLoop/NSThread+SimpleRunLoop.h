//
//  NSThread+SimpleRunLoop.h
//  SimpleRunLoop
//
//  Created by xianmingchen on 16/6/1.
//  Copyright © 2016年 xianmingchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimpleRunLoop.h"
@interface NSThread (SimpleRunLoop)
+ (SimpleRunLoop *)currentSimpleRunLoop;
@end
