//
//  RoundLoadView.h
//  Qmsocks
//
//  Created by 杰刘 on 2017/7/17.
//  Copyright © 2017年 qm1024.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoundLoadView : UIView
@property (nonatomic, assign) CGFloat animationDuration; /**<动画持续时长*/
@property (nonatomic, assign) CGFloat progressWidth; /**< 进度条宽度*/
@property (nonatomic, strong) UIColor * strokeColor;

//开始动画
-(void)startAnimation;
//暂停
-(void)stopAnimation;
//视图消失
-(void)hiddenAnimation;
//视图显示
-(void)AccordAnimation;

-(void)addAnimation;

@end
