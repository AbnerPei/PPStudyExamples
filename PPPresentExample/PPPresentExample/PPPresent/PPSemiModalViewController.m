//
//  PPSemiModalViewController.m
//  PPPresentExample
//
//  Created by PPAbner on 2019/10/30.
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

#import "PPSemiModalViewController.h"
#import "PPSemiModalTransition.h"

@interface PPSemiModalViewController ()

@end

@implementation PPSemiModalViewController

static inline bool is_iPhoneX(){
    return ([UIScreen mainScreen].bounds.size.width == 812) || ([UIScreen mainScreen].bounds.size.height == 896);
}

#pragma mark --- life cycle
- (instancetype)initWithContentView:(UIView *)contentView
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.view.backgroundColor = [UIColor clearColor];
        CGRect f = contentView.bounds;
        if (is_iPhoneX()) {
            CGFloat h = f.size.height;
            f.size.height = h + 34;
        }
        self.view.frame = f;
        contentView.frame = f;
        [self.view addSubview:contentView];
        [self configureDefaultValues];
    }
    return self;
}

#pragma mark --- public method
/// 点击EmptyBgView的事件
- (void)tapEmptyBgView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark --- UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [self modalTransitionWithIsDismiss:NO];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [self modalTransitionWithIsDismiss:YES];
}

#pragma mark --- privated method
- (void)configureDefaultValues
{
    self.transitioningDelegate = self;
    self.modalPresentationStyle = UIModalPresentationCustom;
    
    self.dismissEnabledWhenTappedEmptyBgView = YES;
    self.animationDuration = 0.25;
    self.transformEnabledForPresentingView = NO;
    self.transformForPresentingView = CGAffineTransformMakeScale(0.94, 0.94);
    self.alphaForEmptyBgView = 0.3;
}

- (PPSemiModalTransition *)modalTransitionWithIsDismiss:(BOOL)isDismiss
{
    PPSemiModalTransition *transition = [[PPSemiModalTransition alloc] initWithIsDismiss:isDismiss];
    transition.dismissEnabledWhenTappedEmptyBgView = self.dismissEnabledWhenTappedEmptyBgView;
    transition.animationDuration = self.animationDuration;
    transition.transformEnabledForPresentingView = self.transformEnabledForPresentingView;
    transition.transformForPresentingView = self.transformForPresentingView;
    transition.alphaForEmptyBgView = self.alphaForEmptyBgView;
    return transition;
}

@end
