//
//  LoginQRCodeBottomView.m
//  TMSystem
//
//  Created by sino on 2019/2/18.
//  Copyright © 2019年 Quincy-QC. All rights reserved.
//

#import "LoginQRCodeBottomView.h"
@interface LoginQRCodeBottomView()

@property (nonatomic,strong) UIImageView *qrCodeImg;
@property (nonatomic,strong) UILabel *qrCodeLa;

@property (nonatomic,strong) UIImageView *carImg;
@property (nonatomic,strong) UILabel *carLa;


@property (nonatomic,strong) UIView *qrCodeView;

@property (nonatomic,strong) UIView *carView;

@end
@implementation LoginQRCodeBottomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = kBlackColor;
        
        _qrCodeView = [[UIView alloc] init];
        _qrCodeView.tag = 1119;
        UITapGestureRecognizer *qrCodeViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(qrCode:)];
        [_qrCodeView addGestureRecognizer:qrCodeViewTap];
        [self addSubview:_qrCodeView];
        [_qrCodeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.offset(0);
            make.width.mas_equalTo(self.width/2);
        }];
        
        _carView = [[UIView alloc] init];
        _carView.tag = 1118;
        UITapGestureRecognizer *carViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(carImage:)];
        [_carView addGestureRecognizer:carViewTap];
        [self addSubview:_carView];
        [_carView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.offset(0);
            make.width.mas_equalTo(self.width/2);
        }];
        
        
        
        _qrCodeImg = [[UIImageView alloc] initWithImage:image(@"扫描二维码-亮")];
        [self addSubview:_qrCodeImg];
        [_qrCodeImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(AutoSizeScaleY(22));
            make.left.offset(AutoSizeScaleX(81));
        }];
        
        _qrCodeLa = [[UILabel alloc] init];
        [_qrCodeLa lableText:@"二维码" color:0x4A94FF font:12 textAlignment:1];
        [self addSubview:_qrCodeLa];
        [_qrCodeLa mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_qrCodeImg.mas_bottom).offset(AutoSizeScaleY(2));
            make.centerX.equalTo(_qrCodeImg);
        }];
        
        
        _carImg = [[UIImageView alloc] initWithImage:image(@"扫描车牌号-暗")];
        [self addSubview:_carImg];
        [_carImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_qrCodeImg);
            make.right.offset(AutoSizeScaleX(-83));
        }];
        
        _carLa = [[UILabel alloc] init];
        [_carLa lableText:@"车牌号" color:0xB2B2B2 font:12 textAlignment:1];
        [self addSubview:_carLa];
        [_carLa mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_qrCodeImg.mas_bottom).offset(AutoSizeScaleY(2));
            make.centerX.equalTo(_carImg);
        }];
    }
    return self;
}

- (void)qrCode:(UITapGestureRecognizer *)sender {
    
    if ([_qrCodeLa.textColor isEqual:RGBOF(0xB2B2B2)]) {
        _qrCodeImg.image = image(@"扫描二维码-亮");
        _qrCodeLa.textColor = RGBOF(0x4A94FF);
        _carImg.image = image(@"扫描车牌号-暗");
        _carLa.textColor = RGBOF(0xB2B2B2);
        
        if ([self.delegate respondsToSelector:@selector(loginQRCodeBottomViewButtonSelect:)]) {
            
            [self.delegate loginQRCodeBottomViewButtonSelect:sender.view];
        }
    }
    
    
}

- (void)carImage:(UITapGestureRecognizer *)sender {
    
    if ([_qrCodeLa.textColor isEqual:RGBOF(0x4A94FF)]) {
        
        _qrCodeImg.image = image(@"扫描二维码-暗");
        _qrCodeLa.textColor = RGBOF(0xB2B2B2);
        _carImg.image = image(@"扫描车牌号-亮");
        _carLa.textColor = RGBOF(0x4A94FF);
        
        if ([self.delegate respondsToSelector:@selector(loginQRCodeBottomViewButtonSelect:)]) {
            
            [self.delegate loginQRCodeBottomViewButtonSelect:sender.view];
        }
    }
    
    
}

@end
