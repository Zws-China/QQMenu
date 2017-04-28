

#import <UIKit/UIKit.h>


/**
 *  //获取当前开启的侧边栏类型，MMDrawerSide枚举如下：
 */
typedef NS_ENUM(NSInteger,MMDrawerSide) {

    MMDrawerSideNone = 0,//无侧边栏
    MMDrawerSideLeft,//左侧边栏
    MMDrawerSideRight,//右侧边栏
};
//开启侧边栏的手势模式 MMOpenDrawerGestureMode枚举意义如下
typedef NS_OPTIONS(NSInteger, MMOpenDrawerGestureMode){
 //没有手势 此模式为默认模式
 MMOpenDrawerGestureModeNone = 0,
 //在导航栏上拖动时可以打开侧边栏
 MMOpenDrawerGestureModePanningNavigationBar = 1 << 1,
 //在中心视图控制器的视图上拖动时可以打开侧边栏
 MMOpenDrawerGestureModePanningCenterView = 1 << 2,
 //在中心视图控制器的视图边缘20个单位内拖动时可以打开侧边栏
 MMOpenDrawerGestureModeBezelPanningCenterView = 1 << 3,
 //自定义手势 需配合自定义手势的方法使用
 MMOpenDrawerGestureModeCustom = 1 << 4,
 //所有模式兼容
 MMOpenDrawerGestureModeAll= MMOpenDrawerGestureModePanningNavigationBar |MMOpenDrawerGestureModePanningCenterView |MMOpenDrawerGestureModeBezelPanningCenterView |MMOpenDrawerGestureModeCustom,
 };
//关闭侧边栏的手势模式 MMCloseDrawerGestureMode枚举的意义如下
typedef NS_OPTIONS(NSInteger, MMCloseDrawerGestureMode) {
 //没有关闭手势
 MMCloseDrawerGestureModeNone= 0,
 //在导航栏上拖动时可以关闭侧边栏
 MMCloseDrawerGestureModePanningNavigationBar= 1 << 1,
 //在中心视图控制器上推动时可以关闭侧边栏
 MMCloseDrawerGestureModePanningCenterView= 1 << 2,
 //在中心视图控制器边缘20单位内拖动是可以关闭侧边栏
 MMCloseDrawerGestureModeBezelPanningCenterView= 1 << 3,
 //点击导航栏时可以关闭侧边栏
 MMCloseDrawerGestureModeTapNavigationBar = 1 << 4,
 //点击中心视图控制器视图时可以关闭侧边栏
 MMCloseDrawerGestureModeTapCenterView= 1 << 5,
 //在侧边栏视图上拖动时可以关闭侧边栏
 MMCloseDrawerGestureModePanningDrawerView= 1 << 6,
 //自定义关闭手势，需要和自定义手势的方法结合使用
 MMCloseDrawerGestureModeCustom= 1 << 7,
 //所有模式兼容
 MMCloseDrawerGestureModeAll = MMCloseDrawerGestureModePanningNavigationBar|MMCloseDrawerGestureModePanningCenterView|MMCloseDrawerGestureModeBezelPanningCenterView|MMCloseDrawerGestureModeTapNavigationBar |MMCloseDrawerGestureModeTapCenterView|MMCloseDrawerGestureModePanningDrawerView|MMCloseDrawerGestureModeCustom,
};

//设置侧边栏显示时的中心视图控制器的用户交互规则 MMDrawerOpenCenterInteractionMode枚举意义如下
typedef NS_ENUM(NSInteger, MMDrawerOpenCenterInteractionMode) {
 //中心视图控制器不能进行用户交互 默认为此枚举
 MMDrawerOpenCenterInteractionModeNone,
 //中心视图控制器完全可以进行用户交互
 MMDrawerOpenCenterInteractionModeFull,
 //中心视图控制器只有导航可以进行用户交互
 MMDrawerOpenCenterInteractionModeNavigationBarOnly,
};


@class  MMDrawerController;
typedef void (^MMDrawerControllerDrawerVisualStateBlock)(MMDrawerController * drawerController, MMDrawerSide drawerSide, CGFloat percentVisible);

@interface MMDrawerController : UIViewController

///---------------------------------------
/// @name Accessing Drawer Container View Controller Properties
///---------------------------------------

/**
 The center view controller. 
 
 This can only be set via the init methods, as well as the `setNewCenterViewController:...` methods. The size of this view controller will automatically be set to the size of the drawer container view controller, and it's position is modified from within this class. Do not modify the frame externally.
 */
@property (nonatomic, strong) UIViewController * centerViewController;

