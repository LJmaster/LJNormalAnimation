//
//  MMTriangleView.m
//  MMCalculator
//
//  Created by 杰刘 on 2017/6/7.
//
//

#import "MMTriangleView.h"

@implementation MMTriangleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}
-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    /*画三角形*/
    //只要三个点就行跟画一条线方式一样，把三点连接起来
    CGPoint sPoints[4];//坐标点
    sPoints[0] =CGPointMake(rect.size.width/2, 0);//坐标1
    sPoints[1] =CGPointMake(rect.size.width, 0);//坐标2
    sPoints[2] =CGPointMake(0, rect.size.height);//坐标3
    sPoints[3] =CGPointMake(0, rect.size.height/2);//坐标3
    CGContextAddLines(context, sPoints, 4);//添加线
    CGContextSetLineWidth(context, 0.0);//线的宽度
    UIColor * aColor = [UIColor redColor];//色
    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
    CGContextClosePath(context);//封起来
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
