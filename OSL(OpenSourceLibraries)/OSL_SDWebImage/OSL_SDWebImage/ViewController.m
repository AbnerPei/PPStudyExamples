//
//  ViewController.m
//  OSL_SDWebImage
//
//  Created by PPAbner on 2020/4/22.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Person *person = [[Person alloc] init];
    person.toyDog = ToyDog.singEnglishSongs;
}


@end
