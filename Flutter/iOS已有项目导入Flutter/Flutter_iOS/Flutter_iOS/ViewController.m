//
//  ViewController.m
//  Flutter_iOS
//
//  Created by PPAbner on 2019/8/26.
//  Copyright © 2019 艾波儿（PPAbner）. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"混合开发";
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((width-200)/2, 200, 200, 40)];
    [button setTitle:@"进入第一个页面" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor grayColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
    
    button = [[UIButton alloc] initWithFrame:CGRectMake((width-200)/2, 280, 200, 40)];
    [button setTitle:@"进入第二个页面" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor grayColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)btn:(UIButton *)button
{
    FlutterViewController *vc = [[FlutterViewController alloc] init];
    if ([button.titleLabel.text isEqualToString:@"进入第一个页面"]) {
        [vc setInitialRoute:@"one"];
    }else{
        [vc setInitialRoute:@"other"];
    }
    [self presentViewController:vc animated:YES completion:nil];
}

@end

