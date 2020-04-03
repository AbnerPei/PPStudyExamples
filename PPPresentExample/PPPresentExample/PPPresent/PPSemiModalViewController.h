//
//  PPSemiModalViewController.h
//  PPPresentExample
//
//  Created by PPAbner on 2019/10/30.
//  Copyright © 2019 艾波er. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPSemiModalViewController : UIViewController<UIViewControllerTransitioningDelegate>

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;
- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil NS_UNAVAILABLE;

/// 指定的vc初始化方法
/// @param contentView 弹窗的view,传入一个自定义的view即可。
///                   【注意】：方法里面已经视频iPhone X系列，该view的frame布局，要注意底部34，约束不要从底部开始（要么就是减去34）！
- (instancetype)initWithContentView:(UIView *)contentView NS_DESIGNATED_INITIALIZER;

/// 点击空的背景view是否dismiss，默认YES
@property (nonatomic, assign) BOOL dismissEnabledWhenTappedEmptyBgView;

/// 动画时长
@property (nonatomic, assign) NSTimeInterval animationDuration;

/// presentingView是否需要transform （默认NO）
@property (nonatomic, assign) BOOL transformEnabledForPresentingView;

/// presentingView的transform (默认CGAffineTransformMakeScale(0.94, 0.94))
@property (nonatomic) CGAffineTransform transformForPresentingView;

/// EmptyBgView的alpha (0.0 - 1.0,默认0.3)
@property (nonatomic, assign) CGFloat alphaForEmptyBgView;

@end

NS_ASSUME_NONNULL_END