/**
 The left drawer view controller. 
 
 The size of this view controller is managed within this class, and is automatically set to the appropriate size based on the `maximumLeftDrawerWidth`. Do not modify the frame externally.
 */
@property (nonatomic, strong) UIViewController * leftDrawerViewController;

/**
 The right drawer view controller. 
 
 The size of this view controller is managed within this class, and is automatically set to the appropriate size based on the `maximumRightDrawerWidth`. Do not modify the frame externally.
 */
@property (nonatomic, strong) UIViewController * rightDrawerViewController;

/**
 设置左侧边栏的最大宽度 默认280
 */
@property (nonatomic, assign) CGFloat maximumLeftDrawerWidth;

/**
//设置右侧边栏的最大宽度 默认280
 */
@property (nonatomic, assign) CGFloat maximumRightDrawerWidth;

/**
 //这个是一个只读属性，用于获取可见的左侧边栏宽度
 */
@property (nonatomic, assign, readonly) CGFloat visibleLeftDrawerWidth;

/**
 //这个是一个只读属性，用于获取可见的右侧边栏宽度
 */
@property (nonatomic, assign, readonly) CGFloat visibleRightDrawerWidth;

/**
 //动画速度，这个参数的意义是每秒移动多少单位 默认为800/s
 */
@property (nonatomic, assign) CGFloat animationVelocity;

/** 
 //设置是否允许回弹效果，如果设置为YES，当使用手势进行侧边栏的开启时会出现回弹效果
 */
@property (nonatomic, assign) BOOL shouldStretchDrawer;

/**
 The current open side of the drawer. 
 
 Note this value will change as soon as a pan gesture opens a drawer, or when a open/close animation is finished.
 */
@property (nonatomic, assign, readonly) MMDrawerSide openSide;

/**
 How a user is allowed to open a drawer using gestures. 
 
 By default, this is set to `MMOpenDrawerGestureModeNone`. Note these gestures may affect user interaction with the `centerViewController`, so be sure to use appropriately.
 */
@property (nonatomic, assign) MMOpenDrawerGestureMode openDrawerGestureModeMask;

/**
 How a user is allowed to close a drawer. 
 
 By default, this is set to `MMCloseDrawerGestureModeNone`. Note these gestures may affect user interaction with the `centerViewController`, so be sure to use appropriately.
 */
@property (nonatomic, assign) MMCloseDrawerGestureMode closeDrawerGestureModeMask;

/**
 The value determining if the user can interact with the `centerViewController` when a side drawer is open. 
 
 By default, it is `MMDrawerOpenCenterInteractionModeNavigationBarOnly`, meaning that the user can only interact with the buttons on the `UINavigationBar`, if the center view controller is a `UINavigationController`. Otherwise, the user cannot interact with any other center view controller elements.
 */
@property (nonatomic, assign) MMDrawerOpenCenterInteractionMode centerHiddenInteractionMode;

/**
 //设置是否显示阴影效果
 */
@property (nonatomic, assign) BOOL showsShadow;

/**
 The shadow radius of `centerViewController` when a drawer is open.
 
 By default, this is set to 10.0f;
 */
@property (nonatomic, assign) CGFloat shadowRadius;

/**
 The shadow opacity of `centerViewController` when a drawer is open.
 
 By default, this is set to 0.8f;
 */
@property (nonatomic, assign) CGFloat shadowOpacity;

/**
 The shadow offset of `centerViewController` when a drawer is open.
 
 By default, this is set to (0, -3);
 */
@property (nonatomic, assign) CGSize shadowOffset;

/**
 The color of the shadow drawn off of 'centerViewController` when a drawer is open.
 
 By default, this is set to the systme default (opaque black).
 */
@property (nonatomic, strong) UIColor * shadowColor;

/**
 //设置是否显示状态栏的自定义视图 只有在iOS7之后可用
 */
@property (nonatomic, assign) BOOL showsStatusBarBackgroundView;

/**
 //设置状态栏视图颜色 只有在iOS7之后可用
 By default, this is set `[UIColor blackColor]`.
 */
@property (nonatomic, strong) UIColor * statusBarViewBackgroundColor;

/**
 The value determining panning range of centerView's bezel if the user can open drawer with 'MMOpenDrawerGestureModeBezelPanningCenterView' or close drawer with 'MMCloseDrawerGestureModeBezelPanningCenterView' .
 
 By default, this is set 20.0f.
 */
@property (nonatomic, assign) CGFloat bezelPanningCenterViewRange;

