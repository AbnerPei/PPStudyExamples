//
//  main.m
//  PPTopicBlock
//
//  Created by PPAbner on 2019/11/11.
//  Copyright © 2019 艾波er. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
        ///Block---start
        int a = 5;
        
        void(^blk)(void) = ^{
            NSLog(@"a is %d",a);
        };

        blk();
        ///Block---start
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}



