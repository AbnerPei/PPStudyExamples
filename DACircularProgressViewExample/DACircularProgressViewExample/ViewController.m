//
//  ViewController.m
//  DACircularProgressViewExample
//
//  Created by PPAbner on 2019/8/2.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#import "ViewController.h"
#import "DACircularProgress/DALabeledCircularProgressView.h"

@interface ViewController ()
@property (nonatomic, strong) DALabeledCircularProgressView *labeledCircularProgressView;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _labeledCircularProgressView = [[DALabeledCircularProgressView alloc] initWithFrame:CGRectMake(60, 120, 150, 150)];
    _labeledCircularProgressView.backgroundColor = [UIColor lightGrayColor];
    _labeledCircularProgressView.trackTintColor = [UIColor redColor];
    _labeledCircularProgressView.progressTintColor = [UIColor purpleColor];
    _labeledCircularProgressView.innerTintColor = [UIColor blueColor];
    _labeledCircularProgressView.roundedCorners = YES;
    [self.view addSubview:_labeledCircularProgressView];
//    _labeledCircularProgressView.progress = 0.3;
//    _labeledCircularProgressView.clockwiseProgress = 0;
//    _labeledCircularProgressView.indeterminateDuration = 1.5;
    [self startAnimation];
}

- (void)progressChange
{
    NSArray *progressViews = @[self.labeledCircularProgressView];
    for (DACircularProgressView *progressView in progressViews) {
        CGFloat progress = ![self.timer isValid] ? 3 / 10.0f : progressView.progress + 0.01f;
        [progressView setProgress:progress animated:YES];
        
        if (progressView.progress >= 1.0f && [self.timer isValid]) {
            [progressView setProgress:0.f animated:YES];
        }
        
    }
    
}

- (void)startAnimation
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2
                                                  target:self
                                                selector:@selector(progressChange)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)stopAnimation
{
    [self.timer invalidate];
    self.timer = nil;
}


@end
