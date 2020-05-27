//
//  ViewController.m
//  API_UIBezierPathExamples
//
//  Created by PPAbner on 2020/1/14.
//  Copyright © 2020 艾波儿. All rights reserved.
//

#import "ViewController.h"
#import "LineCapStyleViewController.h"
#import "LineJoinStyleViewController.h"

#define k_isiPhoneXSeries ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896)
#define k_NAVIGATIONBAR_HEIGHT  (k_isiPhoneXSeries ? 88 : 64)

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, copy) NSArray<NSString *> *titles;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

#pragma mark --- life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, k_NAVIGATIONBAR_HEIGHT, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - k_NAVIGATIONBAR_HEIGHT) style:(UITableViewStylePlain)];
    [self.view addSubview:_tableView];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
    self.titles = @[
        @"lineCapStyle",
        @"lineJoinStyle"
    ];

    ///@property(nonatomic) CGLineCap lineCapStyle;
    ///@property(nonatomic) CGLineJoin lineJoinStyle;
}

#pragma mark --- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (self.titles.count > indexPath.row) {
        cell.textLabel.text = self.titles[indexPath.row];
    }
    
    return cell;
}

#pragma mark --- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.titles.count > indexPath.row) {
        NSString *title = self.titles[indexPath.row];
        if ([title isEqualToString:@"lineCapStyle"]) {
            ///
            LineCapStyleViewController *vc = [[LineCapStyleViewController alloc] init];
            vc.title = title;
            [self.navigationController pushViewController:vc animated:YES];
        }else if ([title isEqualToString:@"lineJoinStyle"]){
            ///
            LineJoinStyleViewController *vc = [[LineJoinStyleViewController alloc] init];
            vc.title = title;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}
@end
