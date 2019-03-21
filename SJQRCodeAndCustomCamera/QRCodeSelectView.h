//
//  QRCodeSelectView.h
//  TMSystem
//
//  Created by sino on 2017/12/4.
//  Copyright © 2017年 Quincy-QC. All rights reserved.
//
typedef NS_ENUM(NSInteger,QRCodeType) {
    HaveQRCode,
    NoneQRCode
};

#import <UIKit/UIKit.h>

@protocol QRCodeSelectViewDelegate<NSObject>

- (void)selecrQRCodelWithQRCodeSelectView:(UIView *)view;

@end

@interface QRCodeSelectView : UIView

@property (nonatomic,assign) BOOL isLocating;
@property (nonatomic,assign) BOOL isQRCode;

@property (nonatomic,weak) id<QRCodeSelectViewDelegate> delegatge;
- (instancetype)initWithFrame:(CGRect)frame QRCodeType:(QRCodeType)QRCodeType;

@end
