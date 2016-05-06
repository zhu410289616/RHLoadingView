//
//  UIView+RHLoading.m
//  Example
//
//  Created by zhuruhong on 16/5/5.
//  Copyright © 2016年 zhuruhong. All rights reserved.
//

#import "UIView+RHLoading.h"
#import <objc/runtime.h>
#import "Masonry.h"

const CGFloat loadingWidth = 180.0f;

static char rh_loadingViewKey;

@implementation UIView (RHLoading)

- (void)rh_showLoadingWithWaiting
{
    [self rh_showLoadingWithWaitingType:JQIndicatorTypeCyclingCycle];
}

- (void)rh_showLoadingWithWaitingMusic2
{
    [self rh_showLoadingWithWaitingType:JQIndicatorTypeMusic2];
}

- (void)rh_showLoadingWithWaitingBounceSpot1
{
    [self rh_showLoadingWithWaitingType:JQIndicatorTypeBounceSpot1];
}

- (void)rh_showLoadingWithWaitingBounceSpot2
{
    [self rh_showLoadingWithWaitingType:JQIndicatorTypeBounceSpot2];
}

- (void)rh_showLoadingWithWaitingCyclingLine
{
    [self rh_showLoadingWithWaitingType:JQIndicatorTypeCyclingLine];
}

- (void)rh_showLoadingWithWaitingCyclingCycle
{
    [self rh_showLoadingWithWaitingType:JQIndicatorTypeCyclingCycle];
}

- (void)rh_showLoadingWithWaitingType:(JQIndicatorType)type
{
    [self rh_showLoadingWithMessage:@"请稍后" duration:60.0f type:type];
}

#pragma mark - common function

- (RHLoadingView *)rh_loadingView
{
    return objc_getAssociatedObject(self, &rh_loadingViewKey);
}

- (void)rh_setLoadingView:(RHLoadingView *)loadingView
{
    objc_setAssociatedObject(self, &rh_loadingViewKey, loadingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)rh_checkCreateLoadingView
{
    if ([self rh_loadingView]) {
        return;
    }
    
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat loadingHeight = 110.0f;
    
    CGRect frame = CGRectMake((width - loadingWidth) / 2, (height - loadingHeight) / 2, loadingWidth, loadingHeight);
    RHLoadingView *loadingView = [[RHLoadingView alloc] initWithFrame:frame];
    [self rh_setLoadingView:loadingView];
    loadingView.delegate = self;
    
    [self addSubview:loadingView];
    [self bringSubviewToFront:loadingView];
}

- (void)rh_showLoadingWithMessage:(NSString *)message
{
    [self rh_showLoadingWithMessage:message duration:60.0f];
}

- (void)rh_showLoadingWithMessage:(NSString *)message duration:(NSTimeInterval)duration
{
    [self rh_showLoadingWithMessage:message duration:duration type:JQIndicatorTypeCyclingCycle];
}

- (void)rh_showLoadingWithMessage:(NSString *)message duration:(NSTimeInterval)duration type:(JQIndicatorType)type
{
    [self rh_checkCreateLoadingView];
    [[self rh_loadingView] mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@(loadingWidth));
    }];
    [self rh_loadingView].indicatorType = type;
    [[self rh_loadingView] showWithMessage:message duration:duration];
}

- (void)rh_hideLoading:(BOOL)animated
{
    [[self rh_loadingView] hide:animated];
}

#pragma mark - RHLoadingViewDelegate

- (void)didLoadingViewHide
{
    [[self rh_loadingView] removeFromSuperview];
    [self rh_loadingView].delegate = nil;
    [self rh_setLoadingView:nil];
}

@end
