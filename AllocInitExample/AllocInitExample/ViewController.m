//
//  ViewController.m
//  AllocInitExample
//
//  Created by PPAbner on 2019/11/20.
//  Copyright © 2019 艾波er. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    id stu = [Student alloc];
    NSLog(@"alloc %@",stu);
    id stu_init = [stu init];
    NSLog(@"init %@",stu_init);
}


@end
