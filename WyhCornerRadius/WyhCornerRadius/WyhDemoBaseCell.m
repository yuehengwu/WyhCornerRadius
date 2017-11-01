//
//  WyhDemoBaseCell.m
//  WyhCornerRadius
//
//  Created by wyh on 2017/11/1.
//  Copyright © 2017年 wyh. All rights reserved.
//

#import "WyhDemoBaseCell.h"
#import "wyhCornerRadius.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define Space 10
#define viewWidth ((kWidth - 6*Space)/5)

@interface WyhDemoBaseCell()

@property (nonatomic, strong) NSMutableArray *views;

@end

@implementation WyhDemoBaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithReuseIdentifier:(NSString *)reuseIdentifier{
    WyhDemoBaseCell *cell = [[WyhDemoBaseCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"demo"];
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = 0;
    }
    return self;
}

- (void)setType:(WyhDemoBaseCellType)type {
    [self createViewsWithType:type];
}

- (void)createViewsWithType:(WyhDemoBaseCellType)type {
    
    for (int i = 0; i < 5; i++) {
        switch (type) {
            case WYHImageViewType:
            {
                UIImageView *img = [self createImageViewWithIndex:i];
                [self.views addObject:img];
            } break;
            case WYHButtonType:
            {
                UIButton *button = [self createButtonWithIndex:i];
                [self.views addObject:button];
            } break;
            case WYHLabelType:
            {
                UILabel *label = [self createLabelWithIndex:i];
                [self.views addObject:label];
            } break;
            case WYHViewElseType:
            {
                UIView *view = [self createViewWithIndex:i];
                [self.views addObject:view];
            } break;
            default: break;
        }
    }
    
    [self.views enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.contentView addSubview:(UIView *)obj];
    }];
}

#pragma mark - UIImageView

- (UIImageView *)createImageViewWithIndex:(NSInteger)index {
    UIImageView *img = [[UIImageView alloc]init];
    img.frame = [self configFrameWithIndex:index];
    UIRectCorner rectCorner = [self configRectCornerWithIndex:index];
    [img wyh_autoSetImageCornerRedius:viewWidth/2 ConrnerType:rectCorner Image:[UIImage imageNamed:[NSString stringWithFormat:@"dog%ld",index+1]]];
    return img;
}

#pragma mark - UIButton

- (UIButton *)createButtonWithIndex:(NSInteger)index {
    UIImage *imageNormal = [UIImage imageNamed:[NSString stringWithFormat:@"dog%ld",index+1]];
    UIImage *imageSelected = [UIImage imageNamed:[NSString stringWithFormat:@"dog%ld",(index!=2)?(5-index):1]];
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.frame = [self configFrameWithIndex:index];
    [btn addTarget:self action:@selector(btnClickAction:) forControlEvents:(UIControlEventTouchUpInside)];
    //设置button的normal状态图片
    [btn wyh_CornerRadius:viewWidth/2 Image:imageNormal  RectCornerType:[self configRectCornerWithIndex:index] BorderColor:[UIColor blueColor] BorderWidth:3 BackgroundColor:nil UIControlState:(UIControlStateNormal)];
    //设置button的selected状态图片
    [btn wyh_CornerRadius:viewWidth/2 Image:imageSelected  RectCornerType:[self configRectCornerWithIndex:index] BorderColor:[UIColor redColor] BorderWidth:3 BackgroundColor:nil UIControlState:(UIControlStateSelected)];
    return btn;
}

#pragma mark - UILabel

- (UILabel *)createLabelWithIndex:(NSInteger)index {
    UILabel *label = [[UILabel alloc]init];
    label.text = [NSString stringWithFormat:@"%ld",index+1];
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = [self configFrameWithIndex:index];
    UIRectCorner rectCorner = [self configRectCornerWithIndex:index];
    [label wyh_CornerRadius:viewWidth/2 Image:nil RectCornerType:rectCorner BorderColor:[UIColor magentaColor] BorderWidth:2 BackgroundColor:nil];
    return label;
}

#pragma mark - UIView

- (UIView *)createViewWithIndex:(NSInteger)index {
    UIView *view = [[UIView alloc]init];
    view.frame = [self configFrameWithIndex:index];
    UIRectCorner rectCorner = [self configRectCornerWithIndex:index];
    UIColor *randomColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    [view wyh_CornerRadius:viewWidth/2 RectCornerType:rectCorner BackgroundColor:randomColor];
    return view;
}

- (UIRectCorner)configRectCornerWithIndex:(NSInteger)index {
    UIRectCorner rectCorner;
    switch (index) {
        case 0:
            rectCorner = UIRectCornerTopLeft; break;
        case 1:
            rectCorner = UIRectCornerTopRight; break;
        case 2:
            rectCorner = UIRectCornerBottomLeft; break;
        case 3:
            rectCorner = UIRectCornerBottomRight; break;
        default:
            rectCorner = UIRectCornerAllCorners; break;
    }
    return rectCorner;
}

- (CGRect)configFrameWithIndex:(NSInteger)index {
    CGRect rect = CGRectZero;
    return rect = CGRectMake(Space+index*(Space+viewWidth), (DemoCellHeight - viewWidth)/2, viewWidth, viewWidth);
}

- (void)btnClickAction:(UIButton *)sender {
    sender.selected = !sender.selected;
}

#pragma mark - lazy

- (NSMutableArray *)views {
    if (!_views) {
        _views = [NSMutableArray new];
    }
    return _views;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
