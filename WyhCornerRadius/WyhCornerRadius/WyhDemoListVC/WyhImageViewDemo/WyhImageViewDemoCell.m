//
//  WyhImageViewDemoCell.m
//  WyhCornerRadius
//
//  Created by wyh on 2017/11/1.
//  Copyright © 2017年 wyh. All rights reserved.
//

#import "WyhImageViewDemoCell.h"
#import "wyhCornerRadius.h"
#import "UIImageView+WebCache.h"

#define Space 10
#define viewWidth ((kWidth - 6*Space)/5)
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height


@interface WyhImageViewDemoCell ()

@property (nonatomic, strong) NSMutableArray *ImageViews;
@property (nonatomic, assign) BOOL isOffscreen;

@end

@implementation WyhImageViewDemoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype)cellWithReuseIdentifier:(NSString *)reuseIdentifier off_scMode:(BOOL)isOff_sc {
    WyhImageViewDemoCell *cell = [[WyhImageViewDemoCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
    cell.isOffscreen = isOff_sc;
    [cell createImageViews];
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)createImageViews{
    
    for (int index = 0; index < 5; index++) {
        UIImageView *img = [[UIImageView alloc]init];

        img.frame = [self configFrameWithIndex:index];
        if (!self.isOffscreen) {
            [img wyh_autoSetImageCornerRedius:viewWidth/2 ConrnerType:(UIRectCornerAllCorners) BorderColor:[UIColor greenColor] BorderWidth:1 Image:nil];
        }else {
            img.layer.borderColor = [UIColor redColor].CGColor;
            img.layer.borderWidth = 1;
            img.layer.masksToBounds = YES;
            img.layer.cornerRadius = viewWidth/2;
        }
        [self.ImageViews addObject:img];
        [self.contentView addSubview:img];
    }
}

- (CGRect)configFrameWithIndex:(NSInteger)index {
    CGRect rect = CGRectZero;
    return rect = CGRectMake(Space+index*(Space+viewWidth), (DemoCellHeight - viewWidth)/2, viewWidth, viewWidth);
}

- (void)setUrlArr:(NSArray *)urls {
    [self.ImageViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *img = (UIImageView *)obj;
        if ([urls[0] isKindOfClass:[NSURL class]]) {
            [img sd_setImageWithURL:urls[idx] placeholderImage:[UIImage imageNamed:@"glb_placeholder"]];
        }else {
            [img wyh_autoSetImageCornerRedius:viewWidth/2 ConrnerType:(UIRectCornerAllCorners) BorderColor:[UIColor greenColor] BorderWidth:1 Image:[UIImage imageNamed:urls[idx]]];
        }
    }];
}

- (NSMutableArray *)ImageViews {
    if (!_ImageViews) {
        _ImageViews = [NSMutableArray new];
    }
    return _ImageViews;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
