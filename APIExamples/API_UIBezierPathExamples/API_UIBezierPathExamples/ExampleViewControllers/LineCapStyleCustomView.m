//
//  LineCapStyleCustomView.m
//  API_UIBezierPathExamples
//
//  Created by PPAbner on 2020/1/14.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import "LineCapStyleCustomView.h"

@implementation LineCapStyleCustomView

- (void)drawRect:(CGRect)rect {
    /// Drawing code
    [[UIColor redColor] set];
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    path.lineWidth     = 5.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    
    /// 起点
    [path moveToPoint:CGPointMake(20, 50)];
    
    /// 绘制线条
    [path addLineToPoint:CGPointMake(60, 100)];
    
    /// 绘制线条
    [path addLineToPoint:CGPointMake(200, 150)];
    
    [path stroke];
}


@end
