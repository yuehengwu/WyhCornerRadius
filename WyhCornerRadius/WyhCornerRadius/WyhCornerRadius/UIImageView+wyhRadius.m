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
@property (nonatomic, assign) BOOL isInitFromCircle;
@property (nonatomic, assign) BOOL isAutoSet;


@end

@implementation UIImageView (wyhRadius)

+ (void)load {
    [self swizzleMethod];
}

+ (void)swizzleMethod {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
        wyh_swizzleMethod(@selector(layoutSubviews), @selector(wyh_layoutSubview));
    {
//        wyh_swizzleMethod(@selector(setImage:), @selector(wyh_setImage:));
    }
//    });
}

//- (void)wyh_setImage:(UIImage *)image {
//    if (self.isAutoSet) {
//        [self settingCornerImage:image];
//    }else {
//        [self wyh_setImage:image];
//    }
//}

- (void)wyh_layoutSubview {
    [self wyh_layoutSubview];
    if (self.isAutoSet) {
        if (self.image) {
            [self settingCornerImage:self.image];
        }
    }
}

#pragma mark - Publick Function

+ (instancetype)wyh_circleImageView {
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.isInitFromCircle = YES;
    imageView.isAutoSet = YES;
    return imageView;
}

- (void)wyh_autoSetImageCornerRedius:(CGFloat)cornerRedius ConrnerType:(UIRectCorner)cornerType {
    [self cachePropertyWithCornerRedius:cornerRedius ConrnerType:cornerType BorderColor:nil BorderWidth:0 BackgroundColor:nil];
}

- (void)wyh_autoSetImageCornerRedius:(CGFloat)cornerRedius ConrnerType:(UIRectCorner)cornerType Image:(UIImage *)image {
    [self cachePropertyWithCornerRedius:cornerRedius ConrnerType:cornerType BorderColor:nil BorderWidth:0 BackgroundColor:nil];
    if (image) {
        [self setImage:image];
    }
}

- (void)wyh_autoSetImageCornerRedius:(CGFloat)cornerRedius
                         ConrnerType:(UIRectCorner)cornerType
                         BorderColor:(UIColor *)borderColor
                         BorderWidth:(CGFloat)borderWidth
                               Image:(UIImage *)image{
    [self cachePropertyWithCornerRedius:cornerRedius ConrnerType:cornerType BorderColor:borderColor BorderWidth:borderWidth BackgroundColor:nil];
    if (image) {
        [self setImage:image];
    }
}



#pragma mark - Private Function

/**
 cache all the properties
 */
- (void)cachePropertyWithCornerRedius:(CGFloat)cornerRedius
                          ConrnerType:(UIRectCorner)cornerType
                          BorderColor:(UIColor *)borderColor
                          BorderWidth:(CGFloat)borderWidth
                      BackgroundColor:(UIColor *)backgroundColor {
    self.wyh_cornerRadius = cornerRedius;
    self.wyh_cornerTypes = cornerType;
    self.wyh_borderColor = borderColor;
    self.wyh_borderWidth = borderWidth;
    self.wyh_backgroundColor = backgroundColor;
    self.isAutoSet = YES;
    [self setNeedsLayout];
}

/**
 setting the final Corner Image
 */
- (void)settingCornerImage:(UIImage *)image{
    __block CGSize _size = self.bounds.size;
    if (self.isInitFromCircle) {
        self.wyh_cornerRadius = self.bounds.size.height/2;
        self.wyh_cornerTypes = UIRectCornerAllCorners;
        self.wyh_borderWidth = 0;
        self.wyh_backgroundColor = nil;
    }
    wyh_async_concurrent_dispatch(^{
        UIImage *finalImage = [UIImage wyh_getCornerImageFromCornerRadius:self.wyh_cornerRadius Image:image Size:_size RectCornerType:self.wyh_cornerTypes BorderColor:self.wyh_borderColor BorderWidth:self.wyh_borderWidth BackgroundColor:self.wyh_backgroundColor];
        wyh_async_safe_dispatch(^{
            [self setImage:finalImage];
        });
    });
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

- (void)setIsAutoSet:(BOOL)isAutoSet {
    objc_setAssociatedObject(self, @selector(isAutoSet), @(isAutoSet), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isAutoSet {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setIsInitFromCircle:(BOOL)isInitFromCircle {
    objc_setAssociatedObject(self, @selector(isInitFromCircle), @(isInitFromCircle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isInitFromCircle {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

@end
