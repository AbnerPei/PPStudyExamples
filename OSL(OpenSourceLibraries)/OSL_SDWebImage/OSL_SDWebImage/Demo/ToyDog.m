//
//  ToyDog.m
//  OSL_SDWebImage
//
//  Created by PPAbner on 2020/4/22.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import "ToyDog.h"

@implementation ToyDog
- (void)setSingSongType:(NSString *)singSongType
{
    if (singSongType.length > 0) {
        NSLog(@"这个玩具狗会唱%@",singSongType);
    }else{
        NSLog(@"这个玩具狗没有唱歌的功能");
    }
}
@end


@implementation ToyDog (Sing)
+ (ToyDog *)singEnglishSongs
{
    ToyDog *toyDog = [[ToyDog alloc] init];
    toyDog.singSongType = @"英文（English）歌";
    return toyDog;
}

+ (ToyDog *)singChineseSongs
{
    ToyDog *toyDog = [[ToyDog alloc] init];
    
    toyDog.singSongType = @"中文（Chinese）歌";
    return toyDog;
}
@end
