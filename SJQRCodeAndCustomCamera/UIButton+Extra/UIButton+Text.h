//
//  UIButton+Text.h
//  LaiHuoLa
//
//  Created by 魏礼明 on 16/12/27.
//  Copyright © 2016年 Quincy-QC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Text)

- (void)btnText:(NSString *)string color:(unsigned int)hex font:(float)font;

- (void)btnNormalImage:(NSString *)normalImage highLightImage:(NSString *)highLightImage;

- (void)btnText:(NSString *)string backgroundColor:(unsigned int)backgroundHex color:(unsigned int)hex font:(float)font;
@end
