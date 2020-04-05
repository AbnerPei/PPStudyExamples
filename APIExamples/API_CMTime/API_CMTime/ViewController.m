//
//  ViewController.m
//  API_CMTime
//
//  Created by PPAbner on 2020/4/3.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import "ViewController.h"
#import <CoreMedia/CoreMedia.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   /*
    
    CMTime time = CMTimeMake(<#int64_t value#>, <#int32_t timescale#>)
    

        @typedef    CMTime
        @abstract    Rational time value represented as int64/int32.
    
    typedef struct
    {
        ///value/timescale = seconds.
        CMTimeValue    value;
    
        ///表示1秒的时间被分成了多少份，因为整个CMTime的精度是由它控制的所以它显的尤为重要。
        CMTimeScale    timescale;
        
        ///位掩码，表示时间的指定状态，比如判定是否有效、不确定或是是否出现舍入等
        CMTimeFlags    flags;
        CMTimeEpoch    epoch;       ! @field epoch Differentiates between equal timestamps that are actually different because
                                                     of looping, multi-item sequencing, etc.
                                                     Will be used during comparison: greater epochs happen after lesser ones.
                                                     Additions/subtraction is only possible within a single epoch,
                                                     however, since epoch length may be unknown/variable.
    } CMTime API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));
    
    */
    
    
    /*!
        @abstract    Make a CMTime from a Float64 number of seconds, and a preferred timescale.
        @discussion    The epoch of the result will be zero.  If preferredTimescale is <= 0, the result
                    will be an invalid CMTime.  If the preferred timescale will cause an overflow, the
                    timescale will be halved repeatedly until the overflow goes away, or the timescale
                    is 1.  If it still overflows at that point, the result will be +/- infinity.  The
                    kCMTimeFlags_HasBeenRounded flag will be set if the result, when converted back to
                    seconds, is not exactly equal to the original seconds value.
        @result        The resulting CMTime.
    
    CM_EXPORT
    CMTime CMTimeMakeWithSeconds(
                    Float64 seconds,
                    int32_t preferredTimescale)
                                API_AVAILABLE(macos(10.7), ios(4.0), tvos(9.0), watchos(6.0));
     
     */
    
    Float64 seconds = 5;
    int32_t pTimeScale = 600;
    CMTime time = CMTimeMakeWithSeconds(seconds, pTimeScale);
    CMTimeShow(time);
    
    
    Float64 seconds1 = 5;
    int32_t pTimeScale1 = 600;
    CMTime time1 = CMTimeMakeWithSeconds(seconds, pTimeScale);
    CMTimeShow(time1);
    
}


@end
