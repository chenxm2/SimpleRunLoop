//
//  ViewController.m
//  SimpleRunLoop
//
//  Created by xianmingchen on 16/5/31.
//  Copyright © 2016年 xianmingchen. All rights reserved.
//

#import "ViewController.h"
#import "NSThread+SimpleRunLoop.h"
#import "SimpleTimer.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"viewDidLoad begin");
    
    //create a input source
    SimpleTimer *timer = [SimpleTimer scheduledTimerWithTimerInterval:2 target:self selector:@selector(timerFire:) repeat:YES];
    
    //add input source to RunLoop
    SimpleRunLoop *simpleRunLoop = [NSThread currentSimpleRunLoop];
    [simpleRunLoop addTimer:timer];
    
    //begin the runloop
    [simpleRunLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]]; //run 10 second
    
    NSLog(@"viewDidLoad end");
}

- (void)timerFire:(NSTimer *)timer
{
    NSLog(@"timerFire begin");
    NSLog(@"timerFire end");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