/**
 The value determining if the user can open or close drawer with panGesture velocity.
 
 By default, this is set 200.0f.
 */
@property (nonatomic, assign) CGFloat panVelocityXAnimationThreshold;

///---------------------------------------
/// @name Initializing a `MMDrawerController`
///---------------------------------------

/**
 创建带左侧边栏和右侧边栏的视图控制器
 */
-(instancetype)initWithCenterViewController:(UIViewController *)centerViewController leftDrawerViewController:(UIViewController *)leftDrawerViewController rightDrawerViewController:(UIViewController *)rightDrawerViewController;

/**
 只创建带左侧边栏的视图控制器
 */
-(instancetype)initWithCenterViewController:(UIViewController *)centerViewController leftDrawerViewController:(UIViewController *)leftDrawerViewController;

/**
 只创建带右侧边栏的视图控制器
 */
-(instancetype)initWithCenterViewController:(UIViewController *)centerViewController rightDrawerViewController:(UIViewController *)rightDrawerViewController;

///---------------------------------------
/// @name Opening and Closing a Drawer
///---------------------------------------

/**
 //切换侧边栏的状态
 drawerSide参数为要切换的侧边栏，animated设置是否有动画效果，completion会在切换完成后执行
 //注意：如果在切换一个关着的侧边栏时，如果另一个侧边栏正在开启状态，则此方法不会有任何效果
 
 */
-(void)toggleDrawerSide:(MMDrawerSide)drawerSide animated:(BOOL)animated completion:(void(^)(BOOL finished))completion;

/**
 //关闭侧边栏
 */
-(void)closeDrawerAnimated:(BOOL)animated completion:(void(^)(BOOL finished))completion;

/**
//开启侧边栏
 */
-(void)openDrawerSide:(MMDrawerSide)drawerSide animated:(BOOL)animated completion:(void(^)(BOOL finished))completion;

///---------------------------------------
/// @name Setting a new Center View Controller
///---------------------------------------

/**
 //更换中心视图控制器
 */
-(void)setCenterViewController:(UIViewController *)centerViewController withCloseAnimation:(BOOL)closeAnimated completion:(void(^)(BOOL finished))completion;


-(void)setCenterViewController:(UIViewController *)newCenterViewController withFullCloseAnimation:(BOOL)fullCloseAnimated completion:(void(^)(BOOL finished))completion;

///---------------------------------------
/// @name Animating the Width of a Drawer
///---------------------------------------

/**
 //设置左侧边栏最大宽度
 */
-(void)setMaximumLeftDrawerWidth:(CGFloat)width animated:(BOOL)animated completion:(void(^)(BOOL finished))completion;

/**
 //设置右侧边栏最大宽度
 */
-(void)setMaximumRightDrawerWidth:(CGFloat)width animated:(BOOL)animated completion:(void(^)(BOOL finished))completion;

///---------------------------------------
/// @name Previewing a Drawer
///---------------------------------------

/**
 //进行侧边栏的预览操作 默认预览距离为40个单位
 */
-(void)bouncePreviewForDrawerSide:(MMDrawerSide)drawerSide completion:(void(^)(BOOL finished))completion;

/**
 //进行侧边栏的预览操作 可以设置预览距离
 */
-(void)bouncePreviewForDrawerSide:(MMDrawerSide)drawerSide distance:(CGFloat)distance completion:(void(^)(BOOL finished))completion;

///---------------------------------------
/// @name Custom Drawer Animations
///---------------------------------------

/**
 //这个方法用于进行视图侧边栏视图出现动画的自定义
 */
-(void)setDrawerVisualStateBlock:(void(^)(MMDrawerController * drawerController, MMDrawerSide drawerSide, CGFloat percentVisible))drawerVisualStateBlock;

///---------------------------------------
/// @name Gesture Completion Handling
///---------------------------------------

/**
 //这个方法用于设置当一个手势触发完成后的回调
 */
-(void)setGestureCompletionBlock:(void(^)(MMDrawerController * drawerController, UIGestureRecognizer * gesture))gestureCompletionBlock;

///---------------------------------------
/// @name Custom Gesture Handler
///---------------------------------------

/**
 //这个方法用于定义自定义的手势操作 要将开启侧边栏与关闭侧边栏的模式设置为MMOpenDrawerGestureModeCustom和MMCloseDrawerGestureModeCustom才有效
 */
-(void)setGestureShouldRecognizeTouchBlock:(BOOL(^)(MMDrawerController * drawerController, UIGestureRecognizer * gesture, UITouch * touch))gestureShouldRecognizeTouchBlock;

@end
