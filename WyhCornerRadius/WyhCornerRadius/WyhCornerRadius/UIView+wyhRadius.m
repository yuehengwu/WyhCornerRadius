//
//  UIView+wyhRadius.m
//  WyhCornerRadius
//
//  Created by wyh on 2017/10/31.
//  Copyright © 2017年 wyh. All rights reserved.
//

#import "UIView+wyhRadius.h"
#import "UIImage+wyhRadius.h"
#import <objc/runtime.h>
#import "wyhRadiusConst.h"

@interface UIView ()

//@property (nonatomic, assign) CGFloat wyh_cornerRadius;
//@property (nonatomic, assign) UIRectCorner wyh_cornerTypes;
//@property (nonatomic, strong) UIColor *wyh_borderColor;
//@property (nonatomic, assign) CGFloat wyh_borderWidth;
//@property (nonatomic, strong) UIColor *wyh_backgroundColor;

@end

@implementation UIView (wyhRadius)

//- (void)wyh_layoutSubviews {
//    [self wyh_layoutSubviews];
//}
//
//- (void)wyh_dealloc {
//    [self wyh_dealloc];
//}

#pragma mark - Publick Function

- (void)wyh_CornerRadius:(CGFloat)cornerRadius
          RectCornerType:(UIRectCorner)rectCornerType {
    [self wyh_setCornerRadius:cornerRadius Image:nil Size:self.bounds.size RectCornerType:rectCornerType BorderColor:nil BorderWidth:0 BackgroundColor:nil];
}

- (void)wyh_CornerRadius:(CGFloat)cornerRadius
          RectCornerType:(UIRectCorner)rectCornerType
         BackgroundColor:(UIColor *)backgroundColor {
    [self wyh_setCornerRadius:cornerRadius Image:nil Size:self.bounds.size RectCornerType:rectCornerType BorderColor:nil BorderWidth:0 BackgroundColor:backgroundColor];
}

- (void)wyh_CornerRadius:(CGFloat)cornerRadius
                   Image:(UIImage *)image
          RectCornerType:(UIRectCorner)rectCornerType {
    [self wyh_setCornerRadius:cornerRadius Image:image Size:self.bounds.size RectCornerType:rectCornerType BorderColor:nil BorderWidth:0 BackgroundColor:nil];
}

- (void)wyh_CornerRadius:(CGFloat)cornerRadius
                   Image:(UIImage *)image
          RectCornerType:(UIRectCorner)rectCornerType
             BorderColor:(UIColor *)borderColor
             BorderWidth:(CGFloat)borderWidth
         BackgroundColor:(UIColor *)backgroundColor {
    [self wyh_setCornerRadius:cornerRadius Image:image Size:self.bounds.size RectCornerType:rectCornerType BorderColor:borderColor BorderWidth:borderWidth BackgroundColor:backgroundColor];
}

- (void)wyh_CornerRadius:(CGFloat)cornerRadius
                   Image:(UIImage *)image
          RectCornerType:(UIRectCorner)rectCornerType
             BorderColor:(UIColor *)borderColor
             BorderWidth:(CGFloat)borderWidth
         BackgroundColor:(UIColor *)backgroundColor
          UIControlState:(UIControlState)controlState {
    [self wyh_setCornerRadius:cornerRadius Image:image Size:self.bounds.size RectCornerType:rectCornerType BorderColor:borderColor BorderWidth:borderWidth BackgroundColor:backgroundColor UIControlState:(controlState)];
}

- (void)wyh_CornerRadius:(CGFloat)cornerRadius
                   Image:(UIImage *)image
                    Size:(CGSize)size
          RectCornerType:(UIRectCorner)rectCornerType
             BorderColor:(UIColor *)borderColor
             BorderWidth:(CGFloat)borderWidth
         BackgroundColor:(UIColor *)backgroundColor
          UIControlState:(UIControlState)controlState {
    [self wyh_setCornerRadius:cornerRadius Image:image Size:size RectCornerType:rectCornerType BorderColor:borderColor BorderWidth:borderWidth BackgroundColor:backgroundColor UIControlState:(controlState)];
}

#pragma mark - Private Fuction

