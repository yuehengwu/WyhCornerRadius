//
//  WyhDemoBaseCell.h
//  WyhCornerRadius
//
//  Created by wyh on 2017/11/1.
//  Copyright © 2017年 wyh. All rights reserved.
//

#import <UIKit/UIKit.h>

static CGFloat const DemoCellHeight = 100;

typedef NS_ENUM(NSInteger,WyhDemoBaseCellType) {
    WYHImageViewType = 0,
    WYHButtonType = 1,
    WYHLabelType = 2,
    WYHViewElseType = 3,
};

@interface WyhDemoBaseCell : UITableViewCell

+ (instancetype)cellWithReuseIdentifier:(NSString *)reuseIdentifier;

@property (nonatomic, assign) WyhDemoBaseCellType type;

@end
