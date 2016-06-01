//
//  NSThread+SimpleRunLoop.m
//  SimpleRunLoop
//
//  Created by xianmingchen on 16/6/1.
//  Copyright © 2016年 xianmingchen. All rights reserved.
//

#import "NSThread+SimpleRunLoop.h"
#import <objc/runtime.h>

@implementation NSThread (SimpleRunLoop)
+ (SimpleRunLoop *)currentSimpleRunLoop;
{
    SimpleRunLoop *simpleRunLoop = nil;
    NSThread *currentThread = [NSThread currentThread];
    static const void *kSimpleHashKey = &kSimpleHashKey;
    simpleRunLoop = objc_getAssociatedObject(currentThread, kSimpleHashKey);
    
    if (!simpleRunLoop)
    {
        simpleRunLoop = [[SimpleRunLoop alloc] init];
        objc_setAssociatedObject(currentThread, kSimpleHashKey, simpleRunLoop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return simpleRunLoop;
}
@end
