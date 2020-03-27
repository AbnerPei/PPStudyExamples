//
//  main.m
//  SizeOfTest
//
//  Created by PPAbner on 2020/2/6.
//  Copyright © 2020 艾波er. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
        int c = sizeof(int);
        printf("%d",c);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
