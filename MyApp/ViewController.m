//
//  ViewController.m
//  MyApp
//
//  Created by 黄可 on 2018/7/4.
//  Copyright © 2018年 Robin Wong. All rights reserved.
//

#import "ViewController.h"
#import "ImageZoomView.h"
#import <SDWebImageManager.h>


@interface ViewController ()

@property (nonatomic, strong) ImageZoomView *imageZoomView;
@property (nonatomic, strong) UIImageView *girlPhotoImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *URLString = @"http://imgsrc.baidu.com/forum/w%3D580/sign=1c9daa96dbb44aed594ebeec831d876a/9661edf81a4c510f437c4bc66159252dd52aa553.jpg";
    __weak typeof(self) weakSelf = self;
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:URLString] options:SDWebImageDownloaderHighPriority progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        CGFloat progress = (CGFloat)receivedSize / expectedSize; //0
        NSLog(@"下载进度---%f",progress);
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
        [weakSelf saveToPhotosAlbum:image];
        [weakSelf initZoomView:image];
    }];
}

- (void)initZoomView:(UIImage *)image {
    _girlPhotoImageView = [[UIImageView alloc]initWithImage:image];
    _girlPhotoImageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageZoomView = [[ImageZoomView alloc]initWithFrame:self.view.bounds andWithImage:_girlPhotoImageView];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:_imageZoomView];
}

- (void)saveToPhotosAlbum:(UIImage *)image {
    UIImageWriteToSavedPhotosAlbum(image,self,@selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);
    if (!error) {
        NSLog(@"添加照片成功!");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
