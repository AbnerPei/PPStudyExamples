//
//  ViewController.m
//  HeaderViewStretch
//
//  Created by PPAbner on 2019/10/12.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#import "ViewController.h"
#import "HeaderContentBgView.h"
#import <MJRefresh/MJRefresh.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *headerBgImageView;
@property (nonatomic, assign) CGFloat headerBgImageViewHeight;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIImage *bgImage = [UIImage imageNamed:@"bg-mine"];
    _headerBgImageView = [[UIImageView alloc] initWithImage:bgImage];
    [self.view addSubview:_headerBgImageView];
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    _headerBgImageView.frame = CGRectMake(0, 0, screenW, bgImage.size.height * 0.6);
    _headerBgImageViewHeight = bgImage.size.height * 0.6;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, UIScreenHeight()) style:(UITableViewStyleGrouped)];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    HeaderContentBgView *contentBgView = [[HeaderContentBgView alloc] initWithFrame:CGRectMake(0, 0, screenW, 170)];
    _tableView.tableHeaderView = contentBgView;
    
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"下拉刷新了");
        
    }];
}



#pragma mark --- UITableViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat contentOffsety = scrollView.contentOffset.y;
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;

    NSLog(@"contentOffsety is %f",contentOffsety);
    if (contentOffsety < 0) {
        CGRect rect = _headerBgImageView.frame;
        rect.size.height = _headerBgImageViewHeight-contentOffsety;
        rect.size.width = screenW* (_headerBgImageViewHeight-contentOffsety)/_headerBgImageViewHeight;
        rect.origin.x =  -(rect.size.width-screenW)/2;
        rect.origin.y = 0;
        _headerBgImageView.frame = rect;
    }else{
        CGRect rect = _headerBgImageView.frame;
        rect.size.height = _headerBgImageViewHeight;
        rect.size.width = screenW;
        rect.origin.x = 0;
        rect.origin.y = -contentOffsety;
        _headerBgImageView.frame = rect;
        
    }
}

#pragma mark --- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"1----%ld",(long)indexPath.row];
    return cell;
}

#pragma mark --- private method

static inline CGFloat UIScreenHeight(){
    return [UIScreen mainScreen].bounds.size.height;
}

static inline BOOL isiPhoneXSeries(){
    return (UIScreenHeight() == 812) || (UIScreenHeight() == 896);
}

static inline CGFloat statusBarHeight(){
    return isiPhoneXSeries() ? 44 : 20;
}

static inline CGFloat navgationBarHeight(){
    return isiPhoneXSeries() ? 88 : 64;
}


@end
