//
//  PlayerViewController.m
//  MusicPlayer
//
//  Created by 王明申 on 15/10/31.
//  Copyright © 2015年 晨曦的Mac. All rights reserved.
//
#import "MyMusicTool.h"

#import "MyMusic.h"
#import "PlayerViewController.h"
#import "UIView+AdjustFrame.h"
#import "PlayMusic.h"
@interface PlayerViewController ()
- (IBAction)exit:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *singerName;
@property (weak, nonatomic) IBOutlet UILabel *songName;
@property (weak, nonatomic) IBOutlet UIImageView *songIcon;
@property(nonatomic,strong)MyMusic *music;
@property (weak, nonatomic) IBOutlet UIButton *poseOrStard;

@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)show {
    if (self.music && self.music != [PlayMusic playingMusic]) {
        [self posePlayMusic];
    }
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    window不允许交互,防止用户重复点击cell，重复弹出
    window.userInteractionEnabled = NO;
    self.view.frame = window.bounds;
    [window addSubview:self.view];
    self.view.y = self.view.height;
//    self.view.backgroundColor = [UIColor blueColor];
    [UIView animateWithDuration:0.8 animations:^{
        self.view.y = 0;
    } completion:^(BOOL finished) {
        window.userInteractionEnabled = YES;
//        开始播放选中音乐
        [self playMusic];
    }];
}
//开始播放音乐
-(void)playMusic {
    MyMusic *music = [PlayMusic playingMusic];
    if (music != self.music) {
        
        self.music = music;
        self.singerName.text = music.singer;
        self.songName.text = music.name;
        self.songIcon.image = [UIImage imageNamed:music.icon];
        //    播放音乐
        [MyMusicTool playMusicWithName:music.filename];
    }

}
//停止播放yinyue
-(void)posePlayMusic {
    self.singerName.text = nil;
    self.songName.text = nil;
    self.songIcon.image = [UIImage imageNamed:@"play_cover_pic_bg"];
    [MyMusicTool stopMusicWithName:self.music.filename];
}
- (IBAction)exit:(UIButton *)sender {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.8 animations:^{
        self.view.y = self.view.height;
    } completion:^(BOOL finished) {
        window.userInteractionEnabled = YES;
    }];
    
}
//播放上一首
- (IBAction)lastSong:(UIButton *)sender {
    [self posePlayMusic];
    [PlayMusic playLastMusic];
    [self playMusic];
}
//播放下一首
- (IBAction)nextSong:(UIButton *)sender {
    [self posePlayMusic];
    [PlayMusic playNextMusic];
    [self playMusic];
}
//暂停
- (IBAction)poseOrStardSong:(UIButton *)sender {
    [MyMusicTool poseMusicWithName:self.music.filename];
}

@end
