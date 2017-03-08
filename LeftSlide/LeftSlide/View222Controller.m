//
//  View222Controller.m
//  LeftSlide
//
//  Created by iMac on 17/3/8.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "View222Controller.h"
#import "AppDelegate.h"

@interface View222Controller ()

@end

@implementation View222Controller

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:NO];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width-100, 30)];
    label.text = @"View222Controller";
    label.textColor = [UIColor colorWithRed:44/255.0 green:185/255.0 blue:176/255.0 alpha:1];
    label.font = [UIFont systemFontOfSize:25];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
}



@end
