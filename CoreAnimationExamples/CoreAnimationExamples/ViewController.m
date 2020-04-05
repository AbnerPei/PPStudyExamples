//
//  ViewController.m
//  CoreAnimationExamples
//
//  Created by PPAbner on 2019/10/29.
//  Copyright © 2019 艾波er. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 初始化layer
    CALayer *layer        = [CALayer layer];
    layer.frame           = CGRectMake(50, 50, 200, 2);
    layer.backgroundColor = [UIColor blackColor].CGColor;
    
    
    // 终点位置
    CGPoint endPosition = CGPointMake(layer.position.x, layer.position.y + 200);
    
    
    // 动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(position))];
    animation.fromValue         = [NSValue valueWithCGPoint:layer.position];
    animation.toValue           = [NSValue valueWithCGPoint:endPosition];
    animation.timingFunction    = [CAMediaTimingFunction functionWithControlPoints:0.20 :0.03 :0.13 :1.00];
    layer.position              = endPosition;
    animation.duration          = 1.f;
    
    
    // 添加动画
    [layer addAnimation:animation forKey:nil];
    
    
    // 添加layer
    [self.view.layer addSublayer:layer];
}


@end
