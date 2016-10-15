//
//  redView.m
//  WDHitTestDemo
//
//  Created by WD on 16/10/15.
//  Copyright © 2016年 WD. All rights reserved.
//  博客：http://blog.csdn.net/cehae/article/details/52822345
//  Github：https://github.com/Cehae/WDHitTestDemo

#import "redView.h"

@interface redView()

@property(nonatomic, weak) IBOutlet UIButton *btn;

@end
@implementation redView



#pragma mark - 应用一
//方法一
///**
// *  作用：寻找最合适的view
// *
// *  @param point 触摸点
// *  @param event 事件
// *
// *  @return 当前view找到的最合适的view
// */
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    return self;
//}
//


//方法二
///**
// *  作用:判断当前点在不在它调用View,(谁调用pointInside,这个View就是谁)
// *  什么时候调用:它是在hitTest方法当中调用的.
// *  注意:point点必须得要跟它方法调用者在同一个坐标系里面
// *  @param point <#point description#>
// *  @param event <#event description#>
// *
// *  @return <#return value description#>
// */
//-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//    //    NSLog(@"%s",__func__);
//    //    return [super pointInside:point withEvent:event];
//    //
//    //
//    //    //如果返回NO就代表，当前点不在红色view（self）上面，那么当我们确实点击红丝view，红色view也不会响应事件。
//    //    return NO;
//    
//    //如果返回YES就代表，当前点在红色view（self）上面，那么即使我们没有点击红丝view，红色view也会响应事件。
//    return YES;
//}

#pragma mark - 应用二

/**
 *  作用：寻找最合适的view
 *
 *  @param point 触摸点
 *  @param event 事件
 *
 *  @return 当前view找到的最合适的view
 */
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    //判断点在不在后面的按钮身上
    //首先要想判断在不在后面按钮范围内必须先把两个坐标放在同一坐标系下
    //把当前的点转换到按钮身上的坐标系的点
    CGPoint btnP = [self convertPoint:point toView:self.btn];
    if ([self.btn pointInside:btnP withEvent:event]) {
        //如果在后面按钮上，可以返回按钮，让按钮响应事件
        return self.btn;
    }else{
        //如果不在就按照系统默认做法
        return [super hitTest:point withEvent:event];
    }
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}

@end
