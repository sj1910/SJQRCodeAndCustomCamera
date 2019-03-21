//
//  LoginQRCodePromptView.m
//  TMSystem
//
//  Created by sino on 2019/2/18.
//  Copyright © 2019年 Quincy-QC. All rights reserved.
//

#import "LoginQRCodePromptView.h"

@implementation LoginQRCodePromptView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        UILabel *wordsLa = [[UILabel alloc] init];
        [wordsLa lableText:@"将二维码放入框内,即可自动扫描" color:0xFFFFFF font:15 textAlignment:1];
        [self addSubview:wordsLa];
        [wordsLa mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.centerX.equalTo(self);
        }];
        
        UILabel *qrLa = [[UILabel alloc] init];
        [qrLa lableText:@"扫描二维码,自动登录" color:0xFFFFFF font:18 textAlignment:1];
        [self addSubview:qrLa];
        [qrLa mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(wordsLa.mas_bottom).offset(AutoSizeScaleY(5));
            make.centerX.equalTo(self);
        }];
    }
    return self;
}

@end
