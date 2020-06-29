//
//  ViewController.m
//  KLImagePickerViewExample
//
//  Created by PPAbner on 2020/6/13.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import "ViewController.h"
#import <PhotosUI/PhotosUI.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()<PHPickerViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [PHPhotoLibrary requestAuthorizationForAccessLevel:(PHAccessLevelReadWrite) handler:^(PHAuthorizationStatus status) {
//        if (status == PHAuthorizationStatusAuthorized) {
//            completion(YES);
//        }else{
//            completion(NO);
//        }
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    PHPickerFilter *pickerFilter = [PHPickerFilter anyFilterMatchingSubfilters:@[
//                                        PHPickerFilter.imagesFilter,
                                        PHPickerFilter.videosFilter,
//                                        PHPickerFilter.livePhotosFilter
    ]];
    
    PHPickerConfiguration *pickerConfiguration = [[PHPickerConfiguration alloc] initWithPhotoLibrary:[PHPhotoLibrary sharedPhotoLibrary]];
    pickerConfiguration.filter = pickerFilter;
    pickerConfiguration.selectionLimit = 9;
    
    PHPickerViewController *pickerVC = [[PHPickerViewController alloc] initWithConfiguration:pickerConfiguration];
    pickerVC.delegate = self;
    pickerVC.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:pickerVC animated:YES completion:nil];
    
}

#pragma mark --- PHPickerViewControllerDelegate
- (void)picker:(PHPickerViewController *)picker didFinishPicking:(NSArray<PHPickerResult *> *)results
{
    ///就算有选择，只要点击”取消“按钮，results也为空
    if (results.count == 0) {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }else{
        NSLog(@"选择了%lu张照片",(unsigned long)results.count);
        
        [picker dismissViewControllerAnimated:YES completion:nil];
        
        NSMutableArray<NSString *> *identifiers = [NSMutableArray arrayWithCapacity:results.count];
        
        for (PHPickerResult *pickerResult in results) {
            
            [identifiers addObject:pickerResult.assetIdentifier];
         
            NSItemProvider *itemProvider = pickerResult.itemProvider;
            NSLog(@"\n registeredTypeIdentifiers is %@ \n ",itemProvider.registeredTypeIdentifiers);
            
            if ([itemProvider canLoadObjectOfClass:[UIImage class]]) {
                [itemProvider loadObjectOfClass:[UIImage class] completionHandler:^(__kindof id<NSItemProviderReading>  _Nullable object, NSError * _Nullable error) {
                    NSLog(@" UIImage %@  %@",[NSThread currentThread], object.class);
                }];
            }
            
        }
        
       PHFetchResult<PHAsset *> *assetResult = [PHAsset fetchAssetsWithLocalIdentifiers:identifiers options:nil];
 
        NSLog(@"assetResult is %@",assetResult);
    }
}

@end
