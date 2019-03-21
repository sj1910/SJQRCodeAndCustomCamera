//
//  CameraCarBottomView.h
//  TMSystem
//
//  Created by sino on 2019/2/18.
//  Copyright © 2019年 Quincy-QC. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CameraCarBottomViewDelegate<NSObject>
- (void)cameraCarBottomViewButtonSelect:(UIButton *)btn;
@end
@interface CameraCarBottomView : UIView
@property (nonatomic, weak) id <CameraCarBottomViewDelegate>delegate;
@property (nonatomic,strong) UIButton *flashBtn;
@end
