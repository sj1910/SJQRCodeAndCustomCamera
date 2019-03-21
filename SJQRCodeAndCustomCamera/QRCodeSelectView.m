//
//  QRCodeSelectView.m
//  TMSystem
//
//  Created by sino on 2017/12/4.
//  Copyright © 2017年 Quincy-QC. All rights reserved.
//

#import "QRCodeSelectView.h"
@interface QRCodeSelectView ()

@property (nonatomic,strong) UIView *qrCodeView;

@property (nonatomic,strong) UIView *areaView;

@end
@implementation QRCodeSelectView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame QRCodeType:(QRCodeType)QRCodeType {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = RGBOF(0xEEEEEE);
        
        if (QRCodeType == HaveQRCode) {
            _qrCodeView = [[UIView alloc] init];
            [self addSubview:_qrCodeView];
            [_qrCodeView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(0);
                make.top.offset(0);
                make.bottom.offset(0);
                make.width.mas_equalTo(AutoSizeScaleX(100));
            }];
            _qrCodeView.tag = 332;
            UITapGestureRecognizer *qrTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
            [_qrCodeView addGestureRecognizer:qrTap];
            
            UIImageView *qrImage = [[UIImageView alloc] initWithImage:image(@"扫描")];
            [_qrCodeView addSubview:qrImage];
            [qrImage mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(AutoSizeScaleX(17));
                make.centerY.equalTo(self);
                make.height.mas_equalTo(AutoSizeScaleY(20));
                make.width.mas_equalTo(AutoSizeScaleX(21));
            }];
            
            UILabel *qrLa = [[UILabel alloc] init];
            [qrLa lableText:@"扫描" color:0x1B81E9 font:15 textAlignment:0];
            [_qrCodeView addSubview:qrLa];
            [qrLa mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(AutoSizeScaleX(48));
                make.centerY.equalTo(self);
                make.height.mas_equalTo(AutoSizeScaleY(21));
                make.width.mas_equalTo(AutoSizeScaleX(40));
            }];
        }
        
        _areaView = [[UIView alloc] init];
        [self addSubview:_areaView];
        [_areaView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(0);
            make.top.offset(0);
            make.bottom.offset(0);
            make.width.mas_equalTo(AutoSizeScaleX(100));
        }];
        _areaView.tag = 333;
        _areaView.hidden = YES;
        UITapGestureRecognizer *areaTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
        [_areaView addGestureRecognizer:areaTap];
        
        UIImageView *areaImage = [[UIImageView alloc] initWithImage:image(@"扫码定位")];
        [_areaView addSubview:areaImage];
        [areaImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-AutoSizeScaleX(57));
            make.centerY.equalTo(self);
            make.height.mas_equalTo(AutoSizeScaleY(20));
            make.width.mas_equalTo(AutoSizeScaleX(17));
        }];
        
        UILabel *areaLa = [[UILabel alloc] init];
        [areaLa lableText:@"定位" color:0x1B81E9 font:15 textAlignment:2];
        [_areaView addSubview:areaLa];
        [areaLa mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-AutoSizeScaleX(16));
            make.centerY.equalTo(self);
            make.height.mas_equalTo(AutoSizeScaleY(21));
            make.width.mas_equalTo(AutoSizeScaleX(40));
        }];
        
        
    }
    return self;
}

- (void)tapView:(UITapGestureRecognizer *)tap {
    
    UIView *view = tap.view;
    if ([self respondsToSelector:@selector(tapView:)]) {
        [self.delegatge selecrQRCodelWithQRCodeSelectView:view];
    }
    
}

- (void)setIsLocating:(BOOL)isLocating {
    _isLocating = isLocating;
    _areaView.hidden = !isLocating;
}

- (void)setIsQRCode:(BOOL)isQRCode {
    _isQRCode = isQRCode;
    _qrCodeView.hidden = !isQRCode;
}
@end
