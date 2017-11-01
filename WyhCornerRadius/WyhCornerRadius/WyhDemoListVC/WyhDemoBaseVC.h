//
//  WyhDemoBaseVC.h
//  WyhCornerRadius
//
//  Created by wyh on 2017/11/1.
//  Copyright © 2017年 wyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WyhDemoBaseVC : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITableView *offTableView;

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, assign) BOOL isOff_ScreenRender;


//- (void)changeRenderingMode;

- (void)changeRenderingModeFromSubClass;

@end
