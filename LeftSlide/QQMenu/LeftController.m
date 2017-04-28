//
//  LeftController.m
//  LeftMenu
//
//  Created by iMac on 17/4/24.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "LeftController.h"
#import "UIViewController+MMDrawerController.h"
#import "PushController.h"


@interface LeftController ()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation LeftController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageview.image = [UIImage imageNamed:@"leftbackiamge"];
    [self.view addSubview:imageview];

    
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth-100, kScreenHeight) style:UITableViewStyleGrouped];
    tableview.dataSource = self;
    tableview.delegate  = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableview.backgroundColor = [UIColor clearColor];
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
        cell.textLabel.text = @"领取礼包";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"在线约MM";
    } else if (indexPath.row == 3) {
        cell.textLabel.text = @"汽车专场";
    } else if (indexPath.row == 4) {
        cell.textLabel.text = @"领取¥10000";
    } else if (indexPath.row == 5) {
        cell.textLabel.text = @"我的相册";
    } else if (indexPath.row == 6) {
        cell.textLabel.text = @"我的余额";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PushController *pushVC = [[PushController alloc] init];
    pushVC.titleString = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    
    //拿到我们的LitterLCenterViewController，让它去push
    UINavigationController* nav = (UINavigationController*)self.mm_drawerController.centerViewController;
    [nav pushViewController:pushVC animated:NO];
    //当我们push成功之后，关闭我们的抽屉
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        //设置打开抽屉模式为MMOpenDrawerGestureModeNone，也就是没有任何效果。
        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    }];
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
    [imageButton setBackgroundImage:[UIImage imageNamed:@"icon_tabbar_mine_selected"] forState:UIControlStateNormal];
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
    
    PushController *pushVC = [[PushController alloc] init];
    pushVC.titleString = @"个人资料";
    
    //拿到我们的LitterLCenterViewController，让它去push
    UINavigationController* nav = (UINavigationController*)self.mm_drawerController.centerViewController;
    [nav pushViewController:pushVC animated:NO];
    //当我们push成功之后，关闭我们的抽屉
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        //设置打开抽屉模式为MMOpenDrawerGestureModeNone，也就是没有任何效果。
        [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    }];
}






@end
