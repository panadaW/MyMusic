//
//  MyMusicTool.m
//  MusicPlayer
//
//  Created by 王明申 on 15/10/31.
//  Copyright © 2015年 晨曦的Mac. All rights reserved.
//

#import "MyMusicTool.h"
#import <AVFoundation/AVFoundation.h>
@implementation MyMusicTool
static NSMutableDictionary* _musicID;
+(void)initialize {
    _musicID = [NSMutableDictionary dictionary];
}
//播放音乐
+(void)playMusicWithName:(NSString *)name{
//    提取播放器
     AVAudioPlayer *player = _musicID[name];
//    获取歌曲路径
    if (player == nil) {
        NSURL *url = [[NSBundle mainBundle]URLForResource:name withExtension:nil];
        player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
        //    准备播放
        [player prepareToPlay];
//        存放到字典
        _musicID[name] = player;
//    开始播放
        [player play];
}
}
//暂停音乐
+(void)poseMusicWithName:(NSString *)name{
    assert(name);
    AVAudioPlayer *player = _musicID[name];
    if (player) {
        [player pause];
    }
    


}//停止音乐
+(void)stopMusicWithName: (NSString *)name{
    assert(name);
//    取出控制器
    AVAudioPlayer *player = _musicID[name];
    if (player) {
        [player stop];
        player = nil;
        [_musicID removeObjectForKey:name];
    }

}



@end
