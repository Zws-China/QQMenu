//
//  GroupModel.m
//  LeftMenu
//
//  Created by iMac on 17/4/24.
//  Copyright © 2017年 zws. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface GroupModel : NSObject
@property (nonatomic, assign)BOOL isOpened;
@property (nonatomic, retain)NSString *groupName;
@property (nonatomic, assign)NSInteger groupCount;

@property (nonatomic, retain)NSArray *groupFriends;
@end
