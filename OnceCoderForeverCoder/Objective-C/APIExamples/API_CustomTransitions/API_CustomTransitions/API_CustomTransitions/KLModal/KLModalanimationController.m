//
//  KLModalanimationController.m
//  API_CustomTransitions
//
//  Created by PPAbner on 2020/5/28.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import "KLModalanimationController.h"
#import "KLModalPresentationProtocol.h"

@interface KLModalanimationController ()

@property (nonatomic, assign) KLModalType modalType;
@property (nonatomic, assign) KLModalDismissInteractiveStyle interactiveStyle;

@end

@implementation KLModalanimationController

- (instancetype)initWithModalType:(KLModalType)modalType dismissInteractiveStyle:(KLModalDismissInteractiveStyle)dismissInteractiveStyle
{
    self = [super init];
    if (self) {
        _modalType = modalType;
        _interactiveStyle = dismissInteractiveStyle;
    }
    return self;
}

#pragma mark --- UIViewControllerAnimatedTransitioning「required的」
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController<KLModalPresentationProtocol> *vc = [self presentedVC:transitionContext];
    if (transitionContext && vc) {
        return self.modalType == KLModalTypePresent ? [vc presentTransitionDuration] : [vc dismissTransitionDuration];
    }
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    switch (self.modalType) {
        case KLModalTypePresent:
            [self presentAnimateTransition:transitionContext];
            break;
            
        case KLModalTypeDismiss:
            [self dismissAnimateTransition:transitionContext];
            break;
            
        default:
            break;
    }
}


#pragma mark --- private methods

///获取模态出来的ViewController(presentedVC)，注意：dismiss时，presentedVC是fromVC
- (UIViewController<KLModalPresentationProtocol> *)presentedVC:(id<UIViewControllerContextTransitioning>)transitionContext
{
    ///presentedVC在present时是toVC；dismiss时是fromVC
    UIViewController *vc = [transitionContext viewControllerForKey:(self.modalType == KLModalTypePresent ? UITransitionContextToViewControllerKey : UITransitionContextFromViewControllerKey)];
    if ([vc conformsToProtocol:@protocol(KLModalPresentationProtocol)]) {
        return (UIViewController<KLModalPresentationProtocol> *)vc;
    }else{
        return nil;
    }
}

///present动画
- (void)presentAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
}

///dismiss动画
- (void)dismissAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
}

@end
