//
//  PushController.m
//  LeftMenu
//
//  Created by iMac on 17/4/24.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "PushController.h"

@interface PushController ()

@end

@implementation PushController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, kNavHeight, kScreenWidth, kScreenHeight-kNavHeight)];
    imageview.image = [UIImage imageNamed:@"leftbackiamge"];
    [self.view addSubview:imageview];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, kNavHeight+100, self.view.frame.size.width-100, 30)];
    label.text = self.titleString;
    label.textColor = [UIColor colorWithRed:44/255.0 green:185/255.0 blue:176/255.0 alpha:1];
    label.font = [UIFont systemFontOfSize:25];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
}

@end
