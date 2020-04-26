# IQKeyboardManager与YYTextView的常见问题

## 1. YYTextView粘贴复制弹menu时键盘自动隐藏，menu也不显示的问题处理
> 参考[让IQKeyboardManager兼容YYTextView框架](https://www.xsd.me/YYText_IQKeyboardManager_Bug.html)

具体代码如下：
```
[[IQKeyboardManager sharedManager].touchResignedGestureIgnoreClasses addObject:NSClassFromString(@"YYTextContainerView")];
```
## 
