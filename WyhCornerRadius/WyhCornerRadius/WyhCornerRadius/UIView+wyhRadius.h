//
//  UIView+wyhRadius.h
//  WyhCornerRadius
//
//  Created by wyh on 2017/10/31.
//  Copyright © 2017年 wyh. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 全部属性介绍如下(#注意以下方法暂时均需要在设置view.size后方可生效)
 
@para cornerRadius 圆角
@para image 图片
@para size 尺寸
@para rectCornerType 要设置的圆角方向
@para borderColor 边框颜色(#只有当borderWidth!=0时生效)
@para borderWidth 边框宽度
@para backgroundColor 控件背景颜色(#设置后请勿再设置view的backgroundColor)
@para controlState 控件状态(#暂时只用于UIButton)
*/

@interface UIView (wyhRadius)

/**
 快速设置圆角方法
 */
- (void)wyh_CornerRadius:(CGFloat)cornerRadius
          RectCornerType:(UIRectCorner)rectCornerType;

/**
 快速设置带背景色的圆角方法
 */
- (void)wyh_CornerRadius:(CGFloat)cornerRadius
          RectCornerType:(UIRectCorner)rectCornerType
         BackgroundColor:(UIColor *)backgroundColor ;

/**
 快速设置带图片的圆角方法
 */
- (void)wyh_CornerRadius:(CGFloat)cornerRadius
                   Image:(UIImage *)image
          RectCornerType:(UIRectCorner)rectCornerType;

/**
 快速设置带边框、带图片、带背景色的圆角方法
 */
- (void)wyh_CornerRadius:(CGFloat)cornerRadius
                   Image:(UIImage *)image
          RectCornerType:(UIRectCorner)rectCornerType
             BorderColor:(UIColor *)borderColor
             BorderWidth:(CGFloat)borderWidth
         BackgroundColor:(UIColor *)backgroundColor;

/**
 UIButton的圆角设置方法(#可设置不同state下的button样式)
 */
- (void)wyh_CornerRadius:(CGFloat)cornerRadius
                   Image:(UIImage *)image
          RectCornerType:(UIRectCorner)rectCornerType
             BorderColor:(UIColor *)borderColor
             BorderWidth:(CGFloat)borderWidth
         BackgroundColor:(UIColor *)backgroundColor
          UIControlState:(UIControlState)controlState;

/**
 包含所有自定义样式的方法
 */
- (void)wyh_CornerRadius:(CGFloat)cornerRadius
                   Image:(UIImage *)image
                    Size:(CGSize)size
          RectCornerType:(UIRectCorner)rectCornerType
             BorderColor:(UIColor *)borderColor
             BorderWidth:(CGFloat)borderWidth
         BackgroundColor:(UIColor *)backgroundColor
          UIControlState:(UIControlState)controlState;

@end
