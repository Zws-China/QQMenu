


#import "MMDrawerController.h"

/**
关于MMDrawerController的子类 开发者如果有特殊的需求，也可以通过继承MMDrawerController来实现自己的侧边栏控制器类，MMDrawerController框架中提供了一个扩展，在编写MMDrawerController时，开发者可以导入MMDrawerController+Subclass.h文件，这个文件中提供了许多控制器的监听方法供开发者重写，解析如下：
 */

@interface MMDrawerController (Subclass)
///---------------------------------------
/// @name Gesture Interaction
///---------------------------------------
/** 
 //出现单击手势会回调的方法 如果要重写 必须调用父类的此方法
 */
-(void)tapGestureCallback:(UITapGestureRecognizer *)tapGesture __attribute((objc_requires_super));

/** 
 //出现滑动手势会回调的方法 如果要重写 必须调用父类的此方法
 */
-(void)panGestureCallback:(UIPanGestureRecognizer *)panGesture __attribute((objc_requires_super));

/**
 //决定是否响应某个手势
 */
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch __attribute((objc_requires_super));


///---------------------------------------
/** 
 //准备展示侧边栏时调用的方法
 */
-(void)prepareToPresentDrawer:(MMDrawerSide)drawer animated:(BOOL)animated __attribute((objc_requires_super));


///---------------------------------------
/**
//关闭侧边栏时调用的方法
 */
-(void)closeDrawerAnimated:(BOOL)animated velocity:(CGFloat)velocity animationOptions:(UIViewAnimationOptions)options completion:(void (^)(BOOL))completion __attribute((objc_requires_super));

/**
 //打开侧边栏时调用的方法
 */
-(void)openDrawerSide:(MMDrawerSide)drawerSide animated:(BOOL)animated velocity:(CGFloat)velocity animationOptions:(UIViewAnimationOptions)options completion:(void (^)(BOOL))completion __attribute((objc_requires_super));

///---------------------------------------

/**
 //设备旋转方向时调用的方法
 */
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration __attribute((objc_requires_super));

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration __attribute((objc_requires_super));

@end
