//
//  ToyDog.h
//  OSL_SDWebImage
//
//  Created by PPAbner on 2020/4/22.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ToyDog;

NS_ASSUME_NONNULL_BEGIN


@interface ToyDog : NSObject

@property (nonatomic, copy, nullable) NSString *singSongType;

@end

@interface ToyDog (Sing)

///唱英文歌的
///
///参考链接：https://www.jianshu.com/p/59b218a881a4
@property (nonatomic, class, nonnull, readonly) ToyDog *singEnglishSongs;

///唱中文歌的
@property (nonatomic, class, nonnull, readonly) ToyDog *singChineseSongs;

@end

NS_ASSUME_NONNULL_END
