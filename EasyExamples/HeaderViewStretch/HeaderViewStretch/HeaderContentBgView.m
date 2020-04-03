//
//  HeaderContentBgView.m
//  HeaderViewStretch
//
//  Created by PPAbner on 2019/10/12.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#import "HeaderContentBgView.h"
@interface HeaderContentBgView ()

@end

@implementation HeaderContentBgView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;

    CGFloat avatarW = 70;
    UIImageView *avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(halfAB(70, screenW), 50, avatarW, avatarW)];
    [self addSubview:avatarImageView];
    avatarImageView.image = [UIImage imageNamed:@"zrx7.jpg"];
    avatarImageView.layer.masksToBounds = YES;
    avatarImageView.layer.cornerRadius = halfA(avatarW);
    
}

CG_INLINE CGFloat halfAB(CGFloat a, CGFloat b){
    CGFloat result = (a - b) / 2;
    return ABS(result);
}

CG_INLINE CGFloat halfA(CGFloat a){
    CGFloat result = a / 2;
    return ABS(result);
}

@end
