//
//  main.m
//  LearnRuntimeExample
//
//  Created by PPAbner on 2019/6/11.
//  Copyright © 2019 com.ppabner.www. All rights reserved.
//

#import <Foundation/Foundation.h>

struct student {
    char mark;
    long num;
    float score;
};

typedef struct xiaoHong {
    char mark;
    long num;
    float score;
}XiaoHong;

union xiaoMing {
    char mark;
    long num;
    float score;
};

struct AAA {
    char a[3];
    int64_t b;
    char c;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"char %lu\n",sizeof(char));
        NSLog(@"long %lu\n",sizeof(long));
        NSLog(@"float %lu\n",sizeof(float));
        NSLog(@"student %lu\n",sizeof(struct student));
        NSLog(@"小红 %lu\n",sizeof(XiaoHong));
        NSLog(@"xiaoMing %lu",sizeof(union xiaoMing));
        NSLog(@"AAA %lu",sizeof(struct AAA));
    }
    return 0;
}


