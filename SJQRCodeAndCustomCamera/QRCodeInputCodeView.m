//
//  QRCodeInputCodeView.m
//  TMSystem
//
//  Created by sino on 2017/12/5.
//  Copyright © 2017年 Quincy-QC. All rights reserved.
//

#import "QRCodeInputCodeView.h"

//@interface QRCodeInputCodeView ()<UITextFieldDelegate>
//
//@end

@implementation QRCodeInputCodeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel *la = [[UILabel alloc] init];
        [la lableText:@"扫不了？输入编码绑定吧！" color:0xFFFFFF font:15 textAlignment:1];
        [self addSubview:la];
        [la mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.centerX.equalTo(self);
            make.width.mas_equalTo(AutoSizeScaleX(220));
            make.height.mas_equalTo(AutoSizeScaleY(15));
        }];
        
        _codeTF = [[UITextField alloc] init];
//        _codeTF.delegate = self;
        _codeTF.keyboardType = UIKeyboardTypeNumberPad;
        _codeTF.layer.borderColor= RGBOF(0x999999).CGColor;
        _codeTF.layer.borderWidth= 1.0f;
        _codeTF.backgroundColor = RGBOF(0xFFFFFF);
        _codeTF.layer.masksToBounds = YES;
        _codeTF.layer.cornerRadius = AutoSizeScaleY(4);
        [self addSubview:_codeTF];
        [_codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(AutoSizeScaleX(33));
            make.top.equalTo(la.mas_bottom).offset(AutoSizeScaleY(26));
            make.width.mas_equalTo(AutoSizeScaleX(220));
            make.height.mas_equalTo(AutoSizeScaleY(40));
        }];
        
        _sureBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_sureBtn btnText:@"确定" color:0xFFFFFF font:16];
        [_sureBtn setBackgroundColor:kBaseBlueColor];
        _sureBtn.layer.masksToBounds = YES;
        _sureBtn.layer.cornerRadius = AutoSizeScaleY(4);
        [self addSubview:_sureBtn];
        [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_codeTF.mas_right).offset(AutoSizeScaleX(10));
            make.centerY.equalTo(_codeTF);
            make.height.mas_equalTo(AutoSizeScaleY(40));
            make.right.offset(-AutoSizeScaleX(32));
        }];
        
        
    }
    return self;
}

@end
