//
//  KLModalPresentationController.m
//  API_CustomTransitions
//
//  Created by PPAbner on 2020/5/28.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import "KLModalPresentationController.h"
#import "KLModalBackgroundView.h"
#import "KLModalPresentationProtocol.h"
#import "KLModalanimationController.h"
#import "KLModalTransitioningDelegate.h"

@interface KLModalPresentationController ()
@property (nonatomic, strong) KLModalBackgroundView *backgroundView;
@property (nonatomic, strong) UIViewController<KLModalPresentationProtocol> *presentedVC;
@end

@implementation KLModalPresentationController

////初始化方法
//- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
//{
//
//}

//重写此方法可以在弹框即将显示时执行所需要的操作
- (void)presentationTransitionWillBegin
{
    if (!self.containerView) {
        return;
    }
    
    [self.containerView addSubview:self.backgroundView];
    self.backgroundView.frame = self.containerView.bounds;
    
    [self.containerView addSubview:self.presentedView];
    
    if (self.presentedVC && [self.presentedVC respondsToSelector:@selector(allowScreenEdgeInteractive)]) {
        <#statements#>
    }
    
}

//重写此方法可以在弹框显示完毕时执行所需要的操作
- (void)presentationTransitionDidEnd:(BOOL)completed
{
    
}

//重写此方法可以在弹框即将消失时执行所需要的操作
- (void)dismissalTransitionWillBegin
{
    
}

//重写此方法可以在弹框消失之后执行所需要的操作
- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    
}
//决定了弹出框的frame
//- (CGRect)frameOfPresentedViewInContainerView
//{
//
//}

#pragma mark --- private methods
- (void)dismissWithInteractiveStyle:(KLModalDismissInteractiveStyle)interactiveStyle isInteractive:(BOOL)isInteractive
{
    id<UIViewControllerTransitioningDelegate> transitioningDelegate = self.presentedViewController.transitioningDelegate;
    
    if (![transitioningDelegate isKindOfClass:[KLModalTransitioningDelegate class]]) {
        return;
    }
    
    KLModalTransitioningDelegate *delegate = (KLModalTransitioningDelegate *)transitioningDelegate;
    delegate.dismissInteractiveStyle = interactiveStyle;
    delegate.isInteractive = isInteractive;
    
    if (self.presentedVC && [self.presentedVC respondsToSelector:@selector(dismissWillStart)]) {
        [self.presentedVC dismissWillStart];
    }
    
    BOOL animated = YES;
    if (self.presentedVC && [self.presentedVC respondsToSelector:@selector(dismissViewControllerAnimated)]) {
        animated = [self.presentedVC dismissViewControllerAnimated];
    }
    [self.presentedVC dismissViewControllerAnimated:animated completion:^{
        if (self.presentedVC && [self.presentedVC respondsToSelector:@selector(dismissDidEnd)]) {
            [self.presentedVC dismissDidEnd];
        }
    }];
}



#pragma mark --- lazy load
- (KLModalBackgroundView *)backgroundView
{
    if (!_backgroundView) {
        _backgroundView = [[KLModalBackgroundView alloc] initWithFrame:CGRectZero];
        
        __weak typeof(self) weakS = self;
        _backgroundView.tappedBlock = ^(UITapGestureRecognizer * _Nonnull tapGestureRecognizer) {
            UIViewController<KLModalPresentationProtocol> *vc = [weakS presentedVC];
            if (vc && [vc allowsTapBackgroundToDismiss]) {
                [weakS dismissWithInteractiveStyle:(KLModalDismissInteractiveStyleNone) isInteractive:NO];
            }
        };
    }
    return _backgroundView;
}

#pragma mark --- getter
- (UIViewController<KLModalPresentationProtocol> *)presentedVC
{
    if ([self.presentedViewController conformsToProtocol:@protocol(KLModalPresentationProtocol)]) {
        return (UIViewController<KLModalPresentationProtocol> *)self.presentedViewController;
    }else{
        return nil;
    }
}

@end
