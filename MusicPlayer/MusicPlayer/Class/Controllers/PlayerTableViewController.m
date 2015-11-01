//
//  PlayerTableViewController.m
//  MusicPlayer
//
//  Created by 王明申 on 15/10/30.
//  Copyright © 2015年 晨曦的Mac. All rights reserved.
//
#import "UIImage+Circle.h"
#import "PlayerViewController.h"
#import "UIView+AdjustFrame.h"
#import "PlayMusic.h"
#import "PlayerTableViewController.h"
#import "PlayMusic.h"
#import "MyMusic.h"
@interface PlayerTableViewController ()
@property(nonatomic,strong)PlayerViewController *playerC;
@end

@implementation PlayerTableViewController
-(PlayerViewController *)playerC {
    if (_playerC == nil) {
        _playerC = [[PlayerViewController alloc]init];
    }
    return _playerC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 80;
    }


#pragma mark - Table view data source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    让cell设为不选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MyMusic *music = [PlayMusic music][indexPath.row];
//    self.playerC.music = music;
    [PlayMusic setPlayingMusic:music];
    [self.playerC show];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [PlayMusic music].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * ID = @"MyCell";
    MyMusic *music = [PlayMusic music][indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:ID];
    }
   
    cell.imageView.image = [UIImage circleImageWithName:music.singerIcon borderWidth:2 borderColor:[UIColor redColor]];
    cell.textLabel.text = music.name;
    cell.detailTextLabel.text = music.singer;
    return cell;
}



@end
