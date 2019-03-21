//
//  FlashlightsView.m
//  TMSystem
//
//  Created by sino on 2017/12/5.
//  Copyright © 2017年 Quincy-QC. All rights reserved.
//

#import "FlashlightsView.h"

@implementation FlashlightsView

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
      
        UIImageView *image = [[UIImageView alloc] initWithImage:image(@"照明")];
        [self addSubview:image];
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(AutoSizeScaleY(10));
            make.centerX.equalTo(self);
            make.height.mas_equalTo(AutoSizeScaleY(23));
            make.width.mas_equalTo(AutoSizeScaleX(18));
        }];
        
        UILabel *la = [[UILabel alloc] init];
        [la lableText:@"轻触照亮" color:0xFFFFFF font:12 textAlignment:1];
        [self addSubview:la];
        [la mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(image.mas_bottom).offset(AutoSizeScaleY(6));
            make.centerX.equalTo(self);
            make.height.mas_equalTo(AutoSizeScaleY(15));
            make.width.mas_equalTo(AutoSizeScaleX(60));
        }];
        
    }
    return self;
}
@end
