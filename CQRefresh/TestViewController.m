//
//  TestViewController.m
//  CQRefresh
//
//  Created by 超群 on 16/8/31.
//  Copyright © 2016年 超群. All rights reserved.
//

#import "TestViewController.h"
#import "CQMJPullHeader.h"
#import <MJRefresh.h>

@interface TestViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView* tableView;
@property (strong, nonatomic) NSMutableArray* dataArray;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"🙃内涵段子🙃";
    
    _dataArray = @[@"内",@"涵",@"段",@"子"].mutableCopy;
    
    [self tableView];
    
    [self.tableView.mj_header beginRefreshing];
}

- (UITableView *)tableView {
    if (nil == _tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_width, kScreen_height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.mj_header = [CQMJPullHeader headerWithRefreshingBlock:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self reloadData];
            });
        }];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.f;
}

- (UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* identifier = @"identifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = _dataArray[indexPath.row];
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

- (void)reloadData {
    [_dataArray addObject:[NSString stringWithFormat:@"%d",(int)arc4random_uniform(1000)]];
    [_tableView reloadData];
    [_tableView.mj_header endRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
