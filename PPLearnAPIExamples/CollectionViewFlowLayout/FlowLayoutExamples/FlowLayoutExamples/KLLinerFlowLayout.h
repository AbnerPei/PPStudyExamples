//
//  KLLinerFlowLayout.h
//  FlowLayoutExamples
//
//  Created by PPAbner on 2019/6/13.
//  Copyright © 2019 com.ppabner.www. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KLLinerFlowLayout : UICollectionViewFlowLayout
// 滑动到居中的cell的序号回调
@property (nonatomic, copy) void(^selectBlock)(NSInteger index);
@end

NS_ASSUME_NONNULL_END
