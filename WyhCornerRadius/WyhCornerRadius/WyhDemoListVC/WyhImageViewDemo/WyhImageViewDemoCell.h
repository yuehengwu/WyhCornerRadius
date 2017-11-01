//
//  WyhImageViewDemoCell.h
//  WyhCornerRadius
//
//  Created by wyh on 2017/11/1.
//  Copyright © 2017年 wyh. All rights reserved.
//

#import <UIKit/UIKit.h>

static CGFloat const DemoCellHeight = 90;

@interface WyhImageViewDemoCell : UITableViewCell

+(instancetype)cellWithReuseIdentifier:(NSString *)reuseIdentifier off_scMode:(BOOL)isOff_sc;

- (void)setUrlArr:(NSArray *)urls;

@end
