//
//  KLAssetModel.h
//  KLImagePickerViewExample
//
//  Created by PPAbner on 2020/6/13.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, KLAssetMediaType) {
    KLAssetMediaTypeUnkonwn,
    KLAssetMediaTypeImage,
    KLAssetMediaTypeGif,
    KLAssetMediaTypeLivePhoto,
    KLAssetMediaTypeVideo,
    KLAssetMediaTypeAudio
};

@interface KLAssetModel : NSObject

///媒体类型
@property (nonatomic, assign, readonly) KLAssetMediaType mediaType;

///PHAsset对象
@property (nonatomic, strong) PHAsset *phAsset;

///（像素）宽高比
@property (nonatomic, assign, readonly) CGFloat pixelAspectRatio;

///(以屏宽为宽的)最大size
@property (nonatomic, assign, readonly) CGSize maxSize;

///原始大小
@property (nonatomic, readonly) CGSize pixelSize;

///缩略图
@property (nonatomic, strong) UIImage *thumbnailPhoto;

///是否可交互「视频和图片不能同时选，已第一个选择的类型为准」
@property (nonatomic, assign) BOOL userInteractionEnabled;

#pragma mark --- 开发中maybe使用的
///是否选中
@property (nonatomic, assign) BOOL isSelected;

@end

NS_ASSUME_NONNULL_END




//photoweak
///jpimageresize


///优化
///
///性能优化？
///
///逻辑优化？？？
//预处理
//后处理
