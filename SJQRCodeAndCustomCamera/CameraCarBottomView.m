//
//  CameraCarBottomView.m
//  TMSystem
//
//  Created by sino on 2019/2/18.
//  Copyright © 2019年 Quincy-QC. All rights reserved.
//

#import "CameraCarBottomView.h"
@interface CameraCarBottomView()

@end
@implementation CameraCarBottomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = RGBAOF(0x272727, 0.4);
        
        
        UILabel *titleLa = [[UILabel alloc] init];
        [titleLa lableText:@"识别车牌号,自动查找运单" color:0xBFBFBF font:15 textAlignment:1];
        [self addSubview:titleLa];
        [titleLa mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(AutoSizeScaleY(16));
            make.centerX.equalTo(self);
        }];
        
        UIButton *cameraBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        cameraBtn.tag = 1098;
        [cameraBtn addTarget:self action:@selector(camera:) forControlEvents:(UIControlEventTouchUpInside)];
        [cameraBtn setBackgroundImage:image(@"登录拍照") forState:(UIControlStateNormal)];
        [self addSubview:cameraBtn];
        [cameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(AutoSizeScaleY(61));
            make.centerX.equalTo(self);
        }];
        
        
        
        _flashBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _flashBtn.tag = 1097;
//        [_flashBtn setBackgroundColor:kWhiteColor];
        [_flashBtn addTarget:self action:@selector(flash:) forControlEvents:(UIControlEventTouchUpInside)];
        [_flashBtn setBackgroundImage:image(@"闪光灯关") forState:(UIControlStateNormal)];
        [self addSubview:_flashBtn];
        [_flashBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cameraBtn);
            make.left.offset(AutoSizeScaleX(49));
            make.height.mas_equalTo(AutoSizeScaleY(30));
            make.width.mas_equalTo(AutoSizeScaleX(40));
        }];
        
        UIButton *photoBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        photoBtn.tag = 1096;
        [photoBtn addTarget:self action:@selector(photo:) forControlEvents:(UIControlEventTouchUpInside)];
        [photoBtn setBackgroundImage:image(@"选择相册") forState:(UIControlStateNormal)];
        [self addSubview:photoBtn];
        [photoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cameraBtn);
            make.right.offset(AutoSizeScaleX(-49));
        }];
        
    }
    return self;
}

- (void)flash:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(cameraCarBottomViewButtonSelect:)]) {
        
        [self.delegate cameraCarBottomViewButtonSelect:sender];
    }
}

- (void)camera:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(cameraCarBottomViewButtonSelect:)]) {
        
        [self.delegate cameraCarBottomViewButtonSelect:sender];
    }
}

- (void)photo:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(cameraCarBottomViewButtonSelect:)]) {
        
        [self.delegate cameraCarBottomViewButtonSelect:sender];
    }
}


@end
