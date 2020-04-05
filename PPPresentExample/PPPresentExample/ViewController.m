//
//  ViewController.m
//  PPPresentExample
//
//  Created by PPAbner on 2019/10/30.
//  Copyright © 2019 艾波er. All rights reserved.
//

#import "ViewController.h"
#import "PPSemiModalViewController.h"
#import "CustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CustomView *customV = [[CustomView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 0, 400)];
    PPSemiModalViewController *semiModal = [[PPSemiModalViewController alloc] initWithContentView:customV];
    [self presentViewController:semiModal animated:YES completion:nil];
    
    if (@available(iOS 11.0, *))
    {
        UIImpactFeedbackGenerator *feedBackGenertor = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
        [feedBackGenertor impactOccurred];
        
    }
}

@end
