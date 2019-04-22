//
//  ViewController.m
//  runtimeStudy
//
//  Created by 冯思 on 2019/3/13.
//  Copyright © 2019 冯思. All rights reserved.
//

#import "ViewController.h"
#import <mediaplayer/mediaplayer.h>
@interface ViewController ()
@property(nonatomic,strong)MPMoviePlayerController *playerController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self test];
}

-(void)test{
    NSURL  *url=[NSURL URLWithString:@"https://testesm.oss-cn-beijing.aliyuncs.com/studySituation/2/2/01.mp4"];
    self.playerController =[[MPMoviePlayerController alloc]initWithContentURL:url];
    self.playerController.view.frame = self.view.bounds;
    [self.playerController.view addSubview:[self playButton]];
    [self.view addSubview: self.playerController.view];
    //设置控制面板风格:无，嵌入，全屏，默认
    self.playerController.controlStyle = MPMovieControlStyleDefault;
    //设置是否自动播放(默认为YES）
    self.playerController.shouldAutoplay = NO;
    //设置播放器显示模式，类似于图片的处理，设置Fill有可能造成部分区域被裁剪
    self.playerController.scalingMode = MPMovieScalingModeAspectFit;
    //设置重复模式
    self.playerController.repeatMode = MPMovieRepeatModeOne;
    [self.playerController setControlStyle:MPMovieControlStyleNone];
    self.playerController.repeatMode=MPMusicRepeatModeOne;
    [self.playerController  prepareToPlay];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackStateChange:) name:MPMoviePlayerPlaybackStateDidChangeNotification object:nil];
}

-(void)playbackStateChange:(NSNotification *)nfc{
    
    switch (self.playerController.playbackState) {
        case MPMoviePlaybackStateSeekingForward:
            NSLog(@"前进");
            break;
        case MPMoviePlaybackStateSeekingBackward:
            NSLog(@"后退");
            break;
        case MPMoviePlaybackStateStopped:
            NSLog(@"停止");
            [self.playerController.view removeFromSuperview];
            break;
        case MPMoviePlaybackStatePlaying:
            NSLog(@"播放");
            break;
        case MPMoviePlaybackStatePaused:
            NSLog(@"暂停");
            break;
        case MPMoviePlaybackStateInterrupted:
            NSLog(@"中断");
            [self.playerController.view removeFromSuperview];
            break;
        default:
            break;
    }
    
}

-(UIButton *)playButton
{
    UIButton *playButton=[[UIButton alloc]initWithFrame:self.playerController.view.bounds];
    [playButton setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [playButton setImage:[UIImage imageNamed:@"方4"] forState:UIControlStateSelected];
    [playButton addTarget:self action:@selector(playClick:) forControlEvents:UIControlEventTouchUpInside];
    return playButton;
}

-(void)playClick:(UIButton *)button
{
    button.selected=!button.isSelected;
    if (button.isSelected) {
        [self.playerController play];
    }else{
        [self.playerController pause];
    }
    
}

@end
