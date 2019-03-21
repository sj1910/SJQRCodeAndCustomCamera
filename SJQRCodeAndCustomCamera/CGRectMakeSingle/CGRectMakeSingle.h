//
//  CGRectMakeSingle.h
//  LaiHuoLa
//
//  Created by Quincy-QC on 16/1/18.
//  Copyright © 2016年 Quincy-QC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CGRectMakeSingle : NSObject

@property float autoSizeScaleX;

@property float autoSizeScaleY;

+ (CGRectMakeSingle *)share;

- (void)getXY;

+ (CGRect)CGRectMakeCustoms:(CGRect)rect;

@end
