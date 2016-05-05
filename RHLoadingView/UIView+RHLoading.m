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
    
    RHLoadingView *loadingView = [[RHLoadingView alloc] initWithIndicatorType:JQIndicatorTypeCyclingCycle tintColor:[UIColor whiteColor] size:CGSizeMake(40, 40)];
    [self rh_setLoadingView:loadingView];
    loadingView.delegate = self;
    
    [self addSubview:loadingView];
    [self bringSubviewToFront:loadingView];
}

- (void)rh_showLoadingWithWaiting
{
    [self rh_showLoadingWithMessage:@"请稍后"];
}

- (void)rh_showLoadingWithMessage:(NSString *)message
{
    [self rh_showLoadingWithMessage:message duration:60.0f];
}

- (void)rh_showLoadingWithMessage:(NSString *)message duration:(NSTimeInterval)duration
{
    [self rh_checkCreateLoadingView];
    [[self rh_loadingView] mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@(100));
        make.height.equalTo(@(80));
    }];
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
