//
//  ViewController.m
//  API_UIViewControllerExample
//
//  Created by PPAbner on 2020/4/1.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    NSLog(@"%s",__func__);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"%s",__func__);
}

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
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:firstVC animated:YES];
}

/**

 ///加载ViewController
 2020-04-01 16:30:45.465638+0800 API_UIViewControllerExample[63209:914637] -[ViewController viewDidLoad]
 2020-04-01 16:30:45.466054+0800 API_UIViewControllerExample[63209:914637] -[ViewController viewWillAppear:]
 2020-04-01 16:30:45.467649+0800 API_UIViewControllerExample[63209:914637] -[ViewController viewWillLayoutSubviews]
 2020-04-01 16:30:45.467762+0800 API_UIViewControllerExample[63209:914637] -[ViewController viewDidLayoutSubviews]
 2020-04-01 16:30:45.483196+0800 API_UIViewControllerExample[63209:914637] -[ViewController viewDidAppear:]
 
 ///ViewController push FirstViewController
 2020-04-01 16:31:17.945260+0800 API_UIViewControllerExample[63209:914637] -[FirstViewController viewDidLoad]
 2020-04-01 16:31:17.945412+0800 API_UIViewControllerExample[63209:914637] -[ViewController viewWillDisappear:]
 2020-04-01 16:31:17.945582+0800 API_UIViewControllerExample[63209:914637] -[FirstViewController viewWillAppear:]
 2020-04-01 16:31:17.962856+0800 API_UIViewControllerExample[63209:914637] -[FirstViewController viewWillLayoutSubviews]
 2020-04-01 16:31:17.963014+0800 API_UIViewControllerExample[63209:914637] -[FirstViewController viewDidLayoutSubviews]
 2020-04-01 16:31:18.482786+0800 API_UIViewControllerExample[63209:914637] -[ViewController viewDidDisappear:]
 2020-04-01 16:31:18.483121+0800 API_UIViewControllerExample[63209:914637] -[FirstViewController viewDidAppear:]

 ///FirstViewController push SecondViewController
 2020-04-01 16:32:00.859438+0800 API_UIViewControllerExample[63209:914637] -[SecondViewController viewDidLoad]
 2020-04-01 16:32:00.859763+0800 API_UIViewControllerExample[63209:914637] -[FirstViewController viewWillDisappear:]
 2020-04-01 16:32:00.859899+0800 API_UIViewControllerExample[63209:914637] -[SecondViewController viewWillAppear:]
 2020-04-01 16:32:00.868199+0800 API_UIViewControllerExample[63209:914637] -[SecondViewController viewWillLayoutSubviews]
 2020-04-01 16:32:00.868371+0800 API_UIViewControllerExample[63209:914637] -[SecondViewController viewDidLayoutSubviews]
 2020-04-01 16:32:01.373654+0800 API_UIViewControllerExample[63209:914637] -[FirstViewController viewDidDisappear:]
 2020-04-01 16:32:01.374590+0800 API_UIViewControllerExample[63209:914637] -[SecondViewController viewDidAppear:]
 
 ///SecondVC pod FirstVC
 2020-04-01 16:32:35.223272+0800 API_UIViewControllerExample[63209:914637] -[SecondViewController viewWillDisappear:]
 2020-04-01 16:32:35.223436+0800 API_UIViewControllerExample[63209:914637] -[FirstViewController viewWillAppear:]
 2020-04-01 16:32:35.734399+0800 API_UIViewControllerExample[63209:914637] -[SecondViewController viewDidDisappear:]
 2020-04-01 16:32:35.734914+0800 API_UIViewControllerExample[63209:914637] -[FirstViewController viewDidAppear:]
 
 ///FirstVC pop ViewController
 2020-04-01 16:32:54.898975+0800 API_UIViewControllerExample[63209:914637] -[FirstViewController viewWillDisappear:]
 2020-04-01 16:32:54.899150+0800 API_UIViewControllerExample[63209:914637] -[ViewController viewWillAppear:]
 2020-04-01 16:32:55.404248+0800 API_UIViewControllerExample[63209:914637] -[FirstViewController viewDidDisappear:]
 2020-04-01 16:32:55.405220+0800 API_UIViewControllerExample[63209:914637] -[ViewController viewDidAppear:]
 
 */

@end
