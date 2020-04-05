//
//  ViewController.m
//  MultiThreadingExample
//
//  Created by PPAbner on 2019/10/15.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self demo2];
}


/// 死锁
- (void)demo1
{

    NSLog(@"1111111");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"2222222");
    });
    NSLog(@"3333333");
}

- (void)demo2
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSLog(@"1");
    dispatch_sync(queue, ^{
        sleep(3);
        NSLog(@"2");
        dispatch_sync(queue, ^{
            NSLog(@"3");
            NSLog(@"thread = %@", [NSThread currentThread]);
        });
        NSLog(@"4");
    });
    NSLog(@"5");
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    
}

@end
