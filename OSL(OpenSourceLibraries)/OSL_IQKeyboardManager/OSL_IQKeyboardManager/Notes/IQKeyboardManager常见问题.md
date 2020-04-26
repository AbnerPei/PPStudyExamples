# IQKeyboardManager常见问题

## 1. IQKeyboardManager键盘不弹出
- 看是否有如下代码
```
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    ///TableView一滑动就隐藏键盘，所以导致不显示「这种自己代码不注意的情况」
    [self.view endEditing:YES];
}
```
- 注意viewController的生命周期，尤其前后两个界面都有键盘处理

A-贺卡留言
```
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.uploadImageManager = nil;
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;

}

///这里不能写在A的`viewDidDisappear:`方法里,因为A的`viewDidDisappear:`后于A的`viewWillAppear:`，又设置为NO了
///详见`APIExamples`----`API_UIViewControllerExample`
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [IQKeyboardManager sharedManager].enable = NO;
}

```


B-提交订单页面

```
- (void)viewWillAppear:(BOOL)animated
{
    [IQKeyboardManager sharedManager].enable = YES;
    IQKeyboardManager.sharedManager.toolbarDoneBarButtonItemText = @"完成";
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    [IQKeyboardManager sharedManager].previousNextDisplayMode = IQPreviousNextDisplayModeAlwaysHide;
    [super viewWillAppear:animated];
    
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [IQKeyboardManager sharedManager].enable = NO;
    
    ///移除该vc
    if (self.pushToType == KLOrderConfirmVCPushToTypePaySuccess || self.pushToType == KLOrderConfirmVCPushToTypeOrderList) {
        NSMutableArray *viewControllers = self.navigationController.viewControllers.mutableCopy;
        for (UIViewController *viewController in self.navigationController.viewControllers) {
            if ([viewController isEqual:self]) {
                [viewControllers removeObject:viewController];
            }
        }
        self.navigationController.viewControllers = [viewControllers copy];
    }
    
}

```
