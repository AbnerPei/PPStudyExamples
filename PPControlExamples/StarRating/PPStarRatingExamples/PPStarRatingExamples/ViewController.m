//
//  ViewController.m
//  PPStarRatingExamples
//
//  Created by PPAbner on 2019/6/28.
//  Copyright © 2019 艾波儿. All rights reserved.
//

#import "ViewController.h"
#import <HCSStarRatingView/HCSStarRatingView.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    HCSStarRatingView *starRatingView = [[HCSStarRatingView alloc] initWithFrame:CGRectMake(10, 120, 300, 60)];
    starRatingView.emptyStarImage = [UIImage ]
}


@end
