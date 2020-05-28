//
//  KLModalTransitioningDelegate.h
//  API_CustomTransitions
//
//  Created by PPAbner on 2020/5/28.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class KLModalanimationController;
@class KLModalInteractiveTransition;

NS_ASSUME_NONNULL_BEGIN

@interface KLModalTransitioningDelegate : NSObject<UIViewControllerTransitioningDelegate>

///是否需要交互
@property (nonatomic, assign) BOOL isInteractive;

///dismiss交互方式
@property (nonatomic, assign) KLModalDismissInteractiveStyle dismissInteractiveStyle;

@property (nonatomic, strong, readonly) KLModalInteractiveTransition *dismissInteractiveTransition;
@end

NS_ASSUME_NONNULL_END
