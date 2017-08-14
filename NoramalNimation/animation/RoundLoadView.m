//
//  RoundLoadView.m
//  Qmsocks
//
//  Created by 杰刘 on 2017/7/17.
//  Copyright © 2017年 qm1024.com. All rights reserved.
//

#import "RoundLoadView.h"

@interface RoundLoadView ()

@property (nonatomic,strong)CAShapeLayer * shapeLayer;

@property (nonatomic,strong)NSTimer * timer;

@end

@implementation RoundLoadView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.animationDuration = 1.0;
        self.progressWidth = 3.0;
        self.strokeColor = [UIColor redColor];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self setUpLoadProgress];
    
    
}
-(void)setUpLoadProgress{
    [self.layer removeAllAnimations];
    [self addAnimation];
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeProgressColor:) userInfo:nil repeats:YES];
    }
    
}
-(void)addAnimation{
    //旋转z轴 使每次重合的位置不同
    CABasicAnimation * rotationAnima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnima.fromValue = @0.0;
    rotationAnima.toValue = @(2 * M_PI);
    rotationAnima.duration = 9;
    rotationAnima.repeatCount = MAXFLOAT;
    [self.layer addAnimation:rotationAnima forKey:@"roration"];
    //strokeEnd 正向画出路径
    CABasicAnimation * endAni = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endAni.fromValue = @0.0;
    endAni.toValue = @1.0;
    endAni.duration = self.animationDuration;
    endAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    //strokeStart 反向清除路径
    CABasicAnimation *startAni = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startAni.fromValue = @0.0;
    startAni.toValue = @1.0;
    startAni.duration = self.animationDuration;
    startAni.beginTime = 1.0;
    startAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[endAni, startAni];
    group.repeatCount = MAXFLOAT;
    group.fillMode = kCAFillModeForwards;
    group.duration = 2*self.animationDuration;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.progressWidth, self.progressWidth, self.frame.size.width-self.progressWidth*2, self.frame.size.height-self.progressWidth*2)];
    self.shapeLayer.path = path.CGPath;
    
    [self.shapeLayer addAnimation:group forKey:@"group"];
    [self.layer addSublayer:self.shapeLayer];
}

/**
 *  随机改变进度条的颜色
 */
- (void)changeProgressColor:(NSTimer *)timer
{
    //    CGColorRef color = [self.progressColors[arc4random()%self.progressColors.count] CGColor];
    self.shapeLayer.strokeColor = self.strokeColor.CGColor;
}
-(CAShapeLayer *)shapeLayer{
    
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
        // 边缘线的类型
        _shapeLayer.lineCap = kCALineCapRound;
        // 线条宽度
        _shapeLayer.lineWidth = self.progressWidth;
        // 边缘线的颜色
        _shapeLayer.strokeColor = self.strokeColor.CGColor;
        //闭环填充的颜色
        _shapeLayer.fillColor = [UIColor clearColor].CGColor;
        _shapeLayer.strokeStart = 0.0;
        _shapeLayer.strokeEnd = 1.0;
    }
    
    return _shapeLayer;
}
- (void)dealloc
{
    [self.timer invalidate];
    self.timer = nil;
}


-(void)hiddenAnimation{
    self.hidden = YES;
}
-(void)AccordAnimation{
    self.hidden = NO;
}
-(void)startAnimation{
    [self resumeLayer:self.layer];
}
-(void)stopAnimation{
    [self pauseLayer:self.layer];
}

//暂停layer上面的动画
- (void)pauseLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}
- (void)resumeLayer:(CALayer*)layer
{
    
    [self pauseLayer:layer];
    
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}


@end

