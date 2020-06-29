//
//  KLImagePickerViewConfiguration.m
//  KLImagePickerViewExample
//
//  Created by PPAbner on 2020/6/13.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import "KLImagePickerViewConfiguration.h"

@implementation KLImagePickerViewConfiguration
+ (KLImagePickerViewConfiguration *)defaultConfiguration
{
    KLImagePickerViewConfiguration *configuration = [[KLImagePickerViewConfiguration alloc] init];
    configuration.columnCount = 3;
    configuration.maxImagesCount = 9;
    configuration.minImagesCount = 0;
    configuration.allowPreview = YES;
    configuration.isSupportGif = NO;
    configuration.isSupportLivePhoto = NO;
    return configuration;
}

@end
