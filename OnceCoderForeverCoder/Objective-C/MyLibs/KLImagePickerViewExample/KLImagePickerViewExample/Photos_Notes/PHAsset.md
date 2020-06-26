#  PHAsset


typedef NS_ENUM(NSInteger, PHAssetMediaType) {
    PHAssetMediaTypeUnknown = 0,     ///未知
    PHAssetMediaTypeImage   = 1,        ///图片
    PHAssetMediaTypeVideo   = 2,         ///视频
    PHAssetMediaTypeAudio   = 3,        ///音频
};

///媒体类型
@property (nonatomic, assign, readonly) PHAssetMediaType mediaType;

///创建时间
@property (nonatomic, strong, readonly, nullable) NSDate *creationDate;


