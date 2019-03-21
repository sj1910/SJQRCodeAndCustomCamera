//
//  QRCodeInputCodeView.h
//  TMSystem
//
//  Created by sino on 2017/12/5.
//  Copyright © 2017年 Quincy-QC. All rights reserved.
//
//typedef void (^InputCode)(NSString *code);
#import <UIKit/UIKit.h>

@interface QRCodeInputCodeView : UIView
//@property (nonatomic,copy) InputCode inputCode;
@property (nonatomic,strong) UITextField *codeTF;
@property (nonatomic,strong) UIButton *sureBtn;
@end
