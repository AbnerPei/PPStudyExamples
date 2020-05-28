//
//  KLModalPresentationProtocol.h
//  API_CustomTransitions
//
//  Created by PPAbner on 2020/5/28.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, KLPresentingViewControllerAnimationStyle) {
    KLPresentingViewControllerAnimationStyleNone,
    KLPresentingViewControllerAnimationStylePageSheet,
    KLPresentingViewControllerAnimationStyleShoppingCart,
    KLPresentingViewControllerAnimationStyleCustom
};

@protocol KLModalPresentationProtocol <NSObject>

@optional

///present的转场时长，默认0.5s
- (NSTimeInterval)presentTransitionDuration;

///dismiss的转场时长，默认0.5s
- (NSTimeInterval)dismissTransitionDuration;

///presentingViewController的动画样式
- (KLPresentingViewControllerAnimationStyle)presentingVCAnimationStyle;

///是否允许点击background去dismiss，默认YES
- (BOOL)allowsTapBackgroundToDismiss;


- (void)dismissWillStart;

- (void)dismissDidEnd;

///dismiss是否animated，默认YES
- (BOOL)dismissViewControllerAnimated;

///是否允许屏幕左边侧滑dismiss，默认NO
- (BOOL)allowScreenEdgeInteractive;

@end

NS_ASSUME_NONNULL_END
