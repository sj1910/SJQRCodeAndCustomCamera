//
//  LoginCameraViewController.m
//  TMSystem
//
//  Created by sino on 2019/2/18.
//  Copyright © 2019年 Quincy-QC. All rights reserved.
//
#import "LoginCameraViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "CameraCarBottomView.h"
#import "CapturePreviewBottomView.h"
@interface LoginCameraViewController ()<AVCaptureMetadataOutputObjectsDelegate,UIAlertViewDelegate,CameraCarBottomViewDelegate,CapturePreviewBottomViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
//捕获设备，通常是前置摄像头，后置摄像头，麦克风（音频输入）
@property(nonatomic,strong)AVCaptureDevice *device;

//AVCaptureDeviceInput 代表输入设备，他使用AVCaptureDevice 来初始化
@property(nonatomic,strong)AVCaptureDeviceInput *input;

//当启动摄像头开始捕获输入
@property(nonatomic,strong)AVCaptureMetadataOutput *output;

@property (nonatomic,strong)AVCaptureStillImageOutput *ImageOutPut;

//session：由他把输入输出结合在一起，并开始启动捕获设备（摄像头）
@property(nonatomic,strong)AVCaptureSession *session;

//图像预览层，实时显示捕获的图像
@property(nonatomic,strong)AVCaptureVideoPreviewLayer *previewLayer;

@property (nonatomic,strong)UIButton *PhotoButton;
@property (nonatomic,strong)UIButton *flashButton;
@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)UIView *focusView;
@property (nonatomic,assign)BOOL isflashOn;
@property (nonatomic,strong)UIImage *image;

@property (nonatomic,assign)BOOL canCa;

@property (nonatomic,strong) CameraCarBottomView *bottomView;
@property (nonatomic,strong) CapturePreviewBottomView *showBottomView;

@property (nonatomic,strong) UIActivityIndicatorView *activityView;
@property (nonatomic,strong) UILabel *labelReadying;
@end

@implementation LoginCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _canCa = [self canUserCamear];
    if (_canCa) {
        [self hbActivityView];
        [self customCamera];
        [self setUpBottomView];
//        [self setUpShowBottomView];
    }else{
        return;
    }
    
    //监听是否重新进入程序程序.
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startScan) name:UIApplicationDidBecomeActiveNotification object:nil];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)customCamera{
    self.view.backgroundColor = kBlackColor;
    
    //使用AVMediaTypeVideo 指明self.device代表视频，默认使用后置摄像头进行初始化
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    //使用设备初始化输入
    self.input = [[AVCaptureDeviceInput alloc]initWithDevice:self.device error:nil];
    
    //生成输出对象
    self.output = [[AVCaptureMetadataOutput alloc]init];
    self.ImageOutPut = [[AVCaptureStillImageOutput alloc] init];
    
    //生成会话，用来结合输入输出
    self.session = [[AVCaptureSession alloc]init];
    if ([self.session canSetSessionPreset:AVCaptureSessionPreset1280x720]) {
        
        self.session.sessionPreset = AVCaptureSessionPreset1280x720;
        
    }
    if ([self.session canAddInput:self.input]) {
        [self.session addInput:self.input];
    }
    
    if ([self.session canAddOutput:self.ImageOutPut]) {
        [self.session addOutput:self.ImageOutPut];
    }
    
    //使用self.session，初始化预览层，self.session负责驱动input进行信息的采集，layer负责把图像渲染显示
    self.previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:self.session];
    self.previewLayer.frame = CGRectMake(0, 0, MainWidth, MainHeight);
    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:self.previewLayer];
    
    [self performSelector:@selector(startScan) withObject:nil afterDelay:0.01];

}

