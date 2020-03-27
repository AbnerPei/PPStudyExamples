//
//  ViewController.m
//  IQA-多线程
//
//  Created by PPAbner on 2020/3/11.
//  Copyright © 2020 艾波er. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    for (int i = 0; i < 100; i ++) {
//        NSLog(@"\n\n");
//        NSLog(@"第%d次",i);
//        [self test6];
//    }
    
    [self test7];


}

- (void)test7
{
    NSLog(@"1");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    });
    NSLog(@"3");
}

- (void)test6
{
    dispatch_queue_t queue_t = dispatch_queue_create("com.ppabner", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue_t, ^{
        NSLog(@"1");
    });
    
    dispatch_async(queue_t, ^{
        NSLog(@"2");
    });
    
    dispatch_sync(queue_t, ^{
        NSLog(@"3");
    });
    
    NSLog(@"4");
    
    dispatch_async(queue_t, ^{
        NSLog(@"5");
    });
    
    dispatch_async(queue_t, ^{
        NSLog(@"6");
    });
    
    dispatch_async(queue_t, ^{
        NSLog(@"7");
    });
    
    ///1234567 [3]
    ///3124567 [3]
    ///3124576 [8]
    ///2314567
    ///3142576     这个出乎我意料
    ///1324576
    ///1324675
    ///3214567
    ///1324567
}

- (void)test5
{
    dispatch_queue_t queue_t = dispatch_queue_create("com.ppabner", DISPATCH_QUEUE_SERIAL);
    NSLog(@"1");
    dispatch_async(queue_t, ^{
        NSLog(@"2");
        dispatch_sync(queue_t, ^{
            NSLog(@"3");
        });
        NSLog(@"4");
    });
    NSLog(@"5");
    
    ///1 2 5   崩溃
    ///1 5 2   崩溃
}

- (void)test4
{
    dispatch_queue_t queue_t = dispatch_queue_create("com.ppabner", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"1");
    dispatch_async(queue_t, ^{
        NSLog(@"2");
        dispatch_sync(queue_t, ^{
            NSLog(@"3");
        });
        NSLog(@"4");
    });
    NSLog(@"5");
    
    ///iOS 13.2 iPhone 11 Pro Max
    ///1 2 3 4 5 [8]
    ///1 5 2 3 4 [8]
    ///1 2 5 3 4 [4]
 
}

- (void)test3
{
    dispatch_queue_t queue_t = dispatch_queue_create("com.ppabner", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"1");
    dispatch_async(queue_t, ^{
        NSLog(@"2");
        dispatch_async(queue_t, ^{
            NSLog(@"3");
        });
        NSLog(@"4");
    });
    NSLog(@"5");
    
    ///iOS 13.2 iPhone 11 Pro Max
    ///1 2 4 3 5 [2]
    ///1 2 3 4 5 [3]
    ///1 2 4 3 5 [5]
    ///1 5 2 4 3 [7]
    ///1 2 5 4 3 [3]
 
}

#pragma mark --- 测试任务、函数以及队列之间的关系
- (void)test2
{
    dispatch_block_t blcok_t = ^{
        NSLog(@"注意了，我是一个任务");
    };
    
    dispatch_queue_t queue_t = dispatch_queue_create("com.ppabner", NULL);
    
    dispatch_async(queue_t, blcok_t);
}

- (void)test1
{
    dispatch_semaphore_t semaphoreA = dispatch_semaphore_create(1);
    dispatch_semaphore_t semaphoreB = dispatch_semaphore_create(0);
    dispatch_semaphore_t semaphoreC = dispatch_semaphore_create(0);
    int count = 10;
    dispatch_queue_t queueA = dispatch_queue_create("com.ppabner.queue_a", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queueA, ^{
        for (int i = 0; i < count; i++) {
            dispatch_semaphore_wait(semaphoreA, DISPATCH_TIME_FOREVER);
            NSLog(@"A i=%d,%@\n",i,[NSThread currentThread]);
            dispatch_semaphore_signal(semaphoreB);
        }
    });
    
    dispatch_queue_t queueB = dispatch_queue_create("com.ppabner.queue_b", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queueB, ^{
        for (int i = 0; i < count; i++) {
            dispatch_semaphore_wait(semaphoreB, DISPATCH_TIME_FOREVER);
            NSLog(@"B i=%d,%@\n",i,[NSThread currentThread]);
            dispatch_semaphore_signal(semaphoreC);
        }
    });
    
    dispatch_queue_t queueC = dispatch_queue_create("com.ppabner.queue_c", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queueC, ^{
        for (int i = 0; i < count; i++) {
            dispatch_semaphore_wait(semaphoreC, DISPATCH_TIME_FOREVER);
            NSLog(@"C i=%d,%@\n\n",i,[NSThread currentThread]);
            dispatch_semaphore_signal(semaphoreA);
        }
    });
}

@end
