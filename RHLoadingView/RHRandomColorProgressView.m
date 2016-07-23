//
//  RHRandomColorProgressView.m
//  Example
//
//  Created by zhuruhong on 16/7/23.
//  Copyright © 2016年 zhuruhong. All rights reserved.
//

#import "RHRandomColorProgressView.h"

@interface RHRandomColorProgressView ()

@property (nonatomic, assign) CGFloat lineWidth; /**<边框宽度*/
@property (nonatomic, strong) NSArray *lineColor; /**<边框颜色*/

@property (nonatomic, strong) CAShapeLayer *progressLayer; /**<进度条*/

@property (nonatomic, strong) NSTimer *randomTimer;

@end

@implementation RHRandomColorProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame
                  andLineWidth:3.0
                  andLineColor:@[
                                 [UIColor redColor],
                                 [UIColor greenColor],
                                 [UIColor blueColor]]];
}

- (instancetype)initWithFrame:(CGRect)frame andLineWidth:(CGFloat)lineWidth andLineColor:(NSArray *)lineColor
{
    self = [super initWithFrame:frame];
    if(self) {
        self.lineWidth = lineWidth;
        self.lineColor = lineColor;
        
        [self setup];
    }
    
    return self;
}

- (void)setup
{
    NSAssert(self.lineWidth > 0.0, @"lineWidth must great than zero");
    NSAssert(self.lineColor.count > 0, @"lineColor must set");
    
    //外层旋转动画
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = @0.0;
    rotationAnimation.toValue = @(2*M_PI);
    rotationAnimation.repeatCount = HUGE_VALF;
    rotationAnimation.duration = 3.0;
    rotationAnimation.beginTime = 0.0;
    
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    //内层进度条动画
    CABasicAnimation *strokeAnim1 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeAnim1.fromValue = @0.0;
    strokeAnim1.toValue = @1.0;
    strokeAnim1.duration = 1.0;
    strokeAnim1.beginTime = 0.0;
    strokeAnim1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    //内层进度条动画
    CABasicAnimation *strokeAnim2 = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    strokeAnim2.fromValue = @0.0;
    strokeAnim2.toValue = @1.0;
    strokeAnim2.duration = 1.0;
    strokeAnim2.beginTime = 1.0;
    strokeAnim2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.duration = 2.0;
    animGroup.repeatCount = HUGE_VALF;
    animGroup.fillMode = kCAFillModeForwards;
    animGroup.animations = @[strokeAnim1, strokeAnim2];
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.lineWidth, self.lineWidth, CGRectGetWidth(self.frame)-self.lineWidth*2, CGRectGetHeight(self.frame)-self.lineWidth*2)];
    
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.lineWidth = self.lineWidth;
    self.progressLayer.lineCap = kCALineCapRound;
    self.progressLayer.strokeColor = ((UIColor *)self.lineColor[0]).CGColor;
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.strokeStart = 0.0;
    self.progressLayer.strokeEnd = 1.0;
    self.progressLayer.path = path.CGPath;
    [self.progressLayer addAnimation:animGroup forKey:@"strokeAnim"];
    
    [self.layer addSublayer:self.progressLayer];
    
    _randomTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(randomColor)
                                   userInfo:nil
                                    repeats:YES];
    
}

- (void)randomColor
{
    UIColor *color = (UIColor *)[self.lineColor objectAtIndex:arc4random()%self.lineColor.count];
    self.progressLayer.strokeColor = color.CGColor;
}

- (void)show
{
    [self setup];
}

- (void)hide
{
    [self.layer removeAnimationForKey:@"rotationAnimation"];
    [self.progressLayer removeAnimationForKey:@"strokeAnim"];
    [self.progressLayer removeFromSuperlayer];
    if (_randomTimer) {
        [_randomTimer invalidate];
        _randomTimer = nil;
    }
}

@end
