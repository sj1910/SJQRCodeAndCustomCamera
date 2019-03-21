//
//  LoginQRCodeBottomView.h
//  TMSystem
//
//  Created by sino on 2019/2/18.
//  Copyright © 2019年 Quincy-QC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginQRCodeBottomViewDelegate<NSObject>
- (void)loginQRCodeBottomViewButtonSelect:(UIView *)view;
@end

@interface LoginQRCodeBottomView : UIView
@property (nonatomic, weak) id <LoginQRCodeBottomViewDelegate>delegate;
@end
