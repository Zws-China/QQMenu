

#import <Foundation/Foundation.h>
#import "MMDrawerController.h"

/**
 `MMDrawerVisualState` provides prebuilt visual state update blocks that can be used in the callback block of `MMDrawerController` for drawer animation.
 */

@interface MMDrawerVisualState : NSObject

/**
//从后向前渐现
 */
+(MMDrawerControllerDrawerVisualStateBlock)slideAndScaleVisualStateBlock;

/**
 //滑动渐现
 */
+(MMDrawerControllerDrawerVisualStateBlock)slideVisualStateBlock;

/**
 //立方动画
 */
+(MMDrawerControllerDrawerVisualStateBlock)swingingDoorVisualStateBlock;

/**
//视差动画
 */
+(MMDrawerControllerDrawerVisualStateBlock)parallaxVisualStateBlockWithParallaxFactor:(CGFloat)parallaxFactor;

@end
