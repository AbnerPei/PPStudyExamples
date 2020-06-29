//
//  KLImagePicker.m
//  KLImagePickerViewExample
//
//  Created by PPAbner on 2020/6/13.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import "KLImagePicker.h"
#import "KLImagePickerConfiguration.h"
#import "KLAlbumModel.h"
#import "KLAssetModel.h"

@interface KLImagePicker ()

@end

@implementation KLImagePicker

+ (void)fetchAllAlbumsWithConfiguration:(KLImagePickerConfiguration *)configuration completion:(KLImagePickerFetchAlbumsCompletion)completion
{
    if (configuration && !configuration.allowChooseVideo && !configuration.allowChooseImage) {
        if (completion) {
            completion(nil);
        }
        return;
    }
    
    PHFetchOptions *fetchOption = [[PHFetchOptions alloc] init];
    ///ascending为NO，即为逆序(由现在到过去)， ascending为YES时即为默认排序，由远到近
    fetchOption.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES]];
    
    if (configuration) {
        if (!configuration.allowChooseVideo) {
            fetchOption.predicate = [NSPredicate predicateWithFormat:@"mediaType == %ld", PHAssetMediaTypeImage];
        }
        
        if (!configuration.allowChooseImage) {
            fetchOption.predicate = [NSPredicate predicateWithFormat:@"mediaType == %ld", PHAssetMediaTypeVideo];
        }
        fetchOption.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:configuration.isLatestOnTheTop]];
    }

    PHFetchResult *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    PHFetchResult *streamAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumMyPhotoStream options:nil];
    PHFetchResult *userAlbums = [PHCollectionList fetchTopLevelUserCollectionsWithOptions:nil];
    PHFetchResult *syncedAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumSyncedAlbum options:nil];
    PHFetchResult *sharedAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumCloudShared options:nil];
    NSArray<PHFetchResult *> *allAlbums = @[smartAlbums, streamAlbums, userAlbums, syncedAlbums, sharedAlbums];
    
    NSMutableArray<KLAlbumModel *> *albums = [NSMutableArray array];
    for (PHFetchResult *fetchResult in allAlbums) {
        [fetchResult enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            ///过滤PHCollectionList对象
            if (![obj isKindOfClass:PHCollection.class]) {
                return;
            }
            
            PHAssetCollection *collection = (PHAssetCollection *)obj;
            
            ///过滤最近删除和已隐藏
            if (collection.assetCollectionSubtype > 215 ||
                collection.assetCollectionSubtype == PHAssetCollectionSubtypeSmartAlbumAllHidden){
                return;
            }
            
            ///过滤空相册
            PHFetchResult<PHAsset *> *assetFetchResult = [PHAsset fetchAssetsInAssetCollection:collection options:fetchOption];
            if (assetFetchResult.count == 0) {
                return;
            }
            
            KLAlbumModel *albumModel = [self makeAlbumModelWithName:collection.localizedTitle fetchResult:assetFetchResult];
            if (collection.assetCollectionSubtype == PHAssetCollectionSubtypeSmartAlbumUserLibrary) {
                [albums insertObject:albumModel atIndex:0];
            }else{
                [albums addObject:albumModel];
            }
            
        }];
    }
    
    if (completion) {
        completion(albums);
    }

}

+ (void)fetchAllAlbumsCompletion:(KLImagePickerFetchAlbumsCompletion)completion
{
    [self fetchAllAlbumsWithConfiguration:KLImagePickerConfiguration.defaultConfiguration completion:completion];
}


#pragma mark --- 获取指定size的图片
+ (PHImageRequestID)requestImageForAsset:(PHAsset *)asset
                              targetSize:(CGSize)targetSize
                           resultHandler:(KLImagePickerImageResultHandler)resultHandler
{
    PHImageRequestOptions *option = [[PHImageRequestOptions alloc] init];
    option.resizeMode = PHImageRequestOptionsResizeModeFast;
    return [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:targetSize contentMode:PHImageContentModeAspectFill options:option resultHandler:resultHandler];
}


#pragma mark --- private methods
+ (KLAlbumModel *)makeAlbumModelWithName:(NSString *)name fetchResult:(PHFetchResult<PHAsset *> *)fetchResult
{
    KLAlbumModel *albumModel = [[KLAlbumModel alloc] init];
    albumModel.name = name;
    albumModel.assetFetchResult = fetchResult;
    return albumModel;
}

@end
