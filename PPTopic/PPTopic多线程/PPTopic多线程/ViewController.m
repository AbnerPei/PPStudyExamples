//
//  ViewController.m
//  PPTopic多线程
//
//  Created by PPAbner on 2019/11/1.
//  Copyright © 2019 艾波er. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

//    [self sync_concurrent];
    
//    2019-11-07 15:08:25.659899+0800 PPTopic多线程[16722:12116147] 同步+并发 start <NSThread: 0x600002615ac0>{number = 1, name = main}
//    2019-11-07 15:08:27.660411+0800 PPTopic多线程[16722:12116147] s_c:任务1 线程：<NSThread: 0x600002615ac0>{number = 1, name = main}
//    2019-11-07 15:08:29.661139+0800 PPTopic多线程[16722:12116147] s_c:任务2 线程：<NSThread: 0x600002615ac0>{number = 1, name = main}
//    2019-11-07 15:08:31.662067+0800 PPTopic多线程[16722:12116147] s_c:任务3 线程：<NSThread: 0x600002615ac0>{number = 1, name = main}
//    2019-11-07 15:08:31.662236+0800 PPTopic多线程[16722:12116147] 同步+并发 end <NSThread: 0x600002615ac0>{number = 1, name = main}
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [self sync_concurrent];
//    });
    
//    2019-11-07 15:11:17.006178+0800 PPTopic多线程[17168:12123765] 同步+并发 start <NSThread: 0x6000013bb2c0>{number = 5, name = (null)}
//    2019-11-07 15:11:19.009777+0800 PPTopic多线程[17168:12123765] s_c:任务1 线程：<NSThread: 0x6000013bb2c0>{number = 5, name = (null)}
//    2019-11-07 15:11:21.011839+0800 PPTopic多线程[17168:12123765] s_c:任务2 线程：<NSThread: 0x6000013bb2c0>{number = 5, name = (null)}
//    2019-11-07 15:11:23.012142+0800 PPTopic多线程[17168:12123765] s_c:任务3 线程：<NSThread: 0x6000013bb2c0>{number = 5, name = (null)}
//    2019-11-07 15:11:23.012340+0800 PPTopic多线程[17168:12123765] 同步+并发 end <NSThread: 0x6000013bb2c0>{number = 5, name = (null)}
    
    
    //异步+并发
//    [self async_concurrent];
    
//    2019-11-07 15:19:05.681598+0800 PPTopic多线程[18176:12140599] 异步+并发 start <NSThread: 0x6000023a4300>{number = 1, name = main}
//    2019-11-07 15:19:05.681811+0800 PPTopic多线程[18176:12140599] 异步+并发 end <NSThread: 0x6000023a4300>{number = 1, name = main}
//    2019-11-07 15:19:07.686788+0800 PPTopic多线程[18176:12140690] a_c:任务3 线程：<NSThread: 0x6000023e13c0>{number = 5, name = (null)}
//    2019-11-07 15:19:07.686802+0800 PPTopic多线程[18176:12140689] a_c:任务1 线程：<NSThread: 0x6000023b01c0>{number = 3, name = (null)}
//    2019-11-07 15:19:07.686732+0800 PPTopic多线程[18176:12140692] a_c:任务2 线程：<NSThread: 0x6000023c5400>{number = 7, name = (null)}
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [self async_concurrent];
//    });
    
//    2019-11-07 15:20:17.945098+0800 PPTopic多线程[18332:12143207] 异步+并发 start <NSThread: 0x600002228d00>{number = 6, name = (null)}
//    2019-11-07 15:20:17.945273+0800 PPTopic多线程[18332:12143207] 异步+并发 end <NSThread: 0x600002228d00>{number = 6, name = (null)}
//    2019-11-07 15:20:19.948889+0800 PPTopic多线程[18332:12143206] a_c:任务3 线程：<NSThread: 0x600002207400>{number = 4, name = (null)}
//    2019-11-07 15:20:19.948889+0800 PPTopic多线程[18332:12143208] a_c:任务2 线程：<NSThread: 0x600002229280>{number = 7, name = (null)}
//    2019-11-07 15:20:19.948897+0800 PPTopic多线程[18332:12143204] a_c:任务1 线程：<NSThread: 0x60000221ca80>{number = 5, name = (null)}
    
    ///同步+串行
