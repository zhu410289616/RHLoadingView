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

#pragma mark - waiting

- (void)rh_showWaitingWithDefault
{
    [self rh_showWaitingWithType:JQIndicatorTypeCyclingCycle];
}

- (void)rh_showWaitingWithMusic2
{
    [self rh_showLoadingWithType:JQIndicatorTypeMusic2 duration:60.0f];
}

- (void)rh_showWaitingWithBounceSpot2
{
    [self rh_showLoadingWithType:JQIndicatorTypeBounceSpot2 duration:60.0f];
}

- (void)rh_showWaitingWithBounceSpot1
{
    [self rh_showWaitingWithType:JQIndicatorTypeBounceSpot1];
}

- (void)rh_showWaitingWithCyclingLine
{
    [self rh_showWaitingWithType:JQIndicatorTypeCyclingLine];
}

- (void)rh_showWaitingWithCyclingCycle
{
    [self rh_showWaitingWithType:JQIndicatorTypeCyclingCycle];
}

- (void)rh_showWaitingWithType:(JQIndicatorType)type
{
    [self rh_showLoadingWithType:type duration:60.0f message:@"请稍候"];
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

- (void)rh_showLoadingWithType:(JQIndicatorType)type duration:(NSTimeInterval)duration
{
    [self rh_checkCreateLoadingView];
    [[self rh_loadingView] showWithType:type duration:duration];
}

- (void)rh_showLoadingWithType:(JQIndicatorType)type duration:(NSTimeInterval)duration message:(NSString *)message
{
    [self rh_checkCreateLoadingView];
    [[self rh_loadingView] showWithType:type duration:duration message:message];
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
