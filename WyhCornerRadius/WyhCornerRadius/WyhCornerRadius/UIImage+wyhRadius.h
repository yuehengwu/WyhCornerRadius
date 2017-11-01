//
//  UIImage+wyhRadius.h
//  WyhCornerRadius
//
//  Created by wyh on 2017/10/31.
//  Copyright © 2017年 wyh. All rights reserved.
//

#import <UIKit/UIKit.h>

struct WYHRadius {
    CGFloat topLeftRadius;
    CGFloat topRightRadius;
    CGFloat bottomLeftRadius;
    CGFloat bottomRightRadius;
};
typedef struct WYHRadius WYHRadius;

static inline WYHRadius WYHRadiusMake(CGFloat topLeftRadius, CGFloat topRightRadius, CGFloat bottomLeftRadius, CGFloat bottomRightRadius) {
    WYHRadius radius;
    radius.topLeftRadius = topLeftRadius;
    radius.topRightRadius = topRightRadius;
    radius.bottomLeftRadius = bottomLeftRadius;
    radius.bottomRightRadius = bottomRightRadius;
    return radius;
}

@interface UIImage (wyhRadius)

+ (UIImage *)wyh_imageWithColor:(UIColor *)color;

+ (UIImage *)wyh_getCornerImageFromCornerRadius:(CGFloat)cornerRadius
                                          Image:(UIImage *)image
                                           Size:(CGSize)size
                                 RectCornerType:(UIRectCorner)rectCornerType
                                    BorderColor:(UIColor *)borderColor
                                    BorderWidth:(CGFloat)borderWidth
                                BackgroundColor:(UIColor *)backgroundColor;

- (UIImage *)scaleToSize:(CGSize)size backgroundColor:(UIColor *)backgroundColor;



@end