//    [self sync_serial];
    
//    2019-11-07 15:28:34.435097+0800 PPTopic多线程[19311:12159207] 同步+串行 start <NSThread: 0x600001dc61c0>{number = 1, name = main}
//    2019-11-07 15:28:36.437834+0800 PPTopic多线程[19311:12159207] s_s:任务1 线程：<NSThread: 0x600001dc61c0>{number = 1, name = main}
//    2019-11-07 15:28:38.438246+0800 PPTopic多线程[19311:12159207] s_s:任务2 线程：<NSThread: 0x600001dc61c0>{number = 1, name = main}
//    2019-11-07 15:28:40.439714+0800 PPTopic多线程[19311:12159207] s_s:任务3 线程：<NSThread: 0x600001dc61c0>{number = 1, name = main}
//    2019-11-07 15:28:40.440181+0800 PPTopic多线程[19311:12159207] 同步+串行 end <NSThread: 0x600001dc61c0>{number = 1, name = main}
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [self sync_serial];
//    });
    
//    2019-11-07 15:56:08.401294+0800 PPTopic多线程[22756:12214391] 同步+串行 start <NSThread: 0x6000032fb700>{number = 5, name = (null)}
//    2019-11-07 15:56:10.406457+0800 PPTopic多线程[22756:12214391] s_s:任务1 线程：<NSThread: 0x6000032fb700>{number = 5, name = (null)}
//    2019-11-07 15:56:12.411212+0800 PPTopic多线程[22756:12214391] s_s:任务2 线程：<NSThread: 0x6000032fb700>{number = 5, name = (null)}
//    2019-11-07 15:56:14.416321+0800 PPTopic多线程[22756:12214391] s_s:任务3 线程：<NSThread: 0x6000032fb700>{number = 5, name = (null)}
//    2019-11-07 15:56:14.416715+0800 PPTopic多线程[22756:12214391] 同步+串行 end <NSThread: 0x6000032fb700>{number = 5, name = (null)}
    
    ///异步+串行
//    [self async_serial];
    
//    2019-11-07 16:02:22.519784+0800 PPTopic多线程[23602:12227645] 异步+串行 start <NSThread: 0x600002dca140>{number = 1, name = main}
//    2019-11-07 16:02:22.519952+0800 PPTopic多线程[23602:12227645] 异步+串行 end <NSThread: 0x600002dca140>{number = 1, name = main}
//    2019-11-07 16:02:24.522856+0800 PPTopic多线程[23602:12227766] a_s:任务1 线程：<NSThread: 0x600002d968c0>{number = 5, name = (null)}
//    2019-11-07 16:02:26.527687+0800 PPTopic多线程[23602:12227766] a_s:任务2 线程：<NSThread: 0x600002d968c0>{number = 5, name = (null)}
//    2019-11-07 16:02:28.528581+0800 PPTopic多线程[23602:12227766] a_s:任务3 线程：<NSThread: 0x600002d968c0>{number = 5, name = (null)}
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self async_serial];
    });
    
//    2019-11-07 16:07:56.469152+0800 PPTopic多线程[24343:12238232] 异步+串行 start <NSThread: 0x600003c4c600>{number = 6, name = (null)}
//    2019-11-07 16:07:56.469301+0800 PPTopic多线程[24343:12238232] 异步+串行 end <NSThread: 0x600003c4c600>{number = 6, name = (null)}
//    2019-11-07 16:07:58.473314+0800 PPTopic多线程[24343:12238231] a_s:任务1 线程：<NSThread: 0x600003c4c000>{number = 5, name = (null)}
//    2019-11-07 16:08:00.477118+0800 PPTopic多线程[24343:12238231] a_s:任务2 线程：<NSThread: 0x600003c4c000>{number = 5, name = (null)}
//    2019-11-07 16:08:02.481108+0800 PPTopic多线程[24343:12238231] a_s:任务3 线程：<NSThread: 0x600003c4c000>{number = 5, name = (null)}
}


