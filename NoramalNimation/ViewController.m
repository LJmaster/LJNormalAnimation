//
//  ViewController.m
//  NoramalNimation
//
//  Created by 杰刘 on 2017/8/14.
//  Copyright © 2017年 刘杰. All rights reserved.
//

#import "ViewController.h"
#import "RoundLoadView.h"
#import "WaterWaveView.h"
#import "CircleRippleView.h"

@interface ViewController ()
@property (nonatomic,strong) RoundLoadView * roundLoadView;

@property (nonatomic,strong) WaterWaveView * wateWaveView;

@property (nonatomic,strong) CircleRippleView * circleRippleView;

@property (nonatomic,strong)UIView * showview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0; i < 3; i++) {
        int buttonW = (self.view.frame.size.width - 160)/3;
        int buttomH = 40;
        UIButton * button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        button.frame = CGRectMake(40 * (i + 1) + buttonW * i, 100, buttonW, buttomH);
        button.tag = 100 + i;
        button.backgroundColor = [UIColor redColor];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        if (i == 0) {
            [button setTitle:@"RoundLoad" forState:(UIControlStateNormal)];
        }
        if (i ==1) {
            [button setTitle:@"CircleRipple" forState:(UIControlStateNormal)];

        }
        if (i == 2) {
            [button setTitle:@"wateWave" forState:(UIControlStateNormal)];

        }
        [self.view addSubview:button];
        [button addTarget:self action:@selector(onclickanimation:) forControlEvents:(UIControlEventTouchUpInside)];
    }

    
    _showview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _showview.center = self.view.center;
    _showview.layer.masksToBounds = YES;
    _showview.layer.cornerRadius = 50;
    _showview.backgroundColor = [UIColor redColor];
    [self.view addSubview:_showview];
    
    [self creatCircleRippleView];
    [self creatwateWaveView];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)creatroundLoadView{
    _roundLoadView = [[RoundLoadView alloc] initWithFrame:CGRectMake(_showview.frame.origin.x - 20, _showview.frame.origin.y - 20, 140, 140)];
    _roundLoadView.strokeColor = [UIColor redColor];
    _roundLoadView.progressWidth = 4;
    [self.view addSubview:_roundLoadView];
}
-(void)creatwateWaveView{
    _wateWaveView = [[WaterWaveView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 60, self.view.frame.size.width, 60)];
    _wateWaveView.secondWaveColor = [UIColor greenColor];
    _wateWaveView.firstWaveColor = [UIColor blueColor];
    _wateWaveView.percent = 0.8;
    [self.view addSubview:_wateWaveView];
}
-(void)creatCircleRippleView{
    _circleRippleView = [[CircleRippleView alloc] initWithFrame:CGRectMake(_showview.frame.origin.x - 20, _showview.frame.origin.y - 20, 140, 140)];
    _circleRippleView.center = self.view.center;
    _circleRippleView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_circleRippleView];

}

-(void)onclickanimation:(UIButton *)sender{
    if (sender.tag == 100) {
        [_circleRippleView stopAnimation];
        [self creatroundLoadView];
    }
    if (sender.tag == 101) {
        [_roundLoadView stopAnimation];
        [_roundLoadView hiddenAnimation];
        [_circleRippleView startAnimation];
        
    }
    if (sender.tag == 102) {
        [_wateWaveView startWave];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
