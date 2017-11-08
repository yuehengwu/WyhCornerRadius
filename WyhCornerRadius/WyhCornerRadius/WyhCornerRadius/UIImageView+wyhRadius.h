//
//  UIImageView+wyhRadius.h
//  WyhCornerRadius
//
//  Created by wyh on 2017/10/31.
//  Copyright © 2017年 wyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (wyhRadius)


/**
 闪速创建一个圆图

 @return <#return value description#>
 */
+ (instancetype)wyh_circleImageView;

/**
 自动设置图片的圆角

 @param cornerRedius <#cornerRedius description#>
 @param cornerType <#cornerType description#>
 */
- (void)wyh_autoSetImageCornerRedius:(CGFloat)cornerRedius
                     ConrnerType:(UIRectCorner)cornerType;


/**
 直接设置带圆角的图片(多适用于加载本地图片的imageView)

 @param cornerRedius <#cornerRedius description#>
 @param cornerType <#cornerType description#>
 @param image <#image description#>
 */
- (void)wyh_autoSetImageCornerRedius:(CGFloat)cornerRedius
                         ConrnerType:(UIRectCorner)cornerType
                               Image:(UIImage *)image;

/**
 自动设置带边框的图片圆角

 @param cornerRedius <#cornerRedius description#>
 @param cornerType <#cornerType description#>
 @param borderColor <#borderColor description#>
 @param borderWidth <#borderWidth description#>
 @param image <#backgroundColor description#>
 */
- (void)wyh_autoSetImageCornerRedius:(CGFloat)cornerRedius
                         ConrnerType:(UIRectCorner)cornerType
                         BorderColor:(UIColor *)borderColor
                         BorderWidth:(CGFloat)borderWidth
                               Image:(UIImage *)image;

@end
