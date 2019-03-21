//
//  LoginQRCodeViewController.m
//  TMSystem
//
//  Created by sino on 2019/2/18.
//  Copyright © 2019年 Quincy-QC. All rights reserved.
//

#import "LoginQRCodeViewController.h"
#import "FlashlightsView.h"
#import "QRCodeInputCodeView.h"
#import "LoginQRCodePromptView.h"
@interface LoginQRCodeViewController ()
@property (nonatomic,strong) FlashlightsView *flashlightsView;
@property (nonatomic,strong) QRCodeInputCodeView *qrCodeInputCodeView;
@end

@implementation LoginQRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"二维码";
    
    
    [self setUpFlashlightsView];
    [self setUpPromptWords];
    
}

#pragma mark ------ 手电筒 ------
- (void)setUpFlashlightsView {
    _flashlightsView = [[FlashlightsView alloc] initWithFrame:CGRectMake(MainWidth - AutoSizeScaleX(76), AutoSizeScaleY(10), AutoSizeScaleX(60), AutoSizeScaleY(54))];
    UITapGestureRecognizer *flashlightsTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openAndCloseElect:)];
    [_flashlightsView addGestureRecognizer:flashlightsTap];
    [self.view addSubview:_flashlightsView];
}

// 开关灯方法
- (void)openAndCloseElect:(UITapGestureRecognizer *)tap {
    [self openOrCloseFlash];
}

- (void)qrCodeVcOpenAndCloseElect {
   [self openOrCloseFlash];
}

#pragma mark ------- 扫描提示 ------
- (void)setUpPromptWords {
    
    LoginQRCodePromptView *promptView = [[LoginQRCodePromptView alloc] init];
    [self.view addSubview:promptView];
    [promptView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_centerY).offset(MainWidth/2 - AutoSizeScaleY(50));
        make.centerX.equalTo(self.view);
    }];
}

- (void)stopScan {
    [self.scanObj stopScan];
    [self.qRScanView stopScanAnimation];
    
}

- (void)onlyStopScan {
    [self.scanObj stopScan];
}

/**扫码结果*/
- (void)scanResultWithArray:(NSArray<LBXScanResult*>*)array
{
    [self.scanObj stopScan];
    [self.qRScanView stopScanAnimation];
    
    if (array.count < 1)
    {
        [self.scanObj startScan];
        [self.qRScanView startScanAnimation];
        
    } else {
        
        LBXScanResult *scanResult = array[0];
        NSString*strResult = scanResult.strScanned;
        self.scanImage = scanResult.imgScanned;
        if (!scanResult || !strResult || strResult.length==0) {
            
            [self.scanObj startScan];
            [self.qRScanView startScanAnimation];
            
        } else {
            
//            [self getAddWayBillWithGPEDeviceID:strResult];
            
        }
        //震动提醒
        //    [LBXScanWrapper systemVibrate];
        //声音提醒
        //    [LBXScanWrapper systemSound];
        
    }
}

- (void)qrStartScan {
    [self.scanObj startScan];
    [self.qRScanView startScanAnimation];
}

- (void)getQRcodeScanCodeWithClientV {
//    [HttpService sharedHttpService] getQRcodeScanCodeWithClientV
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
