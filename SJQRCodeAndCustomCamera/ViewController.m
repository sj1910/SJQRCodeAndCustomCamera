//
//  ViewController.m
//  SJQRCodeAndCustomCamera
//
//  Created by sino on 2019/3/21.
//  Copyright © 2019年 sino. All rights reserved.
//


#import "ViewController.h"
#import "LoginQRCodeBottomView.h"
#import "LoginCameraViewController.h"
#import "LoginQRCodeViewController.h"
@interface ViewController ()<LoginQRCodeBottomViewDelegate>
@property (nonatomic,strong) LoginCameraViewController *cameraVC;
@property (nonatomic,strong) LoginQRCodeViewController *qrVC;
@property (nonatomic,strong) LoginQRCodeBottomView *bottomView;
@property (nonatomic,assign) BOOL isCarCam;
@property (nonatomic,strong) UIVisualEffectView *HUDView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"二维码/车牌号";
    [self setUpView];
    [self setUpLoginQRCodeBottomView];
    [self addBlurView];
//
    //监听是否重新进入程序程序.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillEnterPlayGround) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillEnterBackground) name:UIApplicationWillResignActiveNotification object:nil];
    
}

- (void)setUpView {
    [self setCameraVC];
    [self setQRCodeVC];
}

- (void)setCameraVC {
    
    _cameraVC = [[LoginCameraViewController alloc] init];
    //    _cameraVC.view.frame = CGRectMake(0, 0, MainWidth, MainHeight - SJ_StatusBarAndNavigationBarHeight - SJ_TabbarSafeBottomMargin - AutoSizeScaleY(80));
    [self.view addSubview:_cameraVC.view];
    [self addChildViewController:_cameraVC];
    
}

- (void)setQRCodeVC {
    
    _qrVC = [[LoginQRCodeViewController alloc] init];
    _qrVC.isOpenInterestRect = YES;
    
    [self.view addSubview:_qrVC.view];
    [self addChildViewController:_qrVC];
}

- (void)setUpLoginQRCodeBottomView {
    _bottomView = [[LoginQRCodeBottomView alloc] initWithFrame:CGRectMake(0, MainHeight - AutoSizeScaleY(110) - SJ_TabbarSafeBottomMargin - SJ_StatusBarAndNavigationBarHeight, MainWidth, AutoSizeScaleY(110))];
    _bottomView.delegate = self;
    [self.view addSubview:_bottomView];
}

- (void)loginQRCodeBottomViewButtonSelect:(UIView *)view {
    
    self.view.userInteractionEnabled = NO;
    _HUDView.hidden = NO;
    
    if (view.tag == 1119) {
        self.isCarCam = NO;
        [self performSelector:@selector(hiddenBlurView) withObject:nil afterDelay:1.5];
        if (_qrVC) {
            [self.view bringSubviewToFront:_qrVC.view];
            [_cameraVC stopDeviceReadying];
            [_qrVC qrStartScan];
        } else {
            [self setQRCodeVC];
        }
        
    } else {
        
        [self performSelector:@selector(hiddenBlurView) withObject:nil afterDelay:1];
        
        self.isCarCam = YES;
        if (_cameraVC) {
            [_cameraVC hiddenBottom];
            [self.view bringSubviewToFront:_cameraVC.view];
            [_qrVC stopScan];
            [_cameraVC startScan];
        } else {
            
            [self setCameraVC];
        }
    }
    [self.view bringSubviewToFront:_HUDView];
    
    [self.view bringSubviewToFront:_bottomView];
}

- (void)appWillEnterPlayGround {
    
    if (self.isCarCam){
        
        [_cameraVC startScan];
    } else {
        [_qrVC qrStartScan];
    }
    
    
}
- (void)appWillEnterBackground {
    if (!self.isCarCam) {
        [_qrVC onlyStopScan];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)addBlurView {
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    _HUDView = [[UIVisualEffectView alloc] initWithEffect:blur];
    //    _HUDView.alpha = 0.9f;
    _HUDView.frame = CGRectMake(0, 0, MainWidth, MainHeight - AutoSizeScaleX(80) - SJ_TabbarSafeBottomMargin - SJ_StatusBarAndNavigationBarHeight);
    _HUDView.hidden = YES;
    [self.view addSubview:_HUDView];
}

- (void)hiddenBlurView {
    _HUDView.hidden = YES;
    self.view.userInteractionEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
