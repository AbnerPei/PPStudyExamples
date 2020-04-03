//
//  ViewController.m
//  RealSingletonExample
//
//  Created by PPAbner on 2019/11/20.
//  Copyright © 2019 艾波er. All rights reserved.
//

#import "ViewController.h"
#import "Singleton.h"
#import "SubSingleton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Singleton *s1 = [Singleton shareInstance];
    Singleton *s2 = [[Singleton alloc] init];
    Singleton *s3 = [s2 copy];
    Singleton *s4 = [s2 mutableCopy];
    NSLog(@"\ns1 %@\ns2 %@\ns3 %@\ns4 %@",s1,s2,s3,s4);
    
    SubSingleton *s11 = [SubSingleton shareInstance];
    SubSingleton *s22 = [[SubSingleton alloc] init];
    SubSingleton *s33 = [s22 copy];
    SubSingleton *s44 = [s22 mutableCopy];
    NSLog(@"\ns11 %@\ns22 %@\ns33 %@\ns44 %@",s11,s22,s33,s44);
}


@end