///同步+并发
- (void)sync_concurrent
{
    NSLog(@"同步+并发 start %@",[NSThread currentThread]);
    ///1.创建队列
    dispatch_queue_t cQueue = dispatch_queue_create("com.ppabner.pptopic.gcd.sync.concurrent", DISPATCH_QUEUE_CONCURRENT);
    ///2.往队列里添加任务
    dispatch_sync(cQueue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"s_c:任务1 线程：%@",[NSThread currentThread]);
    });
    
    dispatch_sync(cQueue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"s_c:任务2 线程：%@",[NSThread currentThread]);
    });
    
    dispatch_sync(cQueue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"s_c:任务3 线程：%@",[NSThread currentThread]);
    });
    
    NSLog(@"同步+并发 end %@",[NSThread currentThread]);
    
    ///结论：同步+并发，不开启新的线程，在当前线程依次（串行）执行任务。
    ///同步任务要等待队列中的任务执行完毕。
}

///异步+并发
- (void)async_concurrent
{
    NSLog(@"异步+并发 start %@",[NSThread currentThread]);
    ///1.创建队列
    dispatch_queue_t cQueue = dispatch_queue_create("com.ppabner.pptopic.gcd.async.concurrent", DISPATCH_QUEUE_CONCURRENT);
    ///2.往队列里添加任务
    dispatch_async(cQueue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"a_c:任务1 线程：%@",[NSThread currentThread]);
    });
    
    dispatch_async(cQueue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"a_c:任务2 线程：%@",[NSThread currentThread]);
    });
    
    dispatch_async(cQueue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"a_c:任务3 线程：%@",[NSThread currentThread]);
    });
    
    NSLog(@"异步+并发 end %@",[NSThread currentThread]);
    
    ///结论：异步+并发，当前线程不用等待，直接在新开启的线程中同时（并发）执行任务
}


///同步+串行
- (void)sync_serial
{
    NSLog(@"同步+串行 start %@",[NSThread currentThread]);
    ///1.创建队列
    dispatch_queue_t cQueue = dispatch_queue_create("com.ppabner.pptopic.gcd.sync.serial", DISPATCH_QUEUE_SERIAL);
    ///2.往队列里添加任务
    dispatch_sync(cQueue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"s_s:任务1 线程：%@",[NSThread currentThread]);
    });
    
    dispatch_sync(cQueue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"s_s:任务2 线程：%@",[NSThread currentThread]);
    });
    
    dispatch_sync(cQueue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"s_s:任务3 线程：%@",[NSThread currentThread]);
    });
    
    NSLog(@"同步+串行 end %@",[NSThread currentThread]);

    ///结论：所有任务都是在当前线程依次执行。
}

///异步+串行
- (void)async_serial
{
   NSLog(@"异步+串行 start %@",[NSThread currentThread]);
    ///1.创建队列
    dispatch_queue_t cQueue = dispatch_queue_create("com.ppabner.pptopic.gcd.sync.serial", DISPATCH_QUEUE_SERIAL);
    ///2.往队列里添加任务
    dispatch_async(cQueue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"a_s:任务1 线程：%@",[NSThread currentThread]);
    });
    
    dispatch_async(cQueue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"a_s:任务2 线程：%@",[NSThread currentThread]);
    });
    
    dispatch_async(cQueue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"a_s:任务3 线程：%@",[NSThread currentThread]);
    });
    
    NSLog(@"异步+串行 end %@",[NSThread currentThread]);
    
    ///结论：异步+串行，会开启新线程（只开启一条线程），任务依次执行。
}



@end
