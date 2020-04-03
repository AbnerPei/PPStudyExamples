//
//  main.c
//  DSA-001
//
//  Created by PPAbner on 2019/10/16.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#include <stdio.h>
int fun(int num);

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("%d\n",fun(12));
    return 0;
    
}

int fun(int num){
    int f1 = 0;
    int f2 = 1;
    int f3 = f1 + f2;
    
    while (f3 < num) {
        f1 = f2;
        f2 = f3;
        f3 = f1 + f2;
    }
    return f3;
}

