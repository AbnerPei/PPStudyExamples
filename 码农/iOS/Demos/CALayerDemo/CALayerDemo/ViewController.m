//
//  ViewController.m
//  CALayerDemo
//
//  Created by PPAbner on 2020/2/5.
//  Copyright © 2020 艾波er. All rights reserved.
//

#import "ViewController.h"
#import <OpenGLES/OpenGLESAvailability.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    CAEmitterLayer
//    CAGradientLayer
//    CAReplicatorLayer
//    CATransformLayer
//    CATiledLayer
//    CATextLayer
//    CAShapeLayer
//    CAScrollLayer
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(175, 100)];
    ///画个圆
    [path addArcWithCenter:CGPointMake(150, 150) radius:25 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(150, 125)];
    
    [path addLineToPoint:CGPointMake(150, 175)];
//    [path addLineToPoint:CGPointMake(175, 225)];
    
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];
    
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineCapStyle = kCGLineCapRound;
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    
    ///画笔颜色
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    
    ///填充色
    shapeLayer.fillColor = [UIColor purpleColor].CGColor;
    
    ///线段宽
    shapeLayer.lineWidth = 10;
    
    ///线段间连接方式
//    shapeLayer.lineCap = kCALineCapRound;
    
    shapeLayer.path = path.CGPath;
    [self.view.layer addSublayer:shapeLayer];
    
    
}


@end