- (void)wyh_setCornerRadius:(CGFloat)cornerRadius
                      Image:(UIImage *)image
                       Size:(CGSize)size
             RectCornerType:(UIRectCorner)rectCornerType
                BorderColor:(UIColor *)borderColor
                BorderWidth:(CGFloat)borderWidth
            BackgroundColor:(UIColor *)backgroundColor {
    [self wyh_setCornerRadius:cornerRadius Image:image Size:size RectCornerType:rectCornerType BorderColor:borderColor BorderWidth:borderWidth BackgroundColor:backgroundColor UIControlState:(UIControlStateNormal)];
}

- (void)wyh_setCornerRadius:(CGFloat)cornerRadius
                      Image:(UIImage *)image
                       Size:(CGSize)size
             RectCornerType:(UIRectCorner)rectCornerType
                BorderColor:(UIColor *)borderColor
                BorderWidth:(CGFloat)borderWidth
            BackgroundColor:(UIColor *)backgroundColor
             UIControlState:(UIControlState)controlState{
    
//    self.wyh_cornerRadius = cornerRadius;
//    self.wyh_cornerTypes = rectCornerType;
//    self.wyh_borderColor = borderColor;
//    self.wyh_borderWidth = borderWidth;
//    self.wyh_backgroundColor = backgroundColor;
    
    __block CGSize _size = size;
    
    __weak typeof(self) weakSelf = self;
    wyh_async_concurrent_dispatch(^{
    
        if (CGSizeEqualToSize(_size, CGSizeZero)) {
            if (CGSizeEqualToSize(weakSelf.bounds.size, CGSizeZero)) {
                return ;
            }
            wyh_async_safe_dispatch(^{
                _size = weakSelf.bounds.size;
            });
        }
        UIImage *currentImage = [UIImage wyh_getCornerImageFromCornerRadius:cornerRadius Image:image Size:_size RectCornerType:rectCornerType BorderColor:borderColor BorderWidth:borderWidth BackgroundColor:backgroundColor];
        
        wyh_async_safe_dispatch(^{
            if ([self isKindOfClass:[UIImageView class]]) {
                ((UIImageView *)self).image = currentImage;
            } else if ([self isKindOfClass:[UIButton class]]) {
                [((UIButton *)self) setBackgroundImage:currentImage forState:controlState];
            } else if ([self isKindOfClass:[UILabel class]]) {
                self.layer.backgroundColor = [UIColor colorWithPatternImage:currentImage].CGColor; //Mark a memory problem
                
            } else {
                self.layer.contents = (__bridge id _Nullable)(currentImage.CGImage);
            }
        });
    });
    
}

#pragma mark - Property

//- (void)setIsHadAddObserver:(BOOL)isHadAddObserver {
//    objc_setAssociatedObject(self, @selector(isHadAddObserver), @(isHadAddObserver), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (BOOL)isHadAddObserver {
//    return [objc_getAssociatedObject(self, _cmd) boolValue];
//}
//
//- (void)setWyh_cornerRadius:(CGFloat)wyh_cornerRadius {
//    objc_setAssociatedObject(self, @selector(wyh_cornerRadius), @(wyh_cornerRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (CGFloat)wyh_cornerRadius{
//    return [objc_getAssociatedObject(self, _cmd) doubleValue];
//}
//
//- (void)setWyh_cornerTypes:(UIRectCorner)wyh_cornerTypes {
//    objc_setAssociatedObject(self, @selector(wyh_cornerTypes), @(wyh_cornerTypes), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (UIRectCorner)wyh_cornerTypes {
//    return [objc_getAssociatedObject(self, _cmd) unsignedIntegerValue];
//}
//
//- (void)setWyh_borderColor:(UIColor *)wyh_borderColor {
//    objc_setAssociatedObject(self, @selector(wyh_borderColor), wyh_borderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (UIColor *)wyh_borderColor {
//    return objc_getAssociatedObject(self, _cmd);
//}
//
//- (void)setWyh_backgroundColor:(UIColor *)wyh_backgroundColor {
//    objc_setAssociatedObject(self, @selector(wyh_backgroundColor), wyh_backgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (UIColor *)wyh_backgroundColor {
//    return objc_getAssociatedObject(self, _cmd);
//}
//
//- (void)setWyh_borderWidth:(CGFloat)wyh_borderWidth {
//    objc_setAssociatedObject(self, @selector(wyh_borderWidth), @(wyh_borderWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (CGFloat)wyh_borderWidth {
//    return [objc_getAssociatedObject(self, _cmd) doubleValue];
//}

@end