- (void)startScan {
    
    //开始启动
    [self.session startRunning];
    if ([_device lockForConfiguration:nil]) {
        if ([_device isFlashModeSupported:AVCaptureFlashModeAuto]) {
            [_device setFlashMode:AVCaptureFlashModeAuto];
        }
        //自动白平衡
        if ([_device isWhiteBalanceModeSupported:AVCaptureWhiteBalanceModeAutoWhiteBalance]) {
            [_device setWhiteBalanceMode:AVCaptureWhiteBalanceModeAutoWhiteBalance];
        }
        [_device unlockForConfiguration];
    }
    [self stopDeviceReadying];
}
- (void)flashOn{
    if ([_device lockForConfiguration:nil]) {
        if (_isflashOn) {
            if ([_device isFlashModeSupported:AVCaptureFlashModeOff]) {
                [_device setFlashMode:AVCaptureFlashModeOff];
                _isflashOn = NO;
                [_bottomView.flashBtn setBackgroundImage:image(@"闪光灯关") forState:(UIControlStateNormal)];
            }
        }else{
            if ([_device isFlashModeSupported:AVCaptureFlashModeOn]) {
                [_device setFlashMode:AVCaptureFlashModeOn];
                _isflashOn = YES;
                [_bottomView.flashBtn setBackgroundImage:image(@"闪电开") forState:(UIControlStateNormal)];
            }
        }
        
        [_device unlockForConfiguration];
    }
}


- (AVCaptureDevice *)cameraWithPosition:(AVCaptureDevicePosition)position{
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for ( AVCaptureDevice *device in devices )
        if ( device.position == position ) return device;
    return nil;
}
- (void)focusGesture:(UITapGestureRecognizer*)gesture{
    CGPoint point = [gesture locationInView:gesture.view];
    [self focusAtPoint:point];
}
- (void)focusAtPoint:(CGPoint)point{
    CGSize size = self.view.bounds.size;
    CGPoint focusPoint = CGPointMake( point.y /size.height ,1-point.x/size.width );
    NSError *error;
    if ([self.device lockForConfiguration:&error]) {
        
        if ([self.device isFocusModeSupported:AVCaptureFocusModeAutoFocus]) {
            [self.device setFocusPointOfInterest:focusPoint];
            [self.device setFocusMode:AVCaptureFocusModeAutoFocus];
        }
        
        if ([self.device isExposureModeSupported:AVCaptureExposureModeAutoExpose ]) {
            [self.device setExposurePointOfInterest:focusPoint];
            [self.device setExposureMode:AVCaptureExposureModeAutoExpose];
        }
        
        [self.device unlockForConfiguration];
        _focusView.center = point;
        _focusView.hidden = NO;
        [UIView animateWithDuration:0.3 animations:^{
            _focusView.transform = CGAffineTransformMakeScale(1.25, 1.25);
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                _focusView.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                _focusView.hidden = YES;
            }];
        }];
    }
    
}
#pragma mark - 截取照片
- (void) shutterCamera
{
    AVCaptureConnection * videoConnection = [self.ImageOutPut connectionWithMediaType:AVMediaTypeVideo];
    if (!videoConnection) {
        NSLog(@"take photo failed!");
        return;
    }
    
    [self.ImageOutPut captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        if (imageDataSampleBuffer == NULL) {
            return;
        }
                NSData * imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
//                self.image = [UIImage imageWithData:imageData];
//                [self.session stopRunning];
//                self.imageView = [[UIImageView alloc]initWithFrame:self.previewLayer.frame];
//                [self.view insertSubview:_imageView belowSubview:_PhotoButton];
//                self.imageView.layer.masksToBounds = YES;
//                self.imageView.image = _image;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"selectImage" object:[UIImage imageWithData:imageData]];
        [self.parentViewController.navigationController popViewControllerAnimated:YES];
    }];
}
#pragma mark - 检查相机权限
- (BOOL)canUserCamear{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusDenied) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"请打开相机权限" message:@"设置-隐私-相机" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        alertView.tag = 100;
        [alertView show];
        return NO;
    }
    else{
        return YES;
    }
    return YES;
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0 && alertView.tag == 100) {
        
        NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        
        if([[UIApplication sharedApplication] canOpenURL:url]) {
            
            [[UIApplication sharedApplication] openURL:url];
            
        }
    }
}

