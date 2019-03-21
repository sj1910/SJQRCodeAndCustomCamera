//
//  UIButton+countDown.h
//  LiquoriceDoctorProject
//

#import <UIKit/UIKit.h>

@interface UIButton (countDown)

/**
 *  倒计时按钮
 *
 *  @param timeLine 倒计时总时间
 *  @param title    还没倒计时的title
 *  @param subTitle 倒计时中的子名字，如时、分
 */
- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(unsigned int)mainHex countColor:(unsigned int)countHex;

@end
