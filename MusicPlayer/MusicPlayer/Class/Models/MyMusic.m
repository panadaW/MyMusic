//
//  MyMusic.m
//  MusicPlayer
//
//  Created by 王明申 on 15/10/31.
//  Copyright © 2015年 晨曦的Mac. All rights reserved.
//

#import "MyMusic.h"

@implementation MyMusic
+(instancetype)MusicWithDict:(NSDictionary *)dict{
    id music = [[self alloc]init];
    [music setValuesForKeysWithDictionary:dict];
    return music;
}

@end
