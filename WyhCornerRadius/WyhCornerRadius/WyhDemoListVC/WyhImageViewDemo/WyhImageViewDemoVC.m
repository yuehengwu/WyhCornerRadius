//
//  WyhImageViewDemoVC.m
//  WyhCornerRadius
//
//  Created by wyh on 2017/11/1.
//  Copyright © 2017年 wyh. All rights reserved.
//

#import "WyhImageViewDemoVC.h"

#import "WyhImageViewDemoCell.h"

@interface WyhImageViewDemoVC ()

@property (nonatomic, strong) NSMutableArray *serverImageUrls;
@property (nonatomic, strong) NSMutableArray *localImageUrls;


@end

@implementation WyhImageViewDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = (self.isNeedRequestServer)?@"set URL image":@"set local image";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.offTableView.delegate = self;
    self.offTableView.dataSource = self;
    
    for (int i = 0; i < 100; i++) {
        @autoreleasepool {
            NSNumber *index = @(i);
            [self.dataSource addObject:index];
        }
    }
    
//    [self.tableView reloadData];
}

- (void)changeRenderingModeFromSubClass {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return DemoCellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseID;
    BOOL off_sc = NO;
    if ([tableView isEqual:self.tableView]) {
        reuseID = @"_WyhImageViewDemoCell";
        off_sc = NO;
    }else {
        reuseID = @"WyhImageViewDemoCell";
        off_sc = YES;
    }
    WyhImageViewDemoCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [WyhImageViewDemoCell cellWithReuseIdentifier:reuseID off_scMode:off_sc];
    }
    NSArray *dataArr ;
    if (self.isNeedRequestServer) {
        dataArr = [self serverImageUrlsFromRandomRange];
    }else {
        dataArr = [self localImageNamesFromRandomRange];
    }
    [cell setUrlArr:dataArr];
    
    return cell;
}

- (NSArray *)serverImageUrlsFromRandomRange{
    int random = 0+arc4random()%(20+1);
    return [self.serverImageUrls subarrayWithRange:NSMakeRange(random, 5)];
}

- (NSArray *)localImageNamesFromRandomRange{
    int random = 0+arc4random()%(5+1);
    return [self.localImageUrls subarrayWithRange:NSMakeRange(random, 5)];
}

- (NSMutableArray *)serverImageUrls {
    if (!_serverImageUrls) {
        _serverImageUrls = [NSMutableArray new];
        for (int i = 0; i < 25; i++) {
//            NSString *str = [NSString stringWithFormat:@"http://t1.mmonly.cc/uploads/tu/bj/tp/032/%d.jpg",i+1]; //Invalid url.
            NSString *str = [NSString stringWithFormat:@"http://upload-images.jianshu.io/upload_images/4097230-586b3d9f46dc5a18.jpg?imageMogr2/auto-orient/strip%@7CimageView2/2/w/1240",@"%"];
//            NSLog(@"%@",str);
            NSURL *url = [NSURL URLWithString:str];
            [_serverImageUrls addObject:url];
        }
    }
    return _serverImageUrls;
}

- (NSMutableArray *)localImageUrls {
    if (!_localImageUrls) {
        _localImageUrls = [NSMutableArray new];
        for (int i = 0; i < 10; i++) {
            NSString *name = [NSString stringWithFormat:@"local%d",i+1];
            [_localImageUrls addObject:name];
        }
    }
    return _localImageUrls;
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
