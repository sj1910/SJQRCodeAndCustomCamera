//
//  UIButton+Text.m
//  LaiHuoLa
//
//  Created by 魏礼明 on 16/12/27.
//  Copyright © 2016年 Quincy-QC. All rights reserved.
//

#import "UIButton+Text.h"

@implementation UIButton (Text)

- (void)btnText:(NSString *)string color:(unsigned int)hex font:(float)font {
    [self setBackgroundColor:kBaseBlueColor];
    [self setTitle:string forState:(UIControlStateNormal)];
    [self setTitleColor:RGBOF(hex) forState:(UIControlStateNormal)];
    self.titleLabel.font = Font(font);
    
}

- (void)btnText:(NSString *)string backgroundColor:(unsigned int)backgroundHex color:(unsigned int)hex font:(float)font {
    [self setBackgroundColor:RGBOF(backgroundHex)];
    [self setTitle:string forState:(UIControlStateNormal)];
    [self setTitleColor:RGBOF(hex) forState:(UIControlStateNormal)];
    self.titleLabel.font = Font(font);
    
}


- (void)btnNormalImage:(NSString *)normalImage highLightImage:(NSString *)highLightImage {
    
    [self setImage:[[UIImage imageNamed:normalImage] imageWithRenderingMode:1] forState:(UIControlStateNormal)];
    [self setImage:[[UIImage imageNamed:highLightImage] imageWithRenderingMode:1] forState:(UIControlStateHighlighted)];

}
@end
