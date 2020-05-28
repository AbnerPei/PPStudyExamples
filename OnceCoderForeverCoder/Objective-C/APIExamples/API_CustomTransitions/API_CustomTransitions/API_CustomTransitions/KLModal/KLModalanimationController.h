//
//  KLModalanimationController.h
//  API_CustomTransitions
//
//  Created by PPAbner on 2020/5/28.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, KLModalType) {
    KLModalTypePresent,
    KLModalTypeDismiss
};

typedef NS_ENUM(NSInteger, KLModalDismissInteractiveStyle) {
    KLModalDismissInteractiveStyleNone,        ///无手势交互
    KLModalDismissInteractiveStyleSideslip,    ///侧滑dismiss
    KLModalDismissInteractiveStyleDragDown     ///向下拖拽dismiss
};

@interface KLModalanimationController : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithModalType:(KLModalType)modalType dismissInteractiveStyle:(KLModalDismissInteractiveStyle)dismissInteractiveStyle NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
