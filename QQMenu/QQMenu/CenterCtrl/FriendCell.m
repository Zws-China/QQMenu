//
//  FriendCell.m
//  LeftMenu
//
//  Created by iMac on 17/4/28.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "FriendCell.h"

@implementation FriendCell {
    UIImageView *headerImgV;
    UILabel *NameLabel;
    UILabel *stateLabel;
    UILabel *infoLabel;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self creatUI];
    }
    
    return self;
}


- (void)creatUI {
    
    headerImgV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 50, 50)];
    headerImgV.layer.cornerRadius = headerImgV.frame.size.width/2;
    headerImgV.layer.masksToBounds = YES;
    [self addSubview:headerImgV];
    
    NameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(headerImgV.frame)+5, 5, kScreenWidth-70, 20)];
    NameLabel.font = [UIFont systemFontOfSize:19];
    [self addSubview:NameLabel];
    
    stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(headerImgV.frame)+5, CGRectGetMaxY(NameLabel.frame)+10, 50, 20)];
    stateLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:stateLabel];
    
    
    infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(stateLabel.frame), CGRectGetMaxY(NameLabel.frame)+10, kScreenWidth-CGRectGetMaxX(stateLabel.frame), 20)];
    infoLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:infoLabel];
    
    
    
}


-(void)setModel:(GroupModel *)model IndexPath:(NSIndexPath *)indexPath {

    headerImgV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",indexPath.row%6]];

    NSDictionary *friendInfoDic = model.groupFriends[indexPath.row];
    NameLabel.text = friendInfoDic[@"name"];
    
    if ([friendInfoDic[@"status"] isEqualToString:@"1"]) {
        stateLabel.textColor = [UIColor greenColor];
        stateLabel.text = @"在线";
    }else{
        stateLabel.textColor = [UIColor lightGrayColor];
        stateLabel.text = @"不在线";
    }
    infoLabel.text = friendInfoDic[@"shuoshuo"];
    
}




@end
