//
//  KLImagePicker.h
//  KLImagePickerViewExample
//
//  Created by PPAbner on 2020/6/13.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
@class KLImagePickerConfiguration;
@class KLAlbumModel;

NS_ASSUME_NONNULL_BEGIN


#pragma mark --- 资源选择管理者
typedef void(^KLImagePickerFetchAlbumsCompletion)(NSArray<KLAlbumModel *> * _Nullable albumModelArray);

///获取image结果block
typedef void(^KLImagePickerImageResultHandler)(UIImage * _Nullable image, NSDictionary * _Nullable info);

@interface KLImagePicker : NSObject


/// 获取所有相簿
/// @param configuration 获取相簿的配置（如：是否需要video等）
/// @param completion 获取结果回调
+ (void)fetchAllAlbumsWithConfiguration:(nullable KLImagePickerConfiguration *)configuration completion:(nullable KLImagePickerFetchAlbumsCompletion)completion;

/// 获取所有相簿
/// @param completion 获取结果回调
+ (void)fetchAllAlbumsCompletion:(nullable KLImagePickerFetchAlbumsCompletion)completion;


/// 获取指定size的图片
/// @param asset PHAsset对象
/// @param targetSize 指定的size
/// @param resultHandler 获取image结果block
+ (PHImageRequestID)requestImageForAsset:(PHAsset *)asset
                              targetSize:(CGSize)targetSize
                           resultHandler:(nullable KLImagePickerImageResultHandler)resultHandler;

@end






NS_ASSUME_NONNULL_END
