//
//  DUQRScanVC.m
//  DUQRCode
//
//  Created by dongchenxi on 2019/12/21.
//  Copyright © 2019 dongchenxi. All rights reserved.
//

#import "DUQRScanVC.h"
#import <AVFoundation/AVFoundation.h>

@interface DUQRScanVC ()
<
AVCaptureMetadataOutputObjectsDelegate,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate
>

/** 输入数据源 */
@property (nonatomic, strong) AVCaptureDeviceInput *input;
/** 输出数据源 */
@property (nonatomic, strong) AVCaptureMetadataOutput *output;
/** 输入输出的中间桥梁 负责把捕获的音视频数据输出到输出设备中 */
@property (nonatomic, strong) AVCaptureSession *session;
/** 相机拍摄预览图层 */
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *layerView;
/** 预览图层尺寸 */
@property (nonatomic, assign) CGSize layerViewSize;
/** 有效扫码范围 */
@property (nonatomic, assign) CGSize showSize;
/** 扫描完成回调 */
@property (nonatomic, strong) DUQRScanCompletion completion;

@end

@implementation DUQRScanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    DDDebugLog
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self creatScanQR];
}

-(void)creatScanQR{

    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    self.input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];

    self.output = [[AVCaptureMetadataOutput alloc] init];
    [self.output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];

    self.session = [[AVCaptureSession alloc] init];
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];
    [self.session addInput:self.input];
    [self.session addOutput:self.output];

    self.output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode,
                                    AVMetadataObjectTypeEAN13Code,
                                    AVMetadataObjectTypeEAN8Code,
                                    AVMetadataObjectTypeCode128Code];

    self.layerView = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    self.layerView.videoGravity = AVLayerVideoGravityResizeAspectFill;
    self.layerView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    self.layerViewSize = CGSizeMake(_layerView.frame.size.width, _layerView.frame.size.height);
    
    [self.view.layer addSublayer:self.layerView];
}

- (void)startWithCompletion:(DUQRScanCompletion)completion {
    self.completion = completion;
    [self.session startRunning];
}

- (void)        captureOutput:(AVCaptureOutput *)captureOutput
     didOutputMetadataObjects:(NSArray *)metadataObjects
               fromConnection:(AVCaptureConnection *)connection {
  
    DDDebugLog
    if (metadataObjects.count > 0) {
        [self.session stopRunning];
        AVMetadataMachineReadableCodeObject * metadataObject = metadataObjects.firstObject;
        
        if (self.completion) {
            self.completion(metadataObject.stringValue);
        }
    }
}

@end
