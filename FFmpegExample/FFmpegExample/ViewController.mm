//
//  ViewController.m
//  FFmpegExample
//
//  Created by PPAbner on 2020/1/17.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import "ViewController.h"

#ifdef __cplusplus
extern "C" {
#endif
    
#include "FFmpeg-iOS/include/libavutil/opt.h"
#include "FFmpeg-iOS/include/libavcodec/avcodec.h"
#include "FFmpeg-iOS/include/libavformat/avformat.h"
#include "FFmpeg-iOS/include/libswscale/swscale.h"

#ifdef __cplusplus
};
#endif


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    av_register_all();
}


@end
