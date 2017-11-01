//
//  UIImage+wyhRadius.m
//  WyhCornerRadius
//
//  Created by wyh on 2017/10/31.
//  Copyright © 2017年 wyh. All rights reserved.
//

#import "UIImage+wyhRadius.h"
#import <ImageIO/ImageIO.h>
@implementation UIImage (wyhRadius)


+ (UIImage *)wyh_getCornerImageFromCornerRadius:(CGFloat)cornerRadius
                                          Image:(UIImage *)image
                                           Size:(CGSize)size
                                 RectCornerType:(UIRectCorner)rectCornerType
                                    BorderColor:(UIColor *)borderColor
                                    BorderWidth:(CGFloat)borderWidth
                                BackgroundColor:(UIColor *)backgroundColor {
    
    if (!backgroundColor) {
        backgroundColor = [UIColor whiteColor];
    }
    if (image) {
        image = [image scaleToSize:CGSizeMake(size.width, size.height) backgroundColor:backgroundColor];
    } else {
        image = [UIImage wyh_imageWithColor:backgroundColor];
    }
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    CGFloat height = size.height;
    CGFloat width = size.width;

    CGFloat topLeftR = (rectCornerType & UIRectCornerTopLeft)?cornerRadius:0;
    CGFloat topRightR = (rectCornerType & UIRectCornerTopRight)?cornerRadius:0;
    CGFloat bottomLeftR = (rectCornerType & UIRectCornerBottomLeft)?cornerRadius:0;
    CGFloat bottomRightR = (rectCornerType & UIRectCornerBottomRight)?cornerRadius:0;
    WYHRadius radius = WYHRadiusMake(topLeftR, topRightR, bottomLeftR, bottomRightR);
    [self transformationWYHadius:radius size:size];
    
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, 0, -rect.size.height);
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    //    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:(rectCornerType) cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    [path addArcWithCenter:CGPointMake(width - radius.topRightRadius, height - radius.topRightRadius) radius:radius.topRightRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [path addArcWithCenter:CGPointMake(radius.topLeftRadius, height - radius.topLeftRadius) radius:radius.topLeftRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    [path addArcWithCenter:CGPointMake(radius.bottomLeftRadius, radius.bottomLeftRadius) radius:radius.bottomLeftRadius startAngle:M_PI endAngle:3.0 * M_PI_2 clockwise:YES];
    [path addArcWithCenter:CGPointMake(width - radius.bottomRightRadius, radius.bottomRightRadius) radius:radius.bottomRightRadius startAngle:3.0 * M_PI_2 endAngle:2.0 * M_PI clockwise:YES];
    
    [path closePath];
    [path addClip];
    
    CGContextDrawImage(context, rect, image.CGImage);
    
    if (borderWidth!=0) {
        path.lineWidth = borderWidth;
        if (!borderColor) {
            borderColor = [UIColor blackColor];
        }
        [borderColor setStroke];
        [path stroke];
    }
    
    UIImage *currentImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return currentImage;
}


- (UIImage *)scaleToSize:(CGSize)size
         backgroundColor:(UIColor *)backgroundColor {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    CGContextAddRect(context, rect);
    CGContextDrawPath(context, kCGPathFill);
    [self drawInRect:rect];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

+ (UIImage *)wyh_imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (WYHRadius)transformationWYHadius:(WYHRadius)radius size:(CGSize)size {
    radius.topLeftRadius = minimum(size.width, size.height, radius.topLeftRadius);
    radius.topRightRadius = minimum(size.width - radius.topLeftRadius, size.height, radius.topRightRadius);
    radius.bottomLeftRadius = minimum(size.width, size.height - radius.topLeftRadius, radius.bottomLeftRadius);
    radius.bottomRightRadius = minimum(size.width - radius.bottomLeftRadius, size.height - radius.topRightRadius, radius.bottomRightRadius);
    return radius;
}

static inline CGFloat minimum(CGFloat a, CGFloat b, CGFloat c) {
    CGFloat minimum = MIN(MIN(a, b), c);
    return MAX(minimum, 0);
}
@end
