//
//  DemoFlutterViewController.m
//  Flutter_iOS
//
//  Created by PPAbner on 2019/9/25.
//  Copyright © 2019 艾波儿（PPAbner）. All rights reserved.
//

#import "DemoFlutterViewController.h"

@interface DemoFlutterViewController ()

@end

@implementation DemoFlutterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"DemoFlutterViewController dismiss 完成");
    }];
}

@end
