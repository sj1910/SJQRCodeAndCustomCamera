//
//  CapturePreviewBottomView.h
//  TMSystem
//
//  Created by sino on 2019/2/18.
//  Copyright © 2019年 Quincy-QC. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CapturePreviewBottomViewDelegate<NSObject>
- (void)capturePreviewBottomViewButtonSelect:(UIButton *)btn;
@end
@interface CapturePreviewBottomView : UIView
@property (nonatomic, weak) id <CapturePreviewBottomViewDelegate>delegate;
@end
