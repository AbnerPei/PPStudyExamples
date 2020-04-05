//
//  PPSemiModalTransition.h
//  PPPresentExample
//
//  Created by PPAbner on 2019/10/30.
//  Copyright © 2019 艾波er. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPSemiModalTransition : NSObject<UIViewControllerAnimatedTransitioning>

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;
- (instancetype)initWithIsDismiss:(BOOL)isDismiss;

/** 点击空的背景view是否dismiss，默认YES */
@property (nonatomic, assign) BOOL dismissEnabledWhenTappedEmptyBgView;

/** 动画时长 */
@property (nonatomic, assign) NSTimeInterval animationDuration;

/** presentingView是否需要transform （默认NO）*/
@property (nonatomic, assign) BOOL transformEnabledForPresentingView;

/** presentingView的transform (默认CGAffineTransformMakeScale(0.94, 0.94)) */
@property (nonatomic) CGAffineTransform transformForPresentingView;

/** EmptyBgView的alpha (0.0 - 1.0,默认0.3)*/
@property (nonatomic, assign) CGFloat alphaForEmptyBgView;
@end

NS_ASSUME_NONNULL_END
