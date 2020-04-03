//
//  BlockExampleViewController.m
//  PPTopicBlock
//
//  Created by PPAbner on 2019/11/11.
//  Copyright © 2019 艾波er. All rights reserved.
//

/***
 * 神兽链接：https://blog.csdn.net/ydk888888/article/details/81563608
 *      ┌─┐       ┌─┐
 *   ┌──┘ ┴───────┘ ┴──┐
 *   │                 │
 *   │       ───       │
 *   │  ─┬┘       └┬─  │
 *   │                 │
 *   │       ─┴─       │
 *   │                 │
 *   └───┐         ┌───┘
 *       │         │
 *       │         │
 *       │         │
 *       │         └──────────────┐
 *       │                        │
 *       │                        ├─┐
 *       │                        ┌─┘
 *       │                        │
 *       └─┐  ┐  ┌───────┬──┐  ┌──┘
 *         │ ─┤ ─┤       │ ─┤ ─┤
 *         └──┴──┘       └──┴──┘
 *                神兽保佑
 *               代码无BUG!
 */

#import "BlockExampleViewController.h"

@interface BlockExampleViewController ()
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) void(^myBlock)(void);
@property (nonatomic, copy) void(^myParamBlock)(BlockExampleViewController *vc);

@end

@implementation BlockExampleViewController


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
//    [self demo___block_2];
//    [self demo___weak1x];
    
    [self demo_blockWithPatam];

}

#pragma mark --- __block
/// demo___block_1 对比 demo___block_2
- (void)demo___block_1
{

    self.name = @"PPAbner";
    
    ///第3步
    __block BlockExampleViewController *vc = self;
    
    ///第1步
    self.myBlock = ^{
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            ///第2步
//            NSLog(@"3秒后 %@",vc.name);
//        });
        
        ///第2步
        NSLog(@"执行后 %@",vc.name);
    };
    
    self.myBlock();
    
    ///循环引用分析（" -> "意思是引用，如:A -> B,表示A引用B）：
    ///self -> myBlock -> vc -> self
    
    ///     第1步      第2步  第3步
    
    ///打破循环引用的方法就是，切断中间关联，这里引用myBlock块里有代码，所以myBlock不能置位nil，只能把vc置为nil.
    
}

- (void)demo___block_2
{
    self.name = @"PPAbner";
    __block BlockExampleViewController *vc = self;
    self.myBlock = ^{
        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"3秒后 %@",vc.name);
//            vc = nil;
//        });
        
        NSLog(@"执行后 %@",vc.name);
        vc = nil;
    };
    
    self.myBlock();
}

#pragma mark --- __weak
- (void)demo___weak1
{
    self.name = @"PPAbner";
    
    ///第3步
    __weak typeof(self) weakSelf = self;
    
    ///第1步
    self.myBlock = ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            ///第2步
            NSLog(@"3秒后 %@",weakSelf.name);
        });
        
        //            ///第2步
        //            NSLog(@"执行后 %@",vc.name);
    };
    
    self.myBlock();
}

/// 为什么就不循环引用了？
- (void)demo_blockWithPatam
{
    self.name = @"PPAbner";
    self.myParamBlock = ^(BlockExampleViewController *vc) {
        NSLog(@"vc.name is %@",vc.name);
    };
    self.myParamBlock(self);
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}

///block不要嵌套层次太深
///1. 代码调试不方便
///2. 直观性不好
@end
