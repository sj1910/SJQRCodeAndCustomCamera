//
//  SJHeader.h
//  SJQRCodeAndCustomCamera
//
//  Created by sino on 2019/3/21.
//  Copyright © 2019年 sino. All rights reserved.
//

#ifndef SJHeader_h
#define SJHeader_h

//当前屏幕长、宽
#define MainWidth [UIScreen mainScreen].bounds.size.width
#define MainHeight [UIScreen mainScreen].bounds.size.height

// Status bar height.
#define  SJ_StatusBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height)

// iPhone X
#define  SJ_iPhoneX (SJ_StatusBarHeight > 20)
// navigation bar height.

#define  SJ_StatusBarAndNavigationBarHeight  (SJ_StatusBarHeight + 44.f)

#define  SJ_TabbarSafeBottomMargin  (SJ_iPhoneX ? 34.f : 0.f)

#define AutoSizeScaleX(X) X/2*MainWidth/375
#define AutoSizeScaleY(Y) Y/2*MainHeight/667

#define windowView  [UIApplication sharedApplication].keyWindow

// 图片
#define image(string) [[UIImage imageNamed:string]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]

// 字体
#define Font(size) [UIFont systemFontOfSize:AutoSizeScaleX(size)]

#define FontBold(size) [UIFont boldSystemFontOfSize:AutoSizeScaleX(size)]


#define WeakObj(o) try{}@finally{} __weak typeof(o) o##Weak = o

#define StrongObj(o) try{}@finally{}  __strong typeof(o) o = o##Weak

#import "UIButton+Text.h"
#import "UILabel+Text.h"
#import <Masonry/Masonry.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "ColorHeaders.h"
#import "UIImage+Image.h"
#import "UIView+Extra.h"

#endif /* SJHeader_h */
