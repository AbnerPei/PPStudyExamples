//
//  ViewController.m
//  FlowLayoutExamples
//
//  Created by PPAbner on 2019/6/13.
//  Copyright © 2019 com.ppabner.www. All rights reserved.
//

#import "ViewController.h"
#import "KLLinerFlowLayout.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    KLLinerFlowLayout *flowLayout = [[KLLinerFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *colV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 120, [UIScreen mainScreen].bounds.size.width, 260) collectionViewLayout:flowLayout];
    [self.view addSubview:colV];
    colV.dataSource = self;
    colV.delegate = self;
    [colV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ppcell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ppcell" forIndexPath:indexPath];
    switch (indexPath.item) {
        case 0:
            cell.contentView.backgroundColor = [UIColor yellowColor];
            break;
        case 1:
            cell.contentView.backgroundColor = [UIColor blackColor];
            break;
        case 2:
            cell.contentView.backgroundColor = [UIColor redColor];
            break;
        case 3:
            cell.contentView.backgroundColor = [UIColor purpleColor];
            break;
        case 4:
            cell.contentView.backgroundColor = [UIColor blueColor];
            break;
            
        default:
            break;
    }
    return cell;
}


@end
