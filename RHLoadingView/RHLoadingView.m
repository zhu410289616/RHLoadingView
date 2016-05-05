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

- (instancetype)initWithIndicatorType:(JQIndicatorType)type
{
    return [self initWithIndicatorType:type tintColor:[UIColor whiteColor]];
}

- (instancetype)initWithIndicatorType:(JQIndicatorType)type tintColor:(UIColor *)color
{
    return [self initWithIndicatorType:type tintColor:color size:CGSizeMake(40, 40)];
}

- (instancetype)initWithIndicatorType:(JQIndicatorType)type tintColor:(UIColor *)color size:(CGSize)size
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        
        //
        _indicatorView = [[JQIndicatorView alloc] initWithType:type tintColor:color size:size];
        [self addSubview:_indicatorView];
        
        //
        _textLabel = [[UILabel alloc] init];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.textColor = color;
        _textLabel.font = [UIFont systemFontOfSize:14.0f];
        _textLabel.numberOfLines = 0;
        [self addSubview:_textLabel];
        
        //
        [_textLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.bottom.equalTo(self).offset(-10);
            make.left.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-10);
        }];
        
        //
        [_indicatorView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_textLabel);
            make.top.equalTo(self).offset(10);
            make.bottom.equalTo(_textLabel.mas_top).offset(-10);
            make.size.mas_equalTo(size);
        }];
        
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
    [_indicatorView startAnimating];
    _textLabel.text = message;
    [self layoutIfNeeded];
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
