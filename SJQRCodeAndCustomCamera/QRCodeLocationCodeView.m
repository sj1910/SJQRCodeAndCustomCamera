//
//  QRCodeLocationCodeView.m
//  TMSystem
//
//  Created by sino on 2017/12/5.
//  Copyright © 2017年 Quincy-QC. All rights reserved.
//

#import "QRCodeLocationCodeView.h"

@implementation QRCodeLocationCodeView

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
        
        self.backgroundColor = RGBOF(0xFFFFFF);
        
        _codeLa = [[UILabel alloc] init];
        [_codeLa lableText:@"定位器编码" color:0x000000 font:15 textAlignment:0];
        [self addSubview:_codeLa];
        [_codeLa mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(AutoSizeScaleX(16));
            make.centerY.equalTo(self);
            make.height.mas_equalTo(AutoSizeScaleY(22));
            make.right.offset(-AutoSizeScaleX(16));
        }];
    }
    return self;
}
@end
