# QQMenu
QQ侧滑菜单,右滑菜单,QQ展开菜单,QQ好友分组


[GitHub: https://github.com/Zws-China/QQMenu](https://github.com/Zws-China/QQMenu)<br/>
如果觉得对你还有些用，给一颗star吧。你的支持是我继续的动力。<br>



# PhotoShoot
![0](http://img.blog.csdn.net/20170428172415058?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

![1](http://img.blog.csdn.net/20170428172437582?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

![2](http://img.blog.csdn.net/20170428172453840?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMjY1OTgwNzc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

# How To Use	
```ruby
//右滑菜单
//侧滑菜单使用的是MMDrawerController框架,在此感谢MMDrawerController作者。
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {


LeftController *leftVC = [[LeftController alloc] init];

UINavigationController *centerNav = [[UINavigationController alloc] initWithRootViewController:[[CenterController alloc] init]];
centerNav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
centerNav.navigationBar.tintColor = [UIColor whiteColor];
centerNav.navigationBar.barTintColor = [UIColor colorWithRed:44/255.0 green:185/255.0 blue:176/255.0 alpha:1];


self.drawerController = [[MMDrawerController alloc]initWithCenterViewController:centerNav leftDrawerViewController:leftVC];
[self.drawerController setShowsShadow:YES];
[self.drawerController setMaximumLeftDrawerWidth:kScreenWidth-100];
[self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
[self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];

[self.drawerController setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {

MMDrawerControllerDrawerVisualStateBlock block;
block = [[MMExampleDrawerVisualStateManager sharedManager]
drawerVisualStateBlockForDrawerSide:drawerSide];
if(block){
block(drawerController, drawerSide, percentVisible);
}

}];//侧滑效果

self.window.backgroundColor = [UIColor whiteColor];
[self.window setRootViewController:self.drawerController];


return YES;
}


```