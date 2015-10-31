//
//  PlayMusic.h
//  MusicPlayer
//
//  Created by 王明申 on 15/10/31.
//  Copyright © 2015年 晨曦的Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
//播放界面
@class MyMusic;
@interface PlayMusic : NSObject
//所有歌曲的信息
+(NSArray *)music;
//获取正在播放音乐信息
+(MyMusic *)playingMusic;
//设置设置正在播放音乐信息
+ (void)setPlayingMusic:(MyMusic *)playingMusic;

//播放上一曲歌曲
+(MyMusic *)playNextMusic;
//播放播放下一曲
+(MyMusic *)playLastMusic;
@end
