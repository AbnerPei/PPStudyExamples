//
//  SecondViewController.m
//  API_UIViewControllerExample
//
//  Created by PPAbner on 2020/4/1.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import "SecondViewController.h"
#import "RQShineLabel.h"
#import "ThirdViewController.h"
@interface SecondViewController ()
@property (strong, nonatomic) RQShineLabel *shineLabel;
@property (strong, nonatomic) NSArray *textArray;
@property (assign, nonatomic) NSUInteger textIndex;
@property (strong, nonatomic) UIImageView *wallpaper1;
@property (strong, nonatomic) UIImageView *wallpaper2;
@end

@implementation SecondViewController


- (void)viewDidLoad
{
  [super viewDidLoad];
    
    self.title = @"VC---2";
    self.view.backgroundColor = [UIColor lightGrayColor];
    NSLog(@"%s",__func__);
    
    _textArray = @[
                   @"For something this complicated, it’s really hard to design products by focus groups. A lot of times, people don’t know what they want until you show it to them.",
                   @"We’re just enthusiastic about what we do.",
                   @"We made the buttons on the screen look so good you’ll want to lick them."
                  ];
    _textIndex  = 0;
    
  self.wallpaper1 = ({
    UIImageView *imageView =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wallpaper1"]];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.frame = self.view.bounds;
    imageView;
  });
  [self.view addSubview:self.wallpaper1];
  
  self.wallpaper2 = ({
    UIImageView *imageView =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wallpaper2"]];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.frame = self.view.bounds;
    imageView.alpha = 0;
    imageView;
  });
  [self.view addSubview:self.wallpaper2];
  
  self.shineLabel = ({
    RQShineLabel *label = [[RQShineLabel alloc] initWithFrame:CGRectMake(16, 16, 320 - 32, CGRectGetHeight(self.view.bounds) - 16)];
    label.numberOfLines = 0;
    label.text = [self.textArray objectAtIndex:self.textIndex];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:24.0];
    label.backgroundColor = [UIColor clearColor];
    [label sizeToFit];
    label.center = self.view.center;
    label;
  });
  [self.view addSubview:self.shineLabel];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
  [self.shineLabel shine];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  [super touchesBegan:touches withEvent:event];
//  if (self.shineLabel.isVisible) {
//      [self.shineLabel fadeOutAnimated:YES completion:^{
//      [self changeText];
//      [UIView animateWithDuration:2.5 animations:^{
//        if (self.wallpaper1.alpha > 0.1) {
//          self.wallpaper1.alpha = 0;
//          self.wallpaper2.alpha = 1;
//        }
//        else {
//          self.wallpaper1.alpha = 1;
//          self.wallpaper2.alpha = 0;
//        }
//      }];
//      [self.shineLabel shine];
//    }];
//  }
//  else {
//    [self.shineLabel shine];
//  }
    
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:thirdVC animated:YES];
}

- (void)changeText
{
  self.shineLabel.text = self.textArray[(++self.textIndex) % self.textArray.count];
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    self.title = @"VC---2";
//    self.view.backgroundColor = [UIColor lightGrayColor];
//    NSLog(@"%s",__func__);
//}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
}

//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    NSLog(@"%s",__func__);
//}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSLog(@"%s",__func__);
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"%s",__func__);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"%s",__func__);
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"%s",__func__);
    [self removeSelf];
}


- (void)removeSelf
{
    NSMutableArray *viewControllers = self.navigationController.viewControllers.mutableCopy;
    for (UIViewController *viewController in self.navigationController.viewControllers) {
        if ([viewController isEqual:self]) {
            [viewControllers removeObject:viewController];
        }
    }
    self.navigationController.viewControllers = [viewControllers copy];
}
@end
