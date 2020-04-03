//
//  PPSemiModalTransition.m
//  PPPresentExample
//
//  Created by PPAbner on 2019/10/30.
//  Copyright © 2019 艾波er. All rights reserved.
//

#import "PPSemiModalTransition.h"

@interface PPSemiModalTransition ()
@property (nonatomic, assign) BOOL isDismiss;
@end

@implementation PPSemiModalTransition

#pragma mark --- lift cycle
- (instancetype)initWithIsDismiss:(BOOL)isDismiss
{
    self = [super init];
    if (self) {
        self.isDismiss = isDismiss;
    }
    return self;
}


#pragma mark --- UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return self.animationDuration;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:(UITransitionContextFromViewControllerKey)];
    UIViewController *toVC = [transitionContext viewControllerForKey:(UITransitionContextToViewControllerKey)];
    
    //modal的view的frame
    CGRect modalViewFrame_final = CGRectMake(0, transitionContext.containerView.frame.size.height - toVC.view.frame.size.height, transitionContext.containerView.frame.size.width, toVC.view.frame.size.height);
    //modal的view的frame一开始的frame(一般y是屏幕的最底部)
    CGRect modalViewFrame_initial = CGRectMake(0, CGRectGetHeight(transitionContext.containerView.frame), CGRectGetWidth(modalViewFrame_final), CGRectGetHeight(modalViewFrame_final));
    
    //添加emptyBgView
    UIView *emptyBgView = [transitionContext.containerView viewWithTag:666];
    if (!emptyBgView) {
        emptyBgView = [[UIView alloc] initWithFrame:transitionContext.containerView.bounds];
        //一开始alpha为0
        emptyBgView.alpha = 0;
        emptyBgView.backgroundColor = [UIColor blackColor];
        emptyBgView.tag = 666;
        
        //emptyBgView添加点击手势
        if (self.dismissEnabledWhenTappedEmptyBgView) {
            //这里注意target是toVC
            SEL tapmEmptyBgViewSel = NSSelectorFromString(@"tapEmptyBgView");
            if ([toVC respondsToSelector:tapmEmptyBgViewSel]) {
                UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:toVC action:tapmEmptyBgViewSel];
                [emptyBgView addGestureRecognizer:tapG];
            }
        }
    }
    
    //动画开始前，禁止from和to对应view的交互
    fromVC.view.userInteractionEnabled = NO;
    toVC.view.userInteractionEnabled = NO;
    
    if (self.isDismiss) {
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
            emptyBgView.alpha = self.alphaForEmptyBgView;
            if (self.transformEnabledForPresentingView) {
                UIImageView *screentShotImageView = (UIImageView *)[transitionContext.containerView.subviews objectAtIndex:0];
                screentShotImageView.transform = self.transformForPresentingView;
            }
            fromVC.view.frame = modalViewFrame_initial;
        } completion:^(BOOL finished) {
            toVC.view.hidden = NO;
            fromVC.view.userInteractionEnabled = YES;
            toVC.view.userInteractionEnabled = YES;
            [transitionContext completeTransition:YES];
        }];
    }else{
        UIImage *screentShotImageByfromView = [self imageFromView:fromVC.view];
        UIImageView *screentShotImageView = [[UIImageView alloc] initWithImage:screentShotImageByfromView];
        [transitionContext.containerView insertSubview:screentShotImageView atIndex:0];
        fromVC.view.hidden = YES;
        [transitionContext.containerView insertSubview:emptyBgView aboveSubview:screentShotImageView];
        //设置toVC.view的frame为一开始的frame
        toVC.view.frame = modalViewFrame_initial;
        [transitionContext.containerView addSubview:toVC.view];
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
            emptyBgView.alpha = self.alphaForEmptyBgView;
            if (self.transformEnabledForPresentingView) {
                screentShotImageView.transform = self.transformForPresentingView;
            }
            toVC.view.frame = modalViewFrame_final;
        } completion:^(BOOL finished) {
            fromVC.view.userInteractionEnabled = YES;
            toVC.view.userInteractionEnabled = YES;
            [transitionContext completeTransition:YES];
        }];
    }
}


#pragma mark --- private method
- (UIImage *)imageFromView:(UIView *)view
{
    UIImage *image = nil;
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
