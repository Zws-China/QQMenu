//
//  LeftViewController.m
//  LeftSlide
//
//  Created by iMac on 17/3/8.
//  Copyright © 2017年 zws. All rights reserved.
//


#import "LeftViewController.h"
#import "AppDelegate.h"
#import "OtherController.h"
#import "HaHaViewController.h"

@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageview.image = [UIImage imageNamed:@"leftbackiamge"];
    [self.view addSubview:imageview];
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableview.dataSource = self;
    tableview.delegate  = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];


}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:20.0f];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"开通会员";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"QQ钱包";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"网上营业厅";
    } else if (indexPath.row == 3) {
        cell.textLabel.text = @"个性装扮";
    } else if (indexPath.row == 4) {
        cell.textLabel.text = @"我的收藏";
    } else if (indexPath.row == 5) {
        cell.textLabel.text = @"我的相册";
    } else if (indexPath.row == 6) {
        cell.textLabel.text = @"我的文件";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    OtherController *vc = [[OtherController alloc] init];
    vc.titleString = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    vc.hidesBottomBarWhenPushed = YES;
    [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
    [tempAppDelegate.mainTabBarController.selectedViewController pushViewController:vc animated:NO];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 180;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 180)];
    view.backgroundColor = [UIColor clearColor];
    
    
    UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    imageButton.frame = CGRectMake(CGRectGetWidth(view.frame)/2-25, 40, 50, 50);
    imageButton.layer.cornerRadius = 25;
    [imageButton setBackgroundImage:[UIImage imageNamed:@"icon_tabbar_nearby_selected"] forState:UIControlStateNormal];
    [view addSubview:imageButton];
    [imageButton addTarget:self action:@selector(imgButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageButton.frame)+5, tableView.bounds.size.width, 20)];
    nameLabel.text = @"ZWS-China";
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:nameLabel];
    
    return view;
}


- (void)imgButtonAction {
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    HaHaViewController *vc = [[HaHaViewController alloc] init];
    
    [tempAppDelegate.mainTabBarController.selectedViewController presentViewController:vc animated:YES completion:^{
        [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
    }];
    
}


@end
