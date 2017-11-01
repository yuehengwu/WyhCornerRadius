//
//  UIImageView+wyhRadius.m
//  WyhCornerRadius
//
//  Created by wyh on 2017/10/31.
//  Copyright © 2017年 wyh. All rights reserved.
//

#import "UIImageView+wyhRadius.h"
#import "UIImage+wyhRadius.h"
#import <objc/runtime.h>
#import "wyhRadiusConst.h"

@interface UIImageView ()

@property (nonatomic, assign) CGFloat wyh_cornerRadius;
@property (nonatomic, assign) UIRectCorner wyh_cornerTypes;
@property (nonatomic, strong) UIColor *wyh_borderColor;
@property (nonatomic, assign) CGFloat wyh_borderWidth;
@property (nonatomic, strong) UIColor *wyh_backgroundColor;

@end

@implementation UIImageView (wyhRadius)

+ (void)load {
    wyh_swizzleMethod(@selector(setImage:), @selector(wyh_setImage:));
}

- (void)wyh_setImage:(UIImage *)image {
    
    __block CGSize _size = self.bounds.size;
    
    wyh_async_dispatch(^{
        UIImage *finalImage = [UIImage wyh_getCornerImageFromCornerRadius:self.wyh_cornerRadius Image:image Size:_size RectCornerType:self.wyh_cornerTypes BorderColor:self.wyh_borderColor BorderWidth:self.wyh_borderWidth BackgroundColor:self.wyh_backgroundColor];
        wyh_safe_dispatch(^{
            [self wyh_setImage:finalImage];
        });
    });
    
}

#pragma mark - Publick Function

- (void)wyh_autoSetImageCornerRedius:(CGFloat)cornerRedius ConrnerType:(UIRectCorner)cornerType {
    self.wyh_cornerRadius = cornerRedius;
    self.wyh_cornerTypes = cornerType;
}

- (void)wyh_autoSetImageCornerRedius:(CGFloat)cornerRedius ConrnerType:(UIRectCorner)cornerType Image:(UIImage *)image {
    self.wyh_cornerRadius = cornerRedius;
    self.wyh_cornerTypes = cornerType;
    [self setImage:image];
}

- (void)wyh_autoSetImageCornerRedius:(CGFloat)cornerRedius
                         ConrnerType:(UIRectCorner)cornerType
                         BorderColor:(UIColor *)borderColor
                         BorderWidth:(CGFloat)borderWidth
                     BackgroundColor:(UIColor *)backgroundColor {
    self.wyh_cornerRadius = cornerRedius;
    self.wyh_cornerTypes = cornerType;
    self.wyh_borderColor = borderColor;
    self.wyh_borderWidth = borderWidth;
    self.wyh_backgroundColor = backgroundColor;
}

#pragma mark - Property

- (void)setWyh_cornerRadius:(CGFloat)wyh_cornerRadius {
    objc_setAssociatedObject(self, @selector(wyh_cornerRadius), @(wyh_cornerRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)wyh_cornerRadius{
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

- (void)setWyh_cornerTypes:(UIRectCorner)wyh_cornerTypes {
    objc_setAssociatedObject(self, @selector(wyh_cornerTypes), @(wyh_cornerTypes), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIRectCorner)wyh_cornerTypes {
    return [objc_getAssociatedObject(self, _cmd) unsignedIntegerValue];
}

- (void)setWyh_borderColor:(UIColor *)wyh_borderColor {
    objc_setAssociatedObject(self, @selector(wyh_borderColor), wyh_borderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)wyh_borderColor {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWyh_backgroundColor:(UIColor *)wyh_backgroundColor {
    objc_setAssociatedObject(self, @selector(wyh_backgroundColor), wyh_backgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)wyh_backgroundColor {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWyh_borderWidth:(CGFloat)wyh_borderWidth {
    objc_setAssociatedObject(self, @selector(wyh_borderWidth), @(wyh_borderWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)wyh_borderWidth {
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

@end
