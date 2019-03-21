//
//  CapturePreviewBottomView.m
//  TMSystem
//
//  Created by sino on 2019/2/18.
//  Copyright © 2019年 Quincy-QC. All rights reserved.
//

#import "CapturePreviewBottomView.h"

@implementation CapturePreviewBottomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = kBaseBlueColor;
        
        UIButton *againBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [againBtn addTarget:self action:@selector(again:) forControlEvents:(UIControlEventTouchUpInside)];
        [againBtn setTitle:@"重拍" forState:(UIControlStateNormal)];
        [againBtn setTitleColor:kWhiteColor forState:(UIControlStateNormal)];
        againBtn.titleLabel.font = Font(18);
        [self addSubview:againBtn];
        [againBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.offset(AutoSizeScaleX(32));
        }];
        
        
        UIButton *useBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [useBtn addTarget:self action:@selector(use:) forControlEvents:(UIControlEventTouchUpInside)];
        [useBtn setTitle:@"使用照片" forState:(UIControlStateNormal)];
        [useBtn setTitleColor:kWhiteColor forState:(UIControlStateNormal)];
        useBtn.titleLabel.font = Font(18);
        [self addSubview:useBtn];
        [useBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.offset(AutoSizeScaleX(-32));
        }];
    
    }
    return self;
}

- (void)again:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(capturePreviewBottomViewButtonSelect:)]) {
        
        [self.delegate capturePreviewBottomViewButtonSelect:sender];
    }
}

- (void)use:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(capturePreviewBottomViewButtonSelect:)]) {
        
        [self.delegate capturePreviewBottomViewButtonSelect:sender];
    }
}

@end
