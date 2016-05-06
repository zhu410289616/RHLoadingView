//
//  RHLoadingView.m
//  Example
//
//  Created by zhuruhong on 16/5/5.
//  Copyright © 2016年 zhuruhong. All rights reserved.
//

#import "RHLoadingView.h"
#import "Masonry.h"

CGFloat const kLoadingWidth = 180.0f;
CGFloat const kLoadingHeight = 110.0f;

@implementation RHLoadingView

- (void)dealloc
{
#ifdef DEBUG
    NSLog(@"[dealloc] RHLoadingView...");
#endif
}

- (void)showWithMessage:(NSString *)message duration:(NSTimeInterval)duration type:(JQIndicatorType)type
{
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    
    CGRect frame = CGRectMake((width - kLoadingWidth) / 2, (height - kLoadingHeight) / 2, kLoadingWidth, kLoadingHeight);
    _detailView = [[RHLoadingDetailView alloc] initWithFrame:frame];
    [self addSubview:_detailView];
    
    [_detailView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@(kLoadingWidth));
    }];
    _detailView.indicatorType = type;
    [_detailView showWithMessage:message duration:duration];
    
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
    [_detailView.indicatorView stopAnimating];
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
