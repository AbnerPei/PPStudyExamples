//
//  KLImagePickerView.m
//  KLImagePickerViewExample
//
//  Created by PPAbner on 2020/6/13.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import "KLImagePickerView.h"
#import "KLImagePickerViewConfiguration.h"

@interface KLImagePickerView ()
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) KLImagePickerViewConfiguration *configuration;
@end

@implementation KLImagePickerView
- (instancetype)initWithFrame:(CGRect)frame configuration:(KLImagePickerViewConfiguration *)configuration
{
    self = [super initWithFrame:frame];
    if (self) {
        if (!self.configuration) {
            self.configuration = KLImagePickerViewConfiguration.defaultConfiguration;
        }
        [self createUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    return [self initWithFrame:CGRectZero configuration:KLImagePickerViewConfiguration.defaultConfiguration];
}

- (void)createUI
{

}

#pragma mark --- lazy load

@end
