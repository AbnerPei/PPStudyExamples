//
//  KLModalTransitioningDelegate.m
//  API_CustomTransitions
//
//  Created by PPAbner on 2020/5/28.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import "KLModalTransitioningDelegate.h"
#import "KLModalanimationController.h"
#import "KLModalInteractiveTransition.h"

@interface KLModalTransitioningDelegate ()
@property (nonatomic, strong) KLModalInteractiveTransition *dismissInteractiveTransition;
@end

@implementation KLModalTransitioningDelegate

#pragma mark --- UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    ///present时不需要交互
    return [[KLModalanimationController alloc] initWithModalType:(KLModalTypePresent) dismissInteractiveStyle:(KLModalDismissInteractiveStyleNone)];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[KLModalanimationController alloc] initWithModalType:(KLModalTypeDismiss) dismissInteractiveStyle:self.dismissInteractiveStyle];
}


- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self.isInteractive ? self.dismissInteractiveTransition : nil;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    
}

@end
