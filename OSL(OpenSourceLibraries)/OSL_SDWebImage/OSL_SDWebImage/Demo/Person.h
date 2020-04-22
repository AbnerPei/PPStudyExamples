//
//  Person.h
//  OSL_SDWebImage
//
//  Created by PPAbner on 2020/4/22.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToyDog.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@end

@interface Person (ToyDog)
///<#说明#>
@property (nonatomic, strong, nullable) ToyDog *toyDog;
@end


NS_ASSUME_NONNULL_END
