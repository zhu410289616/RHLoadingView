//
//  RHLoadingView.m
//  Example
//
//  Created by zhuruhong on 16/5/5.
//  Copyright © 2016年 zhuruhong. All rights reserved.
//

#import "RHLoadingView.h"
#import "Masonry.h"

@implementation RHLoadingView

- (void)setup
{
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    
    _tintColor = [UIColor whiteColor];
    _indicatorType = JQIndicatorTypeCyclingCycle;
    _indicatorSize = CGSizeMake(60, 60);
    _textFont = [UIFont systemFontOfSize:14.0f];
}

- (instancetype)init
{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)dealloc
{
#ifdef DEBUG
    NSLog(@"[dealloc] RHLoadingView...");
#endif
}

- (void)showWithMessage:(NSString *)message duration:(NSTimeInterval)duration
{
    //
    _indicatorView = [[JQIndicatorView alloc] initWithType:_indicatorType tintColor:_tintColor size:_indicatorSize];
    _indicatorView.center = CGPointMake(CGRectGetWidth(self.frame)/2, _indicatorSize.height/2 + 15);
    [self addSubview:_indicatorView];
    [_indicatorView startAnimating];
    
    //
    _textLabel = [[UILabel alloc] init];
    _textLabel.textAlignment = NSTextAlignmentCenter;
    _textLabel.textColor = _tintColor;
    _textLabel.font = _textFont;
    _textLabel.numberOfLines = 0;
    _textLabel.text = message;
    [self addSubview:_textLabel];
    
    //
    [_textLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(_indicatorSize.height + 30);
        make.bottom.equalTo(self).offset(-15);
        make.left.equalTo(self).offset(15);
        make.right.equalTo(self).offset(-15);
    }];
    
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
    [_indicatorView stopAnimating];
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
