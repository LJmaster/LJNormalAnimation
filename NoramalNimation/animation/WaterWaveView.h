//
//  WaterWaveView.h
//  Qmsocks
//
//  Created by 杰刘 on 2017/7/17.
//  Copyright © 2017年 qm1024.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterWaveView : UIView
@property (nonatomic, strong)   UIColor *firstWaveColor;    // 第一个波浪颜色
@property (nonatomic, strong)   UIColor *secondWaveColor;   // 第二个波浪颜色
@property (nonatomic, strong)   UIColor *threeWaveColor;   // 第二个波浪颜色

@property (nonatomic, assign)   CGFloat percent;            // 百分比

-(void) startWave;
-(void) stopWave;
-(void) reset;

@end
