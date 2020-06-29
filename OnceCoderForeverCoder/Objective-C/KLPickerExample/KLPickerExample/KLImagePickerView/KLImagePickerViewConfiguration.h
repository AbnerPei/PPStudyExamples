//
//  KLImagePickerViewConfiguration.h
//  KLImagePickerViewExample
//
//  Created by PPAbner on 2020/6/13.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KLImagePickerViewConfiguration : NSObject

@property (nonatomic, class, readonly) KLImagePickerViewConfiguration *defaultConfiguration;

///图片列数，default 3
@property (nonatomic, assign) NSUInteger columnCount;

///最多可选图片数量，default 9
@property (nonatomic, assign) NSUInteger maxImagesCount;

///最少可选图片数量，default 0
@property (nonatomic, assign) NSUInteger minImagesCount;

///是否支持预览，default YES
@property (nonatomic, assign) BOOL allowPreview;

///是否支持gif，default is NO.「NO，意味着gif当做图片处理」.
@property (nonatomic, assign) BOOL isSupportGif;

///是否支持LivePhoto，default is NO.[NO，意味着LivePhoto当做图片处理）.
@property (nonatomic, assign) BOOL isSupportLivePhoto;

@end

NS_ASSUME_NONNULL_END
