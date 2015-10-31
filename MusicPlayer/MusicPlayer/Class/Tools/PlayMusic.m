//
//  PlayMusic.m
//  MusicPlayer
//
//  Created by 王明申 on 15/10/31.
//  Copyright © 2015年 晨曦的Mac. All rights reserved.
//
#import "MJExtension.h"

#import "PlayMusic.h"
#import "MyMusic.h"
@implementation PlayMusic

static MyMusic * _playMusic;
static NSArray * _music;
+(void)initialize {
    _music = [MyMusic objectArrayWithFilename:@"Musics.plist"];
}
+(NSArray *)music {
    return _music;
}
+(MyMusic *)playingMusic {
    return _playMusic;
}
+ (void)setPlayingMusic:(MyMusic *)playingMusic{
    assert(playingMusic);
    _playMusic = playingMusic;
}

+(MyMusic *)playNextMusic {
//    标记当前播放音乐索引
    NSUInteger currentIndex = [_music indexOfObject:_playMusic];
    currentIndex ++;
    if (currentIndex > _music.count - 1) {
        currentIndex = 0;
    }
    MyMusic *nextMusic = _music[currentIndex];
    _playMusic = nextMusic;
    return nextMusic;

}

+(MyMusic *)playLastMusic {
    //    标记当前播放音乐索引
    NSUInteger currentIndex = [_music indexOfObject:_playMusic];
    currentIndex--;
    if (currentIndex < 0) {
        currentIndex = _music.count - 1;
    }
    MyMusic *lastMusic = _music[currentIndex];
    _playMusic = lastMusic;
    return lastMusic;

}
@end
