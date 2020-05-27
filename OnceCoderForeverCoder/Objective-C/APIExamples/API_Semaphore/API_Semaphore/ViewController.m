//
//  ViewController.m
//  API_Semaphore
//
//  Created by PPAbner on 2019/8/1.
//  Copyright © 2019 PPAbner. All rights reserved.
//
/// [iOS GCD中级篇 - dispatch_semaphore（信号量）的理解及使用](https://blog.csdn.net/HuberCui/article/details/79870172)
/// [iOS之利用GCD信号量控制并发网络请求](https://blog.csdn.net/Cloudox_/article/details/71107179)
/// [GCD高级用法－信号量](https://blog.csdn.net/u014205965/article/details/45915135)
/// [dispatch_semaphore_t异步任务同步执行和线程加锁理解](https://www.jianshu.com/p/866a4bc59acd)
/// [dispatch_semaphore_t的使用](https://blog.csdn.net/u012380572/article/details/81541954)
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"start task 1");
        sleep(1.5);
        NSLog(@"end task 1");
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_async(queue, ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"start task 2");
        sleep(1.5);
        NSLog(@"end task 2");
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_async(queue, ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"start task 3");
        sleep(1.5);
        NSLog(@"end task 3");
        dispatch_semaphore_signal(semaphore);
    });
}

///*!
// * @function    dispatch_semaphore_create
// * @abstract    使用初始值创建新的计数信号量。
// * @discussion  当两个线程需要协调特定事件的完成时，为值传递0是有用的。
// *              传递大于零的值对于管理有限的资源池非常有用，其中池大小等于该值。
// * @param value 信号量的起始值。如果小于0将返回NULL。
// * @result      新创建的信号量（成功）, or NULL（失败）.
// */
//dispatch_semaphore_t
//dispatch_semaphore_create(long value);

///*!
// * @function dispatch_semaphore_wait
// *
// * @abstract
// * Wait (decrement) for a semaphore.
// *
// * @discussion
// * Decrement the counting semaphore. If the resulting value is less than zero,
// * this function waits for a signal to occur before returning.
// *
// * @param dsema
// * The semaphore. The result of passing NULL in this parameter is undefined.
// *
// * @param timeout
// * When to timeout (see dispatch_time). As a convenience, there are the
// * DISPATCH_TIME_NOW and DISPATCH_TIME_FOREVER constants.
// *
// * @result
// * Returns zero on success, or non-zero if the timeout occurred.
// */
//API_AVAILABLE(macos(10.6), ios(4.0))
//DISPATCH_EXPORT DISPATCH_NONNULL_ALL DISPATCH_NOTHROW
//long
//dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout);
//
///*!
// * @function dispatch_semaphore_signal
// *
// * @abstract
// * Signal (increment) a semaphore.
// *
// * @discussion
// * Increment the counting semaphore. 如果前一个值小于零，则此函数在返回前唤醒一个等待的线程。
// *
// * @param dsema The counting semaphore.
// * The result of passing NULL in this parameter is undefined.
// *
// * @result
// * This function returns non-zero if a thread is woken. Otherwise, zero is
// * returned.
// */
//API_AVAILABLE(macos(10.6), ios(4.0))
//DISPATCH_EXPORT DISPATCH_NONNULL_ALL DISPATCH_NOTHROW
//long
//dispatch_semaphore_signal(dispatch_semaphore_t dsema);

@end
