//
//  FriendCell.h
//  LeftMenu
//
//  Created by iMac on 17/4/28.
//  Copyright © 2017年 zws. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroupModel.h"

@interface FriendCell : UITableViewCell


-(void)setModel:(GroupModel *)model IndexPath:(NSIndexPath *)indexPath;

@end
