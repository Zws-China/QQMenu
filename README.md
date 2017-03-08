# LeftSlider
侧滑菜单,侧滑,QQ侧滑菜单，左边菜单



[GitHub: https://github.com/Zws-China/LeftSlide](https://github.com/Zws-China/LeftSlide)


# PhotoShoot
![image](https://github.com/Zws-China/.../blob/master/leftslide.gif)


# How To Use

```ruby

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];   //设置通用背景颜色
    [self.window makeKeyAndVisible];


    self.mainTabBarController = [[BaseTabBarController alloc] init];

    LeftViewController *leftVC = [[LeftViewController alloc] init];
    self.LeftSlideVC = [[LeftSlideViewController alloc] initWithLeftView:leftVC andMainView:self.mainTabBarController];

    self.window.rootViewController = self.LeftSlideVC;



    return YES;
}

在主视图的控制器中添加下面两个方法
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



#define kMainPageDistance   100   //打开左侧窗时，中视图(右视图)露出的宽度
#define kMainPageScale   0.8  //打开左侧窗时，中视图(右视图）缩放比例
#define kMainPageCenter  CGPointMake(kScreenWidth + kScreenWidth * kMainPageScale / 2.0 - kMainPageDistance, kScreenHeight / 2)  //打开左侧窗时，中视图中心点

#define vCouldChangeDeckStateDistance  (kScreenWidth - kMainPageDistance) / 2.0 - 40 //滑动距离大于此数时，状态改变（关--》开，或者开--》关）
#define vSpeedFloat   0.7    //滑动速度

#define kLeftAlpha 0.9  //左侧蒙版的最大值
#define kLeftCenterX 30 //左侧初始偏移量
#define kLeftScale 0.7 //左侧初始缩放比例

//滑动速度系数-建议在0.5-1之间。默认为0.5
@property (nonatomic, assign) CGFloat speedf;

//左侧窗控制器
@property (nonatomic, strong) UIViewController *leftVC;

@property (nonatomic,strong) UIViewController *mainVC;
//点击手势控制器，是否允许点击视图恢复视图位置。默认为yes
@property (nonatomic, strong) UITapGestureRecognizer *sideslipTapGes;

//滑动手势控制器
@property (nonatomic, strong) UIPanGestureRecognizer *pan;

//侧滑窗是否关闭(关闭时显示为主页)
@property (nonatomic, assign) BOOL closed;



/**
@brief 初始化侧滑控制器
@param leftVC 右视图控制器
mainVC 中间视图控制器
@result instancetype 初始化生成的对象
*/
- (instancetype)initWithLeftView:(UIViewController *)leftVC
andMainView:(UIViewController *)mainVC;


/**
@brief 关闭左视图
*/
- (void)closeLeftView;


/**
@brief 打开左视图
*/
- (void)openLeftView;


/**
*  设置滑动开关是否开启
*
*  @param enabled YES:支持滑动手势，NO:不支持滑动手势
*/
- (void)setPanEnabled: (BOOL) enabled;


```