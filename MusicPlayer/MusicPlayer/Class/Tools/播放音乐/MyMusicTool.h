//
//  MyMusicTool.h
//  MusicPlayer
//
//  Created by 王明申 on 15/10/31.
//  Copyright © 2015年 晨曦的Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyMusicTool : NSObject
//播放音乐
+(void)playMusicWithName:(NSString *)name;
//暂停音乐
+(void)poseMusicWithName:(NSString *)name;
//停止音乐
+(void)stopMusicWithName: (NSString *)name;
@end
