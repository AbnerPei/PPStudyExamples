//
//  Person.m
//  OSL_SDWebImage
//
//  Created by PPAbner on 2020/4/22.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

@end

@implementation Person (ToyDog)

- (void)setToyDog:(ToyDog *)toyDog
{
    objc_setAssociatedObject(self, @selector(toyDog), toyDog, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ToyDog *)toyDog
{
    return objc_getAssociatedObject(self, _cmd);
}

@end
