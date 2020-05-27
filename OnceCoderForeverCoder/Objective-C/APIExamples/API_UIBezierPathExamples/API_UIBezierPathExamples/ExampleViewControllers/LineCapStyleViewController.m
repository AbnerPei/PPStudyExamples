//
//  LineCapStyleViewController.m
//  API_UIBezierPathExamples
//
//  Created by PPAbner on 2020/1/14.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import "LineCapStyleViewController.h"
#import "LineCapStyleCustomView.h"

@interface LineCapStyleViewController ()

@end

@implementation LineCapStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    
    LineCapStyleCustomView *customView = [[LineCapStyleCustomView alloc] initWithFrame:CGRectMake(50, 200, 300, 400)];
    [self.view addSubview:customView];

}

@end
