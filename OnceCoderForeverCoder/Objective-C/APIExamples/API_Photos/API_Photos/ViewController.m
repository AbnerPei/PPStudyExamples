//
//  ViewController.m
//  API_Photos
//
//  Created by PPAbner on 2020/5/25.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import "ViewController.h"
#import <Photos/Photos.h>

@interface ViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.lightGrayColor;
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 300, 300)];
    [self.view addSubview:_imageView];
}


#pragma mark --- UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info
{
    NSLog(@"info is %@",info);
    UIImagePickerControllerInfoKey infoKey = nil;
    
    if (@available(ios 11.0, *)) {
        infoKey = UIImagePickerControllerPHAsset;
    }else{
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Wdeprecated-declarations"
        infoKey = UIImagePickerControllerReferenceURL;
        #pragma clang diagnostic pop
    }

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

@end