- (void)setUpBottomView {
    _bottomView = [[CameraCarBottomView alloc] initWithFrame:CGRectMake(0, MainHeight - SJ_StatusBarAndNavigationBarHeight - SJ_TabbarSafeBottomMargin - AutoSizeScaleY(110) - AutoSizeScaleY(231), MainWidth, AutoSizeScaleY(231))];
    _bottomView.delegate = self;
    _bottomView.hidden = YES;
    [self.view addSubview:_bottomView];
}

- (void)hiddenBottom {
    if (_bottomView.hidden) {
        _bottomView.hidden = NO;
    }
    _isflashOn = NO;
    [_bottomView.flashBtn setBackgroundImage:image(@"闪光灯关") forState:(UIControlStateNormal)];
}

- (void)cameraCarBottomViewButtonSelect:(UIButton *)btn {
    
    if (btn.tag == 1098) {
        [self shutterCamera];
    } else if (btn.tag == 1097) {
        [self flashOn];
    } else if (btn.tag == 1096) {
        [self usePhotoAlbum];
    }
}


- (void)setUpShowBottomView {
    _showBottomView = [[CapturePreviewBottomView alloc] initWithFrame:CGRectMake(0, MainHeight - SJ_StatusBarAndNavigationBarHeight - SJ_TabbarSafeBottomMargin - AutoSizeScaleY(80) - AutoSizeScaleY(80), MainWidth, AutoSizeScaleY(80))];
    _showBottomView.delegate = self;
    _showBottomView.hidden = YES;
    [self.view addSubview:_showBottomView];
}

- (void)capturePreviewBottomViewButtonSelect:(UIButton *)btn {
    _bottomView.hidden = NO;
    _showBottomView.hidden = YES;
    [self.imageView removeFromSuperview];
    [self.session startRunning];
}


- (void)usePhotoAlbum {
    UIImagePickerController * imagePC = [[UIImagePickerController alloc] init];
    imagePC.delegate = self;
    [imagePC.navigationBar setTintColor:kWhiteColor];
    [imagePC.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: kWhiteColor}];
    [imagePC.navigationBar setBarTintColor:kBaseBlueColor];
    imagePC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePC animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selectImage" object:info[UIImagePickerControllerOriginalImage]];
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self.parentViewController.navigationController popViewControllerAnimated:YES];
    
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}



- (void)hbActivityView {
    
    
    CGSize sizeRetangle = CGSizeMake(MainWidth - 60*2, MainWidth - 60*2);
    
    
    //扫码区域Y轴最小坐标
    CGFloat YMinRetangle = MainHeight / 2.0 - sizeRetangle.height/2.0 - AutoSizeScaleY(100);
    
    if (!_activityView)
    {
        self.activityView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        [_activityView setCenter:CGPointMake(60 +  sizeRetangle.width/2 - 50, YMinRetangle + sizeRetangle.height/2)];
        
        [_activityView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self.view addSubview:_activityView];
        
        CGRect labelReadyRect = CGRectMake(_activityView.frame.origin.x + _activityView.frame.size.width + 10, _activityView.frame.origin.y, 100, 30);
        self.labelReadying = [[UILabel alloc]initWithFrame:labelReadyRect];
        _labelReadying.backgroundColor = [UIColor clearColor];
        _labelReadying.textColor  = [UIColor whiteColor];
        _labelReadying.font = [UIFont systemFontOfSize:16.];
        _labelReadying.text = @"相机启动中...";
        
        [self.view addSubview:_labelReadying];
        
        [_activityView startAnimating];
    }
}

- (void)stopDeviceReadying
{
    if (_activityView) {
        
        [_activityView stopAnimating];
        [_activityView removeFromSuperview];
        [_labelReadying removeFromSuperview];
        
        self.activityView = nil;
        self.labelReadying = nil;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
