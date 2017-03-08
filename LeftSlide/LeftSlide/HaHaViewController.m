//
//  HaHaViewController.m
//  LeftSlide
//
//  Created by iMac on 17/3/8.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "HaHaViewController.h"

@interface HaHaViewController ()

@end

@implementation HaHaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 20, 44, 44);
    backBtn.layer.cornerRadius = 5;
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:backBtn];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    

    
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width-100, 30)];
    label.text = @"present进来的";
    label.textColor = [UIColor orangeColor];
    label.font = [UIFont systemFontOfSize:25];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];

    
    
}


- (void)backAction {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
