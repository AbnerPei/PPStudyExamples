//
//  CustomView.m
//  PPPresentExample
//
//  Created by PPAbner on 2019/10/30.
//  Copyright © 2019 艾波er. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *lb = [[UILabel alloc] initWithFrame:self.bounds];
        [self addSubview:lb];
        lb.font = [UIFont systemFontOfSize:16];
        lb.text = @"888888";
        lb.textColor = [UIColor purpleColor];
        lb.textAlignment = NSTextAlignmentCenter;
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 15;
        
    }
    return self;
}

@end
