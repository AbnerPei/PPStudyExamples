//
//  KLImagePickerConfiguration.m
//  KLImagePickerViewExample
//
//  Created by PPAbner on 2020/6/20.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import "KLImagePickerConfiguration.h"

@implementation KLImagePickerConfiguration

+ (KLImagePickerConfiguration *)defaultConfiguration
{
    KLImagePickerConfiguration *imageC = [[KLImagePickerConfiguration alloc] init];
    imageC.isLatestOnTheTop = YES;
    imageC.allowChooseVideo = YES;
    imageC.allowChooseImage = YES;
    return imageC;
}
@end
