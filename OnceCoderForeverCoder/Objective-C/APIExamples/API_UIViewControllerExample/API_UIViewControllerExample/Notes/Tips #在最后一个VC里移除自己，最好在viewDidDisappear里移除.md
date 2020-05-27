#  Tips #在最后一个VC里移除自己，最好在viewDidDisappear里移除
```
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"%s",__func__);
    [self removeSelf];
}

///不用等到在下个页面再移除，尤其组件化后，下个界面是无法知道上个界面的名字的，还要手动处理
- (void)removeSelf
{
    NSMutableArray *viewControllers = self.navigationController.viewControllers.mutableCopy;
    for (UIViewController *viewController in self.navigationController.viewControllers) {
        if ([viewController isEqual:self]) {
            [viewControllers removeObject:viewController];
        }
    }
    self.navigationController.viewControllers = [viewControllers copy];
}
```
