//
//  KLModalBackgroundView.m
//  API_CustomTransitions
//
//  Created by PPAbner on 2020/5/28.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import "KLModalBackgroundView.h"

@interface KLModalBackgroundView ()
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UITapGestureRecognizer *tapG;
@end

@implementation KLModalBackgroundView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
}


#pragma mark --- private methods
- (void)createUI
{
    [self addSubview:self.contentView];
    _tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedAction:)];
    [self addGestureRecognizer:_tapG];
}

- (void)tappedAction:(UITapGestureRecognizer *)tapG
{
    if (self.tappedBlock) {
        self.tappedBlock(_tapG);
    }
}


#pragma mark --- lazy load
- (UIView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectZero];
        _contentView.userInteractionEnabled = NO;
        _contentView.alpha = 0;
        _contentView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    }
    return _contentView;
}


@end
