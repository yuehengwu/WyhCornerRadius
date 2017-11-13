//
//  WyhDemoListVC.h
//  WyhCornerRadius
//
//  Created by wyh on 2017/11/3.
//  Copyright © 2017年 wyh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DemoListType) {
    WyhImageViewDemoType = 0,
    WyhButtomDemoType ,
    WyhLabelDemoType ,
    WyhViewDemoType ,
};

@interface WyhDemoListVC : UIViewController

@property (nonatomic, assign) DemoListType type;

@end
