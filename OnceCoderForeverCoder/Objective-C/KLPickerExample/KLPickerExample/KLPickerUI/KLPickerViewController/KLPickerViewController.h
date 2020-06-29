//
//  KLPickerViewController.h
//  KLImagePickerViewExample
//
//  Created by PPAbner on 2020/6/29.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KLPickerViewController;

NS_ASSUME_NONNULL_BEGIN

@interface KLPickerResult : NSObject

@end

@protocol KLPickerViewControllerDelegate <NSObject>

/// <#Description#>
/// @param picker <#picker description#>
/// @param pickerResult <#pickerResult description#>
- (void)picker:(KLPickerViewController *)picker didFinishPicking:(KLPickerResult *)pickerResult;

@end

@interface KLPickerViewController : UIViewController

@property (NS_NONATOMIC_IOSONLY, weak) id<KLPickerViewControllerDelegate> delegate NS_REFINED_FOR_SWIFT;

@end

NS_ASSUME_NONNULL_END
