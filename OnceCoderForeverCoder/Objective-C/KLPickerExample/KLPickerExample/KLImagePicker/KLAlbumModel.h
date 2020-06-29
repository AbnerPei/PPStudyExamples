//
//  KLAlbumModel.h
//  KLImagePickerViewExample
//
//  Created by PPAbner on 2020/6/22.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
@class KLAssetModel;

NS_ASSUME_NONNULL_BEGIN

@interface KLAlbumModel : NSObject
///相簿名
@property (nonatomic, copy) NSString *name;

///总共asset数量
@property (nonatomic, assign, readonly) NSUInteger totalAssetCount;

///asset的查询结果
@property (nonatomic, strong) PHFetchResult<PHAsset *> *assetFetchResult;

///相簿缩略图
@property (nonatomic, strong) UIImage *thumbnailPhoto;

///asset对象数组
@property (nonatomic, strong) NSArray<KLAssetModel *> *assetModelArray;

@end

NS_ASSUME_NONNULL_END
