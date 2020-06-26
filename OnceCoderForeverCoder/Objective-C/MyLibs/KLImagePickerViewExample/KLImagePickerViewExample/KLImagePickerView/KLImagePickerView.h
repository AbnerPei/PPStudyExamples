//
//  KLImagePickerView.h
//  KLImagePickerViewExample
//
//  Created by PPAbner on 2020/6/13.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KLImagePickerViewConfiguration;

NS_ASSUME_NONNULL_BEGIN

@interface KLImagePickerView : UIView

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame configuration:(nullable KLImagePickerViewConfiguration *)configuration NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
