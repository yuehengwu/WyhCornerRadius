//
//  ViewController.m
//  WyhCornerRadius
//
//  Created by wyh on 2017/10/31.
//  Copyright © 2017年 wyh. All rights reserved.
//

#import "ViewController.h"
#import "WyhDemoBaseCell.h"
#import "WyhImageViewDemoVC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray<UIView *> *sectionViewsArr;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UILabel *sectionLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"WyhCornerRadius";
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
    return 30;
}

- (void)clickSection:(UITapGestureRecognizer *)tap {
    UILabel *label = (UILabel *)tap.view;
    if ([_sectionViewsArr indexOfObject:label] == NSNotFound) {
        return;
    }
    NSInteger index = [_sectionViewsArr indexOfObject:label];
    switch (index) {
        case 0:
        {
            WyhImageViewDemoVC *imgVC = [[WyhImageViewDemoVC alloc]init];
            imgVC.isNeedRequestServer = YES;
            [self.navigationController pushViewController:imgVC animated:YES];
        }
            break;
        case 1:
        {
            WyhImageViewDemoVC *imgVC = [[WyhImageViewDemoVC alloc]init];
            imgVC.isNeedRequestServer = NO;
            [self.navigationController pushViewController:imgVC animated:YES];
        } break;
        default:
            break;
    }
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
                           @"  UIButton(Try to click icon)",
                           @"  UILabel",
                           @"  UIView"];
        for (int i = 0; i < 4; i++) {
            UILabel *sectionLabel = [[UILabel alloc]init];
            sectionLabel.textColor = [UIColor whiteColor];
            sectionLabel.backgroundColor = [UIColor grayColor];
            sectionLabel.text = names[i];
            UILabel *go = [[UILabel alloc]init];
            go.textAlignment = NSTextAlignmentRight;
            if (i==0) go.text = @">";
            go.textColor = [UIColor lightGrayColor];
            go.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 30, 0, 20, 30);
            [sectionLabel addSubview:go];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickSection:)];
            sectionLabel.userInteractionEnabled = true;
            [sectionLabel addGestureRecognizer:tap];
            [_sectionViewsArr addObject:sectionLabel];
        }
    }
    return _sectionViewsArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
