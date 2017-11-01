//
//  WyhDemoBaseVC.m
//  WyhCornerRadius
//
//  Created by wyh on 2017/11/1.
//  Copyright © 2017年 wyh. All rights reserved.
//

#import "WyhDemoBaseVC.h"

@interface WyhDemoBaseVC ()

@end

@implementation WyhDemoBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.offTableView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"normalModel" style:(UIBarButtonItemStylePlain) target:self action:@selector(changeRenderingMode:)];
    
}

- (void)changeRenderingMode:(UIBarButtonItem *)barItem{
    self.isOff_ScreenRender = !self.isOff_ScreenRender;
    self.offTableView.hidden = !self.isOff_ScreenRender;
    self.tableView.hidden = self.isOff_ScreenRender;
    if (self.isOff_ScreenRender) {
        [barItem setTitle:@"off-sModel"];
        [barItem setTintColor:[UIColor redColor]];
    }else {
        [barItem setTitle:@"normalModel"];
        [barItem setTintColor:[UIColor blueColor]];
    }
    [self changeRenderingModeFromSubClass];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    }
    return _tableView;
}

- (UITableView *)offTableView {
    if (!_offTableView) {
        _offTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        _offTableView.hidden = YES;
    }
    return _offTableView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
