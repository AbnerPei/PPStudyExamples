//
//  KLModalBackgroundView.h
//  API_CustomTransitions
//
//  Created by PPAbner on 2020/5/28.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KLModalBackgroundView : UIView

@property (nonatomic, copy) void(^tappedBlock)(UITapGestureRecognizer *tapGestureRecognizer);

@end

NS_ASSUME_NONNULL_END
