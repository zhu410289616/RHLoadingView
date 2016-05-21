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

#pragma mark - waiting

- (void)rh_showWaitingWithDefault;

- (void)rh_showWaitingWithMusic2;
- (void)rh_showWaitingWithBounceSpot2;

- (void)rh_showWaitingWithBounceSpot1;
- (void)rh_showWaitingWithCyclingLine;
- (void)rh_showWaitingWithCyclingCycle;

- (void)rh_showWaitingWithType:(JQIndicatorType)type;

#pragma mark - common function

- (RHLoadingView *)rh_loadingView;

- (void)rh_showLoadingWithType:(JQIndicatorType)type duration:(NSTimeInterval)duration;
- (void)rh_showLoadingWithType:(JQIndicatorType)type duration:(NSTimeInterval)duration message:(NSString *)message;
- (void)rh_hideLoading:(BOOL)animated;

@end
