//
//  LoginQRCodeViewController.h
//  TMSystem
//
//  Created by sino on 2019/2/18.
//  Copyright © 2019年 Quincy-QC. All rights reserved.
//

#import "LBXScanViewController.h"

@interface LoginQRCodeViewController : LBXScanViewController
- (void)qrCodeVcOpenAndCloseElect;

/*!
 *  停止扫码
 */
- (void)stopScan;

- (void)qrStartScan;

- (void)onlyStopScan;
@end
