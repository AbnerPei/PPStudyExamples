//
//  KLImagePickerConfiguration.h
//  KLImagePickerViewExample
//
//  Created by PPAbner on 2020/6/20.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

///imagePicker配置模型
@interface KLImagePickerConfiguration : NSObject

///瀑布流排序方式，是否最新的排在最上面，默认YES
@property (nonatomic, assign) BOOL isLatestOnTheTop;

///是否允许选video, 默认YES
@property (nonatomic, assign) BOOL allowChooseVideo;

///是否允许选image, 默认YES
@property (nonatomic, assign) BOOL allowChooseImage;


///默认image的配置
@property (nonatomic, class, readonly) KLImagePickerConfiguration *defaultConfiguration;

@end

NS_ASSUME_NONNULL_END
