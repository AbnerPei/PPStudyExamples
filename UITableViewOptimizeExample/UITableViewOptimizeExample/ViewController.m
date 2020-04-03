//
//  ViewController.m
//  UITableViewOptimizeExample
//
//  Created by PPAbner on 2019/10/16.
//  Copyright © 2019 PPAbner. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<NSIndexPath *> *needLoadIndexPathArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    if (self.needLoadIndexPathArray.count > 0 && [self.needLoadIndexPathArray indexOfObject:indexPath] == NSNotFound) {
        return cell;
    }
    cell.textLabel.text = NSStringFromRange(NSMakeRange(indexPath.section, indexPath.row));
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"%s",__func__);
}// any offset changes
//- (void)scrollViewDidZoom:(UIScrollView *)scrollView API_AVAILABLE(ios(3.2))
//{
//    NSLog(@"%s",__func__);
//}// any zoom scale changes

// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"%s",__func__);
}
// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset API_AVAILABLE(ios(5.0))
{
    NSLog(@"%s velocity %@ targetContentOffset %@",__func__,NSStringFromCGPoint(velocity),NSStringFromCGPoint(*targetContentOffset));
    
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:CGPointMake(0, targetContentOffset->y)];
    NSIndexPath *currentIndexPath = [[self.tableView indexPathsForVisibleRows] firstObject];
    
    NSInteger skipCount = 8;
    if (labs(currentIndexPath.row - indexPath.row) > skipCount) {
        NSArray<NSIndexPath *> *tempIndexPathArray = [self.tableView indexPathsForRowsInRect:CGRectMake(0, targetContentOffset->y, self.tableView.frame.size.width, self.tableView.frame.size.height)];
        NSMutableArray<NSIndexPath *> *arr = [NSMutableArray arrayWithArray:tempIndexPathArray];
        if (velocity.y < 0) {
            //向下滑
            NSIndexPath *lastBottomIndexPath = [tempIndexPathArray lastObject];
            if (lastBottomIndexPath.row > 3) {
                NSIndexPath *indexPath3 = [NSIndexPath indexPathForRow:lastBottomIndexPath.row - 3 inSection:0];
                NSIndexPath *indexPath2 = [NSIndexPath indexPathForRow:lastBottomIndexPath.row - 2 inSection:0];
                NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:lastBottomIndexPath.row - 1 inSection:0];
                [arr addObject:indexPath3];
                [arr addObject:indexPath2];
                [arr addObject:indexPath1];
            }
            [self.needLoadIndexPathArray addObjectsFromArray:arr];
        }
    }
    
}
// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"%s,decelerate %d",__func__,decelerate);
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%s",__func__);
}// called on finger up as we are moving

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%s",__func__);
}// called when scroll view grinds to a halt

- (NSMutableArray<NSIndexPath *> *)needLoadIndexPathArray
{
    if (!_needLoadIndexPathArray) {
        _needLoadIndexPathArray = [NSMutableArray array];
    }
    return _needLoadIndexPathArray;
}

@end

/*
2019-10-16 09:54:45.827930+0800 UITableViewOptimizeExample[1485:71388] -[ViewController scrollViewWillBeginDragging:]
2019-10-16 09:54:45.828207+0800 UITableViewOptimizeExample[1485:71388] -[ViewController scrollViewDidScroll:]
2019-10-16 09:54:47.069156+0800 UITableViewOptimizeExample[1485:71388] -[ViewController scrollViewWillEndDragging:withVelocity:targetContentOffset:]
2019-10-16 09:54:47.069395+0800 UITableViewOptimizeExample[1485:71388] -[ViewController scrollViewDidEndDragging:willDecelerate:]
 */
