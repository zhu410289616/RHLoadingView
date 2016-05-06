//
//  UIView+RHLoading.h
//  Example
//
//  Created by zhuruhong on 16/5/5.
//  Copyright © 2016年 zhuruhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RHLoadingView.h"

@interface UIView (RHLoading) <RHLoadingViewDelegate>

- (void)rh_showLoadingWithWaiting;

- (void)rh_showLoadingWithWaitingMusic2;
- (void)rh_showLoadingWithWaitingBounceSpot1;
- (void)rh_showLoadingWithWaitingBounceSpot2;
- (void)rh_showLoadingWithWaitingCyclingLine;
- (void)rh_showLoadingWithWaitingCyclingCycle;

- (void)rh_showLoadingWithWaitingType:(JQIndicatorType)type;

#pragma mark - common function

- (RHLoadingView *)rh_loadingView;

- (void)rh_showLoadingWithMessage:(NSString *)message;
- (void)rh_showLoadingWithMessage:(NSString *)message duration:(NSTimeInterval)duration;
- (void)rh_showLoadingWithMessage:(NSString *)message duration:(NSTimeInterval)duration type:(JQIndicatorType)type;
- (void)rh_hideLoading:(BOOL)animated;

@end
