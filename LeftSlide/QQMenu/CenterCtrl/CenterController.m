//
//  CenterController.m
//  LeftMenu
//
//  Created by iMac on 17/4/24.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "CenterController.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import "GroupModel.h"
#import "FriendCell.h"

#import <objc/runtime.h>


@interface CenterController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *dataArray;

@property(nonatomic,strong)UITableView *tableV;

@end

@implementation CenterController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //设置打开抽屉模式
    [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"首页";
    
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
    
    
    [self initData];
    [self creatTableView];
}
                                             
-(void)leftDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

/**
 *  加载控制器的时候设置打开抽屉模式  (因为在后面会关闭)
 */



- (void)initData {
    _dataArray = [[NSMutableArray alloc]init];
    NSDictionary *JSONDic =@{@"group":
                                 @[
                                     @{@"groupName":@"小学同学",@"groupCount":@"3",@"groupArray":@[
                                               @{@"name":@"狗腿子",@"avatarURL":@"",@"shuoshuo":@"作业又没写好,唉！",@"status":@"1"},
                                               @{@"name":@"大宝",@"avatarURL":@"",@"shuoshuo":@"考试不要抄我的！",@"status":@"1"},
                                               @{@"name":@"Zws",@"avatarURL":@"",@"shuoshuo":@"马勒戈壁有本事放学别走！",@"status":@"0"}
                                               ]},
                                     @{@"groupName":@"初中同学",@"groupCount":@"5",@"groupArray":
                                           @[
                                               @{@"name":@"李铁球",@"avatarURL":@"",@"shuoshuo":@"我家来自农村，不要欺负我",@"status":@"1"},
                                               @{@"name":@"王麻子",@"avatarURL":@"",@"shuoshuo":@"历史咯老师真漂亮！",@"status":@"1"},
                                               @{@"name":@"吴道德",@"avatarURL":@"",@"shuoshuo":@"我姓吴，法号道德",@"status":@"1"},
                                               @{@"name":@"张丝丹",@"avatarURL":@"",@"shuoshuo":@"我小名叫四蛋子，哈哈",@"status":@"0"},
                                               @{@"name":@"赵铁柱",@"avatarURL":@"",@"shuoshuo":@"我喜欢小花",@"status":@"0"}
                                               ]},
                                     @{@"groupName":@"高中同学",@"groupCount":@"3",@"groupArray":
                                           @[
                                               @{@"name":@"刘阿猫",@"avatarURL":@"",@"shuoshuo":@"我操，高考又到了",@"status":@"1"},
                                               @{@"name":@"静静",@"avatarURL":@"",@"shuoshuo":@"大家好，我是静静。",@"status":@"1"},
                                               @{@"name":@"隔壁老王",@"avatarURL":@"",@"shuoshuo":@"小样你是新来的吧！",@"status":@"0"}
                                               ]},
                                     @{@"groupName":@"大学同学",@"groupCount":@"4",@"groupArray":
                                           @[
                                               @{@"name":@"屌丝男",@"avatarURL":@"",@"shuoshuo":@"泡妞去了，回聊。",@"status":@"1"},
                                               @{@"name":@"游戏狗",@"avatarURL":@"",@"shuoshuo":@"我擦，双杀！！",@"status":@"1"},
                                               @{@"name":@"学霸",@"avatarURL":@"",@"shuoshuo":@"期末考试稳拿第一",@"status":@"1"},
                                               @{@"name":@"书呆子",@"avatarURL":@"",@"shuoshuo":@"蛋白质是怎么炼成的。。。",@"status":@"0"}]},
                                     @{@"groupName":@"同事",@"groupCount":@"3",@"groupArray":
                                           @[
                                               @{@"name":@"JAVA工程师",@"avatarURL":@"",@"shuoshuo":@"JAVA是最好的编程语言",@"status":@"1"},
                                               @{@"name":@"Android工程师",@"avatarURL":@"",@"shuoshuo":@"Android最好用，便宜耐摔！",@"status":@"1"},
                                               @{@"name":@"iOS工程师",@"avatarURL":@"",@"shuoshuo":@"iPhone手机牛逼又流畅。",@"status":@"0"}
                                               ]},
                                     @{@"groupName":@"家人",@"groupCount":@"3",@"groupArray":
                                           @[
                                               @{@"name":@"妈妈",@"avatarURL":@"",@"shuoshuo":@"今天天气好晴朗☀️，处处好风光",@"status":@"1"},
                                               @{@"name":@"爸爸",@"avatarURL":@"",@"shuoshuo":@"我的儿子是个帅B！",@"status":@"1"},
                                               @{@"name":@"姐姐",@"avatarURL":@"",@"shuoshuo":@"唱歌跳舞样样精通。",@"status":@"0"}
                                               ]}
                                     ]
                             };
    
    for (NSDictionary *groupInfoDic in JSONDic[@"group"]) {
        GroupModel *model = [[GroupModel alloc]init];
        model.groupName = groupInfoDic[@"groupName"];
        model.groupCount = [groupInfoDic[@"groupCount"] integerValue];
        model.isOpened = NO;
        model.groupFriends = groupInfoDic[@"groupArray"];
        [_dataArray addObject:model];
    }
    
}
- (void)creatTableView {
    _tableV = [[UITableView alloc] init];
    _tableV.frame = self.view.bounds;
    _tableV.dataSource = self;
    _tableV.delegate  = self;
    _tableV.tableFooterView = [UIView new];
    [_tableV setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];//横竖屏适配
    [self.view addSubview:_tableV];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    GroupModel *groupModel = _dataArray[section];
    NSInteger count = groupModel.isOpened ? groupModel.groupFriends.count : 0;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Identifier";
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[FriendCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        cell.backgroundColor = [UIColor whiteColor];
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
    GroupModel *groupModel = _dataArray[indexPath.section];
    [cell setModel:groupModel IndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.00001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *sectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    sectionView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.8];
    GroupModel *groupModel = _dataArray[section];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:sectionView.bounds];
    [button setTag:section];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button setTitle:groupModel.groupName forState:UIControlStateNormal];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 60)];
    [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [sectionView addSubview:button];
    UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(0, button.frame.size.height-1, button.frame.size.width, 1)];
    [line setImage:[UIImage imageNamed:@"line_real"]];
    [sectionView addSubview:line];
    if (groupModel.isOpened) {
        UIImageView * _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, (44-16)/2, 14, 16)];
        [_imgView setImage:[UIImage imageNamed:@"ico_list"]];
        [sectionView addSubview:_imgView];
        CGAffineTransform currentTransform = _imgView.transform;
        CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, M_PI/2); // 在现在的基础上旋转指定角度
        _imgView.transform = newTransform;
        objc_setAssociatedObject(button, @"buttonKey", _imgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }else{
        UIImageView * _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, (44-16)/2, 14, 16)];
        [_imgView setImage:[UIImage imageNamed:@"ico_list"]];
        [sectionView addSubview:_imgView];
        objc_setAssociatedObject(button, @"buttonKey", _imgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }
    
    
    
    UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width-40, (44-20)/2, 40, 20)];
    [numberLabel setBackgroundColor:[UIColor clearColor]];
    [numberLabel setFont:[UIFont systemFontOfSize:14]];
    NSInteger onLineCount = 0;
    for (NSDictionary *friendInfoDic in groupModel.groupFriends) {
        if ([friendInfoDic[@"status"] isEqualToString:@"1"]) {
            onLineCount++;
        }
    }
    [numberLabel setText:[NSString stringWithFormat:@"%ld/%ld",onLineCount,groupModel.groupCount]];
    [sectionView addSubview:numberLabel];
    
    return sectionView;
}

- (void)buttonPress:(UIButton *)sender//headButton点击
{
    GroupModel *groupModel = _dataArray[sender.tag];
    UIImageView *imageView =  objc_getAssociatedObject(sender,@"buttonKey");
    
    
    if (groupModel.isOpened) {
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionTransitionNone animations:^{
            CGAffineTransform currentTransform = imageView.transform;
            CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, -M_PI/2); // 在现在的基础上旋转指定角度
            imageView.transform = newTransform;
            
            
        } completion:^(BOOL finished) {
            
            
        }];
        
        
        
    }else{
        
        [UIView animateWithDuration:0.3 delay:0.0 options: UIViewAnimationOptionAllowUserInteraction |UIViewAnimationOptionCurveLinear animations:^{
            
            CGAffineTransform currentTransform = imageView.transform;
            CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, M_PI/2); // 在现在的基础上旋转指定角度
            imageView.transform = newTransform;
            
        } completion:^(BOOL finished) {
            
        }];
    }
    
    groupModel.isOpened = !groupModel.isOpened;
    
    [_tableV reloadSections:[NSIndexSet indexSetWithIndex:sender.tag] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
