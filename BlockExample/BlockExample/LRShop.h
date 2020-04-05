//
//  LRShop.h
//  BlockExample
//
//  Created by PPAbner on 2019/10/31.
//  Copyright © 2019 艾波er. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LRShop : NSObject

@property (nonatomic, copy) NSString *string;
@property (nonatomic, copy) void(^myBlock)(void);

@end

NS_ASSUME_NONNULL_END
