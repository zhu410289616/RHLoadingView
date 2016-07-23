//
//  RHLoadingView.m
//  Example
//
//  Created by zhuruhong on 16/5/5.
//  Copyright © 2016年 zhuruhong. All rights reserved.
//

#import "RHLoadingView.h"
#import "Masonry.h"

CGFloat const RHLoadingWidth = 180.0f;
CGFloat const RHLoadingHeight = 110.0f;

@implementation RHLoadingView

- (void)dealloc
{
#ifdef DEBUG
    NSLog(@"[dealloc] RHLoadingView...");
#endif
}

- (RHLoadingDetailView *)createDetailViewWithIndicatorType:(JQIndicatorType)type
{
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    
    CGRect frame = CGRectMake((width - RHLoadingWidth) / 2, (height - RHLoadingHeight) / 2, RHLoadingWidth, RHLoadingHeight);
    RHLoadingDetailView *loadingView = [[RHLoadingDetailView alloc] initWithFrame:frame];
    loadingView.indicatorType = type;
    [self addSubview:loadingView];
    
    [loadingView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@(RHLoadingWidth));
        make.height.greaterThanOrEqualTo(@(RHLoadingHeight));
    }];
    
    return loadingView;
}

- (void)showWithType:(JQIndicatorType)type duration:(NSTimeInterval)duration
{
    _detailView = [self createDetailViewWithIndicatorType:type];
    [_detailView show];
    
    [self hide:YES afterDelay:duration];
}

- (void)showWithType:(JQIndicatorType)type duration:(NSTimeInterval)duration message:(NSString *)message
{
    _detailView = [self createDetailViewWithIndicatorType:type];
    [_detailView showWithMessage:message];
    
    [self hide:YES afterDelay:duration];
}

- (void)hide:(BOOL)animated afterDelay:(NSTimeInterval)delay
{
    [self performSelector:@selector(hideDelayed:) withObject:@(animated) afterDelay:delay];
}

- (void)hideDelayed:(NSNumber *)animated
{
    [self hide:[animated boolValue]];
}

- (void)hide:(BOOL)animated
{
    if (animated) {
        [UIView animateWithDuration:0.3f animations:^{
            self.alpha = 0.0f;
        } completion:^(BOOL finished) {
            [self dismiss];
        }];
    } else {
        [self dismiss];
    }
}

- (void)dismiss
{
    [_detailView hide];
    if (_delegate && [_delegate respondsToSelector:@selector(didLoadingViewHide)]) {
        [_delegate didLoadingViewHide];
    } else {
        [self removeFromSuperview];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
