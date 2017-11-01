//
//  ViewController.m
//  WyhCornerRadius
//
//  Created by wyh on 2017/10/31.
//  Copyright © 2017年 wyh. All rights reserved.
//

#import "ViewController.h"
#import "WyhDemoBaseCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray<UIView *> *sectionViewsArr;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tableView];
}

#pragma mark - delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WyhDemoBaseCellType type = indexPath.section;
    WyhDemoBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"demo"];
    if (!cell) {
        cell = [WyhDemoBaseCell cellWithReuseIdentifier:@"demo"];
    }
    [cell setType:type];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.sectionViewsArr[section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return DemoCellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

#pragma mark - Lazy

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray<UIView *> *)sectionViewsArr {
    if (!_sectionViewsArr) {
        _sectionViewsArr = [NSMutableArray new];
        NSArray *names = @[@"  UIImageView",
                           @"  UIButton",
                           @"  UILabel",
                           @"  UIView"];
        for (int i = 0; i < 4; i++) {
            UILabel *label = [[UILabel alloc]init];
            label.text = names[i];
            label.textColor = [UIColor lightGrayColor];
            [_sectionViewsArr addObject:label];
        }
    }
    return _sectionViewsArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
