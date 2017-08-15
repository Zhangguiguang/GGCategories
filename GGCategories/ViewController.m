//
//  ViewController.m
//  GGCategories
//
//  Created by 张贵广 on 2017/8/12.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "ViewController.h"

static NSString * const TableViewCellIdentifier = @"TableViewCellIdentifier";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSArray *> *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    _tableView = [[UITableView alloc] init];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TableViewCellIdentifier];
    [self.view addSubview:_tableView];
    
    _dataArray = @[@[@"UIWebView+GGNewTab", @"UIWebView_NewTabVC"],
                   @[@"UIImage+GGTint", @"UIImage_TintVC"],
                   @[@"UIView+GGBorder", @"UIView_BorderVC"],
                   
                   ];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _tableView.frame = self.view.frame;
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSArray *data = _dataArray[indexPath.row];
    cell.textLabel.text = data[0];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *data = _dataArray[indexPath.row];
    Class vcClass = NSClassFromString(data[1]);
    UIViewController *vc = [[vcClass alloc] init];
    [self showViewController:vc sender:nil];
}

@end
