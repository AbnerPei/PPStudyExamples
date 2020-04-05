//
//  ViewController.m
//  PPTopicBlock
//
//  Created by PPAbner on 2019/11/11.
//  Copyright © 2019 艾波er. All rights reserved.
//

#import "ViewController.h"
#import "BlockExampleViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    BlockExampleViewController *vc = [[BlockExampleViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
