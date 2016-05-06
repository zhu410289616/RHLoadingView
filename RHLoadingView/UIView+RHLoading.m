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
    
    RHLoadingView *loadingView = [[RHLoadingView alloc] initWithFrame:self.bounds];
    loadingView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
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
    [[self rh_loadingView] showWithMessage:message duration:duration type:type];
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
